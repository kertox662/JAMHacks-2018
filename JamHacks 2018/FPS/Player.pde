//This is the player. Data about the player is stored here.
float PLAYER_HEIGHT = 150;

abstract class Player extends Agent {
    float speed;
    Player(float xPos, float yPos, float zPos, float xA, float speed) {
        super(xPos, yPos, zPos, xA, 0.0);
        this.speed = speed;
    }
}
