class GameObject {
    String[] objModels = new String[10];
    PShape model;
    PVector position;
    float rotation;
    int scaleFactor;
    GameObject() {
        float xRange = gridLength * tileSize/2;
        float yRange = gridWidth * tileSize/2;
        int xCoor = int(random(xRange * -1, xRange + 1));
        int yCoor = int(random(yRange * -1, yRange + 1));
        float zCoor = heights[int((xCoor + xRange)/tileSize - 1)][int((yCoor + yRange)/tileSize - 1)];
        position = new PVector(xCoor, yCoor, zCoor);
        rotation = random(0, 2*PI);
        scaleFactor = int(random(80, 101));
    }
    
    void loadModel(){
        model = loadShape(objModels[int(random(0, objModels.length))]);
    }
    
    void drawModel() {
        if (dist(position.x, position.y, cameraX, cameraY) < 700) {
            pushMatrix();
            translate(position.x, position.y, position.z);
            scale(scaleFactor);
            rotateX(PI/2);
            rotateY(rotation);
            shape(model);
            popMatrix();
        }
    }
}
