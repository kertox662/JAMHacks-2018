PShape testShape;

abstract class Agent {
    PVector position;
    float xAngle;
    float yAngle;
    float speed;
    boolean onGround = true;

    Agent(float xPos, float yPos, float zPos, float xA, float yA, float speed) {
        position = new PVector(xPos, yPos, zPos);
        xAngle = xA;
        yAngle = yA;
        this.speed = speed;
    }
    
    void update(){
    }

    void display() {
    }
}

void loadModels() {
}
