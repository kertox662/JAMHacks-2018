int numTreeModels = 2;
PShape[] treeModels = new PShape[numTreeModels];

class Tree extends Environment{
    Tree(float xPos, float yPos){
        super(xPos, yPos, getHeight(xPos, yPos), random(0, TWO_PI), 0, treeModels[0]);
    }
}

void loadTrees(){
    for (int i = 0; i < numTreeModels; i++) {
        treeModels[0] = loadShape("Tree/Tree" + (i + 1) + ".obj");
    }
    
}
