Environment[] environment = {};

class Environment extends Agent {
    Environment(float xPos, float yPos, float zPos, float xA, float yA, PShape m, float scale) {
        super(xPos, yPos, zPos, xA, yA, scale);
        model = m;
    }
    
    void addToEnvironment(){
        environment = (Environment[]) append(environment, this);
    }
}

void loadEnvironment(){
    int numTree = int(getMessage());
    for(int i = 0; i < numTree; i++){
        Tree tree = new Tree(float(getMessage()), float(getMessage()));
        tree.xAngle = float(getMessage());
        tree.addToEnvironment();
    }
    int numBush = int(getMessage());
    println(numBush + " *****");
    for(int i = 0; i < numBush; i++){
        Bush bush = new Bush(float(getMessage()), float(getMessage()));
        bush.xAngle = float(getMessage());
        bush.addToEnvironment();
    }
    int numGrass = int(getMessage());
    for(int i = 0; i < numGrass; i++){
        Grass grass = new Grass(float(getMessage()), float(getMessage()));
        grass.xAngle = float(getMessage());
        grass.addToEnvironment();
    }
}

void drawEnvironment() {
    for (int i = 0; i < environment.length; i++) {
        environment[i].display();
    }
}
