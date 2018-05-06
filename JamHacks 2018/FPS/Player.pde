//This is a player. Data about the player is stored here.
Player[] playerData = new Player[10];

class Player extends Agent {
    Box[] hitboxes = {};
    float speed;
    int id;
    Player(float xPos, float yPos, float zPos, float xA, float speed) {
        super(xPos, yPos, zPos, xA, 0.0, 10);
        this.speed = speed;
    }
    
    void addHitbox(){
        
    }
    
    void display(){
        pushMatrix();
        translate(position.x, position.y, position.z);
        rotateZ(xAngle);
        rotateX(yAngle);
        box(100, 100, 200);
        popMatrix();
    }
}

void updatePlayerData(){
    if(messageIndex != serverMessages.length - 1){
        for(int i = 0; i < 10; i++){
            for(int j = 0; j < 10; j++){
                getMessage();
            }
        }
    }
}
