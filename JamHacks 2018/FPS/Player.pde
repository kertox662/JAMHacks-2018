//This is a player. Data about the player is stored here.
abstract class Player extends Agent {
    float speed;
    Player(float xPos, float yPos, float zPos, float xA, float speed) {
        super(xPos, yPos, zPos, xA, 0.0, 100);
        this.speed = speed;
    }
}
