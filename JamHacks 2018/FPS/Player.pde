//This is the player. Data about the player is stored here.
float PLAYER_HEIGHT = 150;

Agent mainPlayer = new Player(0, 0, PLAYER_HEIGHT, 0);

class Player extends Agent {
    Player(float xPos, float yPos, float zPos, float xA) {
        super(xPos, yPos, zPos, xA, 0.0, 5.0);
    }
}
