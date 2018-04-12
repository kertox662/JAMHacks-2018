int gridLength = 100;
int gridWidth = 100;
int tileSize = 20;
float[][] heights = new float[gridLength][gridWidth];
float moveSpeed = 5;

PShape revolver1;
PShape LPTree1;
PShape LPTree2;

void setup() {
    size(800, 600, P3D);
    revolver1 = loadShape("Revolver1.obj");
    LPTree1 = loadShape("Trees/Tree1/LPTree1.obj");
    LPTree2 = loadShape("Trees/Tree2/LPTree2.obj");
    for (int i = 0; i < gridLength; i++) {
        for (int j = 0; j < gridWidth; j++) {
            heights[i][j] = random(-2, 2);
        }
    }
}

int cameraX = 0;
int cameraY = 0;
int cameraZ = 100;
float directionAngle = PI/2;
void draw() {
    lights();
    keyRespond();
    PVector direction = PVector.fromAngle(directionAngle);
    camera(cameraX, cameraY, cameraZ, cameraX + direction.x, cameraY + direction.y, cameraZ, 0.0, 0.0, -1.0);
    background(82, 210, 255);
    drawTerrain();
    drawRevolver();
    pushMatrix();
    translate(0, 0, 0);
    rotateX(PI/2);
    scale(100);
    shape(LPTree2);
    popMatrix();
}

void drawRevolver(){
    pushMatrix();
    translate(cameraX, cameraY, cameraZ);
    rotateZ(directionAngle - PI/2);
    translate(-width/20, 90, -height/24);
    rotateX(0.1 + PI/2);
    rotateZ(PI/16);
    rotateY(-PI/16);
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
