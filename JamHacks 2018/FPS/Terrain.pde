int terrainLength = 100;
int terrainWidth = 100;
float[][] terrain = new float[terrainLength][terrainWidth];

void loadTerrain() {
    for (int i = 0; i < terrainLength; i++) {
        for (int j = 0; j < terrainLength; j++) {
            terrain[i][j] = noise(i, j);
        }
    }
}

void drawTerrain() {
}
