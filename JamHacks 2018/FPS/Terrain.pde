float scale;
float[][] terrain = {};

//Runs once at the start of the program.
void loadTerrain() {
    scale = float(getMessage());
    int terrainLength = int(getMessage());
    int terrainWidth = int(getMessage());
    float[][] loadedTerrain = new float[terrainLength][terrainWidth];
    for (int i = 0; i < terrainLength; i++) {
        for (int j = 0; j < terrainWidth; j++) {
            loadedTerrain[i][j] = float(getMessage());
        }
    }
    terrain = loadedTerrain;
}

void drawTerrain() {
    fill(144, 245, 0);
    stroke(40, 80, 0);
    for (int y = 0; y < terrain.length-1; y++) {
        beginShape(TRIANGLE_STRIP);
        for (int x = 0; x < terrain[y].length; x++) {
            vertex(x*scale, y*scale, terrain[x][y]);
            vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
        }
        endShape();
    }
}

float getHeight(float xPos, float yPos) {
     int xMin = int(xPos/scale);
     int yMin = int(yPos/scale);
     return (terrain[xMin][yMin] + terrain[xMin+1][yMin] + terrain[xMin][yMin+1] + terrain[xMin+1][yMin+1])/4;

}
