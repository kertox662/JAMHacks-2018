import java.awt.Robot;

int gridLength = 100;
int gridWidth = 100;
int tileSize = 20;
float[][] heights = new float[gridLength][gridWidth];
float moveSpeed = 5;

Tree[] treeArray;
int treeCount = 30;

Grass[] grassArray;
int grassCount = 100;

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
    frameRate(120);
    try {
        robot = new Robot();
    }
    catch (Exception e) {
    }
    fullScreen(P3D);
    for (int i = 0; i < gridLength; i++) {
        for (int j = 0; j < gridWidth; j++) {
            heights[i][j] = random(-2, 2);
        }
    }

    loadGameShapes();

    treeArray = new Tree[treeCount];
    for (int i = 0; i < treeCount; i++) {
        treeArray[i] = new Tree();
    }

    grassArray = new Grass[grassCount];
    for (int i = 0; i < grassCount; i++) {
        grassArray[i] = new Grass();
    }
}

void mouseMoved(){
    PVector moveAngle = PVector.fromAngle(atan2(pmouseY - mouseY, pmouseX - mouseX)).mult(0.02);
    targetXAngle += moveAngle.x;
    
    targetYAngle += moveAngle.y;
    targetYAngle = min(PI/2, max(-PI/2, targetYAngle));
}

float targetXAngle = 0;
float targetYAngle = 0;
//Horizontal camera angle.
float xAngle = 0;
//Vertical camera angle.
float yAngle = 0;

void loadGameShapes() {
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

int cameraX = 0;
int cameraY = 0;
int cameraZ = 100;
float directionAngle = PI/-2;
boolean doneFrame = false;
void draw() {
    robot.mouseMove(displayWidth/2, displayHeight/2);
    doneFrame = false;
    lights();
    keyRespond();
    background(82, 210, 255);
    drawTerrain();
    drawRevolver();
    camera(cameraX, cameraY, cameraZ, cameraX + sin(xAngle), cameraY + cos(xAngle), cameraZ + sin(yAngle), 0.0, 0.0, -1.0);
    for (int i = 0; i < treeCount; i++) {
        Tree t = treeArray[i];
        t.drawTree();
    }
    for (int i = 0; i < grassCount; i++) {
        Grass g = grassArray[i];
        g.drawGrass();
    }
    xAngle = xAngle + (targetXAngle - xAngle)/4;
    yAngle = yAngle + (targetYAngle - yAngle)/4;
    hint(DISABLE_DEPTH_TEST);
    pushMatrix();
    translate(cameraX, cameraY, cameraZ);
    rotateZ(-xAngle);
    rotateX(yAngle);
    translate(0, 500, 0);
    rotateX(PI/2);
    ellipse(0, 0, 20, 20);
    popMatrix();
    hint(ENABLE_DEPTH_TEST);
    doneFrame = true;
}

void drawRevolver() {
    pushMatrix();
    translate(cameraX, cameraY, cameraZ);
    rotateZ(-xAngle);
    rotateX(yAngle);
    translate(-width/200, 90, -height/24);
    rotateX(0.1 + PI/2);
    rotateZ(-PI/16);
    rotateY(PI);
    scale(6);
    shape(revolver1);
    popMatrix();
}


void drawTerrain() {
    fill(144, 245, 0);
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
