int numTreeModels = 2;
PShape[] treeModels = new PShape[numTreeModels];

class Tree extends Environment{
    Tree(float xPos, float yPos){
        super(xPos, yPos, getHeight(xPos, yPos), random(0, TWO_PI), 0, treeModels[0], 300);
    }
}

void loadTrees(){
    for (int i = 1; i <= numTreeModels; i++) {
        treeModels[i-1] = loadShape("Tree/Tree" + i + ".obj");
    }
    
}
