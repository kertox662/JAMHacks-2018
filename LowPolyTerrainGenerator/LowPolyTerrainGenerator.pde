int gridLength = 20;
int gridWidth = 20;
int tileSize = 100;
float[][] heights = new float[gridLength][gridWidth];

void setup(){
    size(800, 600, P3D);
    for(int i = 0; i < gridLength; i++){
        for(int j = 0; j < gridWidth; j++){
            heights[i][j] = random(-20, 20);
        }
    }
}

int z = -100;
void draw(){
    background(82, 210, 255);
    drawTerrain();
    camera(0, -100, z, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0);
    z = z-5;
}

void drawTerrain(){
    fill(144, 245, 0);
    for(int i = 0; i < gridLength - 1; i++){
        for(int j = 0; j < gridWidth - 1; j++){
            pushMatrix();
            translate(tileSize * (i + 0.5 - gridLength/2), 0, tileSize * (j - gridWidth/2));
            beginShape();
            vertex(0, heights[i][j], 0);
            vertex(tileSize, heights[i + 1][j], 0);
            vertex(0, heights[i][j + 1], tileSize);
            endShape(CLOSE);
            popMatrix();
        }
    }
    for(int i = 1; i < gridLength; i++){
        for(int j = 1; j < gridWidth; j++){
            pushMatrix();
            translate(tileSize * (i + 0.5 - gridLength/2), 0, tileSize * (j - gridWidth/2));
            beginShape();
            vertex(0, heights[i][j], 0);
            vertex(-tileSize, heights[i - 1][j], 0);
            vertex(0, heights[i][j - 1], -tileSize);
            endShape(CLOSE);
            popMatrix();
        }
    }
}
