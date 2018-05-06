int numBushModels = 1;
PShape[] bushModels = new PShape[numBushModels];

class Bush extends Environment{
    Bush(float xPos, float yPos){
        super(xPos, yPos, getHeight(xPos, yPos), random(0, TWO_PI), 0, bushModels[0], 100);
    }
}

void loadBushes(){
    for (int i = 0; i < numBushModels; i++) {
        bushModels[i] = loadShape("Bush/Bush" + (i + 1) + ".obj");
    }
    
}
