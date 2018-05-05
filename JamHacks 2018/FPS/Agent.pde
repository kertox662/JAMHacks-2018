PShape testShape;

abstract class Agent {
    PVector position;
    float xAngle;
    float yAngle;
    boolean onGround = true;

    Agent(float xPos, float yPos, float zPos, float xA, float yA) {
        position = new PVector(xPos, yPos, zPos);
        xAngle = xA;
        yAngle = yA;
    }

    void display() {
    }
}

void loadModels() {
}
