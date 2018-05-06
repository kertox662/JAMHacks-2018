int maxEnvironmentOBJ = 100;
Environment[] environment = new Environment[maxEnvironmentOBJ];

class Environment extends Agent {
    Environment(float xPos, float yPos, float zPos, float xA, float yA) {
        super(xPos, yPos, zPos, xA, yA);
    }
}

void drawEnvironment() {
    for (int i = 0; i < environment.length; i++) {
        environment[i].display();
    }
}
