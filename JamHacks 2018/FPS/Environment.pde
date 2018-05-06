Environment[] environment = {};

class Environment extends Agent {
    Environment(float xPos, float yPos, float zPos, float xA, float yA, PShape model) {
        super(xPos, yPos, zPos, xA, yA);
        this.model = model;
    }
    
    void addToEnvironment(){
        environment = (Environment[]) append(environment, this);
    }
}

void drawEnvironment() {
    for (int i = 0; i < environment.length; i++) {
        environment[i].display();
    }
}
