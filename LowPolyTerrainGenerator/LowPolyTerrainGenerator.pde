import java.awt.Robot;
import javafx.stage.Screen;
import picking.*;
import shapes3d.*;

PApplet app = this;

int gridLength = 100;
int gridWidth = 100;
int tileSize = 20;
float[][] heights = new float[gridLength][gridWidth];
float moveSpeed = 5;

int treeCount = 30;
int grassCount = 0;

PImage target0;
PImage target1;
PImage target2;
PImage target3;
PImage target4;
PShape revolver1;
PShape tree1;
PShape tree2;
PShape grass1;
PShape grass2;
PShape grass3;
PShape grass4;
PShape dryGrass1;
PShape dryGrass2;
PShape dryGrass3;
PShape dryGrass4;
Robot robot;

void setup() {
    noCursor();
    frameRate(1000);
    try {
        robot = new Robot();
    }
    catch (Exception e) {
    }
    fullScreen(P3D, 2);
    //size(800, 600, P3D);
    //println(surface);
    for (int i = 0; i < gridLength; i++) {
        for (int j = 0; j < gridWidth; j++) {
            heights[i][j] = 1000 * noise(i/100.0, j/100.0);
        }
    }

    loadGameShapes();
    generateEnvironment();
}

void generateEnvironment() {
    for (int i = 0; i < treeCount; i++) {
        models = (Model[]) append(models, new Tree());
    }
    for (int i = 0; i < grassCount; i++) {
        models = (Model[]) append(models, new Grass());
    }
}

boolean doneFrame = true;
void mouseMoved() {
    if (!(mouseX == displayWidth/2 && mouseY == displayHeight/2)) {
        while (true) {
            if (doneFrame) {
                break;
            }
        }
        PVector moveAngle = PVector.fromAngle(atan2(pmouseY - mouseY, pmouseX - mouseX)).mult(0.05);
        targetXAngle += moveAngle.x;
        targetYAngle += moveAngle.y;
        targetYAngle = min(PI/2, max(-PI/2, targetYAngle));
    }
}

float targetXAngle = 0;
float targetYAngle = 0;
//Horizontal camera angle.
float xAngle = 0;
//Vertical camera angle.
float yAngle = 0;

void loadGameShapes() {
    target0 = loadImage("PointerIcons/target0.png");
    target1 = loadImage("PointerIcons/target1.png");
    target2 = loadImage("PointerIcons/target2.png");
    target3 = loadImage("PointerIcons/target3.png");
    target4 = loadImage("PointerIcons/target4.png");
    revolver1 = loadShape("Sig2.obj");
    tree1 = loadShape("Trees/Tree1/LPTree1.obj");
    tree2 = loadShape("Trees/Tree2/LPTree2.obj");
    grass1 = loadShape("Grass/Grass1/LPGrass1.obj");
    grass2 = loadShape("Grass/Grass2/LPGrass2.obj");
    grass3 = loadShape("Grass/Grass3/LPGrass3.obj");
    grass4 = loadShape("Grass/Grass4/LPGrass4.obj");
    dryGrass1 = loadShape("Grass/DryGrass1/LPDryGrass1.obj");
    dryGrass2 = loadShape("Grass/DryGrass2/LPDryGrass2.obj");
    dryGrass3 = loadShape("Grass/DryGrass3/LPDryGrass3.obj");
    dryGrass4 = loadShape("Grass/DryGrass4/LPDryGrass4.obj");
}

