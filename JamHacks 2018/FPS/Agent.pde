abstract class Agent {
    PVector position;
    PShape model;
    float xAngle;
    float yAngle;
    float scale;
    boolean onGround = true;

    Agent(float xPos, float yPos, float zPos, float xA, float yA, float scale) {
        position = new PVector(xPos, yPos, zPos);
        xAngle = xA;
        yAngle = yA;
        this.scale = scale;
        //model = loadShape(file);
    }

    void display() {
        pushMatrix();
        translate(position.x, position.y, position.z);
        rotateZ(xAngle);
        rotateX(yAngle + PI/2);
        scale(scale);
        try{
        shape(model);
        }
        catch(Exception e){
        //    e.printStackTrace();
        }
        popMatrix();
    }
}

void loadModels() {
    loadBushes();
    loadTrees();
    loadGrass();
    loadGuns();
}
