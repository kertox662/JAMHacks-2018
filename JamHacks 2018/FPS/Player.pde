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
            playerData[i].position.x = float(getMessage());
            playerData[i].position.y = float(getMessage());
            playerData[i].position.z = float(getMessage());
            playerData[i].xAngle = float(getMessage());
            playerData[i].yAngle = float(getMessage());
            if(i != mainPlayer.id){
                playerData[i].display();
            }
        }
    }
}
