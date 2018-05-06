PShape bush;

abstract class Agent {
    PVector position;
    PShape model;
    float xAngle;
    float yAngle;
    boolean onGround = true;

    Agent(float xPos, float yPos, float zPos, float xA, float yA) {
        position = new PVector(xPos, yPos, zPos);
        xAngle = xA;
        yAngle = yA;
        //model = loadShape(file);
    }
    
    void display() {
      pushMatrix();
      translate(position.x, position.y, position.z);
      rotateZ(xAngle);
      rotateX(yAngle + PI/2);
      scale(100);
      shape(model);
      popMatrix();
    }
}

void loadModels() {
    bush = loadShape("Bush/Bush.obj");
}