boolean onGround = true;
int cameraX = 0;
int cameraY = 0;
int cameraZ = 1000;
int prevCameraZ = 0;
int cameraFloor;
float upVelocity = 0;
void draw() {
    robot.mouseMove(displayWidth/2, displayHeight/2); //Remeber to uncomment out
    doneFrame = false;
    lights();
    keyRespond();
    background(82, 210, 255);
    xAngle = xAngle + (targetXAngle - xAngle)/8;
    yAngle = yAngle + (targetYAngle - yAngle)/8;
    //camera(cameraX, cameraY, cameraZ, cameraX + sin(xAngle), cameraY + cos(xAngle), cameraZ + sin(yAngle), 0.0, 0.0, -1.0);
    float zCoor = 0;
    try {
        zCoor = heights[int((cameraX + gridLength * tileSize/2)/tileSize - 1)][int((cameraY + gridWidth * tileSize/2)/tileSize - 1)];
        if (abs(cameraZ - 150 - zCoor) <= 10) {
            onGround = true;
        }
    }
    catch (ArrayIndexOutOfBoundsException e) {
        zCoor = prevCameraZ;
        onGround = false;
    }
    cameraFloor = 150 + int(zCoor);
    cameraZ = int(cameraZ + (cameraFloor - cameraZ)/6);
    cameraZ += upVelocity / (frameRate/60);
    prevCameraZ = int(zCoor);
    upVelocity = onGround? 0:(upVelocity - 0.8);
    camera(cameraX, cameraY, cameraZ, cameraX + sin(xAngle), cameraY + cos(xAngle), cameraZ + sin(yAngle), sin(xAngle) * sin(yAngle), cos(xAngle) * sin(yAngle), -cos(yAngle));
    drawTerrain();
    for (int i = 0; i < models.length; i++) {
        models[i].drawModel();
    }
    drawRevolver();
    drawPointer();
    doneFrame = true;
    println("*****");
}

void translateToCharacter() {
    translate(cameraX, cameraY, cameraZ);
    rotateZ(-xAngle);
    rotateX(yAngle);
}

void mousePressed() {
    revolverY = 80;
    Shape3D picked = Shape3D.pickShape(this, mouseX, mouseY);
    if (picked != null && int(picked.tag) > -1) {
        println(picked);
        try{
            models[int(picked.tag)].destroyed = true;
        }catch(Exception e){}
    }
}

void drawPointer(){
    noLights();
    hint(DISABLE_DEPTH_TEST);
    pushMatrix();
    translateToCharacter();
    translate(0, 500, 0);
    rotateX(PI/2);
    rotateZ(PI);
    image(target1, -16, -16);
    popMatrix();
    hint(ENABLE_DEPTH_TEST);
}

float revolverY = 120;
void drawRevolver() {
    revolverY = revolverY + (120 - revolverY)/2;
    pushMatrix();
    translateToCharacter();
    translate(-width/50, revolverY, -height/24);
    rotateX(0.1 + PI/2);
    rotateZ(PI/16);
    rotateY(PI);
    scale(10);
    shape(revolver1);
    popMatrix();
}


void drawTerrain() {
    fill(144, 245, 0);
    stroke(0);
    strokeWeight(1);
    for (int i = 0; i < gridWidth - 1; i++) {
        //beginShape(TRIANGLE_STRIP);
        for (int j = 0; j < gridLength - 1; j++) {

            if (dist(tileSize * (i + 0.5 - gridLength/2), tileSize * (j - gridWidth/2), cameraX, cameraY) < 700) {
                if (true) {//PVector.angleBetween(new PVector(-sqrt(3), -1), new PVector(1, -sqrt(3)))){
                    pushMatrix();
                    translate(tileSize * (i + 0.5 - gridLength/2), tileSize * (j - gridWidth/2), 0);
                    try {
                        beginShape();
                        vertex(0, 0, heights[i][j]);
                        vertex(tileSize, 0, heights[i + 1][j]);
                        vertex(0, tileSize, heights[i][j + 1]);
                        endShape(CLOSE);
                    }
                    catch(Exception ArrayIndexOutOfBoundsException) {
                    }
                    try {
                        beginShape();
                        vertex(0, 0, heights[i][j]);
                        vertex(-tileSize, 0, heights[i - 1][j]);
                        vertex(0, -tileSize, heights[i][j - 1]);
                        endShape(CLOSE);
                    }
                    catch(Exception ArrayIndexOutOfBoundsException) {
                    }
                    popMatrix();
                }
            }
        }
    }
}
