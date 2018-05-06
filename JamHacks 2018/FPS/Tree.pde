String[] modelListTrees = {""};

class Tree extends Environment {
    Tree(float xPos, float yPos){
        super(xPos, yPos, getHeight(xPos, yPos), random(0, TWO_PI), 0, bush);
    }
}

void loadTrees(){
}
