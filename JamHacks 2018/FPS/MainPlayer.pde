PShape gun;
float PLAYER_HEIGHT = 150;
Player mainPlayer = new MainPlayer(0, 0, PLAYER_HEIGHT, 0, 15);

class MainPlayer extends Player {
    MainPlayer(float xPos, float yPos, float zPos, float xA, float speed) {
        super(xPos, yPos, zPos, xA, speed);
    }

    void display() {
        pushMatrix();
        translateToCharacter();
        translate(-width/50, 150, -height/24);
        rotateX(0.1 + PI/2);
        rotateZ(PI/16);
        rotateY(PI);
        scale(scale);
        shape(gun);
        popMatrix();
    }
}

void updateCamera() {
    mainPlayer.position.z = getHeight(mainPlayer.position.x, mainPlayer.position.y) + 350;
    camera( mainPlayer.position.x, mainPlayer.position.y, mainPlayer.position.z, 
        mainPlayer.position.x + sin(mainPlayer.xAngle), mainPlayer.position.y + cos(mainPlayer.xAngle), getHeight(mainPlayer.position.x, mainPlayer.position.y) + 350 + sin(mainPlayer.yAngle), 
        0, 0, -1);
}

void loadGuns() {
    gun = loadShape("Guns/Sig2.obj");
}

void translateToCharacter() {
    translate(mainPlayer.position.x, mainPlayer.position.y, mainPlayer.position.z);
    rotateZ(-mainPlayer.xAngle);
    rotateX(mainPlayer.yAngle);
}
