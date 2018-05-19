//This is a player. Data about the players is stored here.
Player[] playerData = new Player[4];

class Player extends Agent {
    float speed;
    Player(float xPos, float yPos, float zPos, float xA, float speed) {
        super(xPos, yPos, zPos, xA, 0.0, 10);
        this.speed = speed;
    }

    String toString() {
        return position.x + "," + position.y + "," + position.z + "," + xAngle + "," + yAngle;
    }

    void display() {
        pushMatrix();
        translate(position.x, position.y, position.z);
        rotateZ(xAngle);
        rotateX(yAngle);
        box(100, 100, 200);
        popMatrix();
    }
}

void initializePlayerData() {
    for (int i = 0; i < playerData.length; i++) {
        playerData[i] = new Player(0, 0, 0, 0, 15);
    }
    playerData[clientID] = mainPlayer;
}

String[] playerDataRaw = new String[playerData.length * 5 + 2];
int dataIndex = -1;
void updatePlayerData() {
    //return;
    if (messageIndex != serverMessages.length - 1) {
        println("Trying to get data");
        playerDataRaw = getMostRecentMessages(playerData.length * 5 + 2);
        for (int b = 0; b < playerDataRaw.length; b++) {
            println(playerDataRaw[b]);
        }
        if (playerDataRaw[playerDataRaw.length - 2].equals("*")) {
            println(true);
            for (int i = 0; i < playerData.length; i++) { //For each player
                if (i != clientID) {
                    println(playerData[clientID], playerData[clientID] instanceof MainPlayer);
                    playerData[i].position.x = float(getNextData());
                    playerData[i].position.y = float(getNextData());
                    playerData[i].position.z = float(getNextData());
                    playerData[i].xAngle = float(getNextData());
                    playerData[i].yAngle = float(getNextData());
                } else {
                    for (int j = 0; j < 5; j++) {
                        getNextData();
                    }
                }
            }
            dataIndex = -1;
        }
    }else{
        println("No extra data");
    }
}

void drawPlayers() {
    for (int i = 0; i < playerData.length; i++) {
        playerData[i].display();
    }
}

private String getNextData() {
    dataIndex++;
    return playerDataRaw[dataIndex];
}
