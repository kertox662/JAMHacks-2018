float PLAYER_HEIGHT = 150;
Player mainPlayer = new MainPlayer(0, 0, PLAYER_HEIGHT, 0, 5);

class MainPlayer extends Player{
    MainPlayer(float xPos, float yPos, float zPos, float xA, float speed) {
        super(xPos, yPos, zPos, xA, speed);
    }
}

void updateCamera() {
    camera( mainPlayer.position.x, mainPlayer.position.y, mainPlayer.position.z, 
        mainPlayer.position.x + sin(mainPlayer.xAngle), mainPlayer.position.y + cos(mainPlayer.xAngle), mainPlayer.position.z + sin(mainPlayer.yAngle), 
        0, 0, -1);
}
