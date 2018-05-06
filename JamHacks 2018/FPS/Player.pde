//This is a player. Data about the players is stored here.
Player[] playerData = new Player[4];

class Player extends Agent {
    float speed;
    Player(float xPos, float yPos, float zPos, float xA, float speed) {
        super(xPos, yPos, zPos, xA, 0.0, 10);
        this.speed = speed;
    }
    
    String toString(){
        return position.x + "," + position.y + "," + position.z + "," + xAngle + "," + yAngle;
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

void initializePlayerData(){
    for(int i = 0; i < playerData.length; i++){
        playerData[i] = new Player(0, 0, 0, 0, 15);
    }
}

void updatePlayerData() {
    if (messageIndex != serverMessages.length - 1) {
        for (int i = 0; i < playerData.length; i++) {
            playerData[i].position.x = float(getMessage());
            playerData[i].position.y = float(getMessage());
            playerData[i].position.z = float(getMessage());
            playerData[i].xAngle = float(getMessage());
            playerData[i].yAngle = float(getMessage());
            println(playerData[i]);
            if(i != clientID){
                playerData[i].display();
            }
        }
    }
}
