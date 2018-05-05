Model[] models = {};
abstract class Model {
    Box[] hitboxes = {};
    boolean destroyed = false;
    PShape[] objModels = new PShape[10];
    PShape model;
    PVector position;
    float xAngle;
    int scaleFactor;
    int id;
    Model() {
        id = models.length;
        float xRange = gridLength * tileSize/2;
        float yRange = gridWidth * tileSize/2;
        int xCoor = int(random(xRange * -1, xRange + 1));
        int yCoor = int(random(yRange * -1, yRange + 1));
        float zCoor = heights[int((xCoor + xRange)/tileSize - 1)][int((yCoor + yRange)/tileSize - 1)];
        position = new PVector(xCoor, yCoor, zCoor);
        xAngle = random(0, 2*PI);
        scaleFactor = int(random(100, 101));
    }
    
    void addHitbox(Box hitbox){
        hitboxes = (Box[]) append(hitboxes, hitbox);
    }
    
    void loadModel(){
        model = objModels[int(random(0, objModels.length))];
    }
    
    void createHitboxes(){}
    
    void drawModel() {
        if (dist(position.x, position.y, cameraX, cameraY) < 700 && !destroyed && isInFront()) {
            pushMatrix();
            translate(position.x, position.y, position.z);
            rotateX(PI/2);
            rotateY(xAngle);
            for(int i = 0; i < hitboxes.length; i++){
                hitboxes[i].draw();
            }
            scale(scaleFactor);
            shape(model);
            popMatrix();
        }
    }
    boolean isInFront() {
    PVector playerAngle = PVector.fromAngle(xAngle);
    PVector objToPlayer = new PVector(position.x - cameraX, position.y - cameraY);
    
    float angleBetween = PVector.angleBetween(playerAngle, objToPlayer);
    
    if(angleBetween <= PI){
        println(angleBetween + " ANGLE True");
        return true;
    }
    println(angleBetween + " ANGLE False");
    return false;
  }
}
