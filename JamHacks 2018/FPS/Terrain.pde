int terrainLength = 100;
int terrainWidth = 100;
float scale = 100;
float[][] terrain = new float[terrainLength][terrainWidth];

void loadTerrain() {
    for (int i = 0; i < terrainLength; i++) {
        for (int j = 0; j < terrainLength; j++) {
            terrain[i][j] = noise(i, j);
        }
    }
}

void drawTerrain(){
  for(int y = 0; y < terrainLength-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < terrainWidth; x++) {
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
    }
    endShape();
  }
}
