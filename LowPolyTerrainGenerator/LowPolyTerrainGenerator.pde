int gridLength = 100;
int gridWidth = 100;
int tileSize = 20;
float[][] heights = new float[gridLength][gridWidth];

void setup(){
    size(800, 600, P3D);
    for(int i = 0; i < gridLength; i++){
        for(int j = 0; j < gridWidth; j++){
            heights[i][j] = random(-1, 1);
        }
    }
}

int cameraX = 0;
int cameraY = 0;
int cameraZ = 100;
float directionAngle = PI/2;
void draw(){
    keyRespond();
    background(82, 210, 255);
    drawTerrain();
    PVector direction = PVector.fromAngle(directionAngle);
    camera(cameraX, cameraY, cameraZ, cameraX + direction.x, cameraY + direction.y, cameraZ, 0.0, 0.0, -1.0);
    //cameraY = cameraY - 5;
}


void drawTerrain(){
    line(0, 0, 0, 0, 0, 100);
    //line(0, 0, 0, 0, 100, 0);
    //line(0, 0, 0, 100, 0, 0);
    fill(144, 245, 0);
    for(int i = 0; i < gridLength - 1; i++){
        for(int j = 0; j < gridWidth - 1; j++){
            if(dist(tileSize * (i + 0.5 - gridLength/2), tileSize * (j - gridWidth/2), cameraX, cameraY) < 700){
                if(true){//PVector.angleBetween(new PVector(-sqrt(3), -1), new PVector(1, -sqrt(3)))){
                    pushMatrix();
                    translate(tileSize * (i + 0.5 - gridLength/2), tileSize * (j - gridWidth/2), 0);
                    try{
                        beginShape();
                        vertex(0, 0, heights[i][j]);
                        vertex(tileSize, 0, heights[i + 1][j]);
                        vertex(0, tileSize, heights[i][j + 1]);
                        endShape(CLOSE);
                    }catch(Exception ArrayIndexOutOfBoundsException){}
                    try{
                        beginShape();
                        vertex(0, 0, heights[i][j]);
                        vertex(-tileSize, 0, heights[i - 1][j]);
                        vertex(0, -tileSize, heights[i][j - 1]);
                        endShape(CLOSE);
                    }catch(Exception ArrayIndexOutOfBoundsException){}
                    popMatrix();
                }
            }
        }
    }
}
