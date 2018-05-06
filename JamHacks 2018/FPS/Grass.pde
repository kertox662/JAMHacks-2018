int numGrassModels = 4;
PShape[] grassModels = new PShape[numGrassModels];


class Grass extends Environment {
    Grass(float xPos, float yPos) {
        super(xPos, yPos, getHeight(xPos, yPos), random(0, TWO_PI), 0, grassModels[0]);
    }
}

void loadGrass() {
    for (int i = 0; i < numGrassModels; i++) {
        grassModels[i] = loadShape("Grass/LPGrass" + (i + 1) + ".obj");
    }
}
