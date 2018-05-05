boolean leftPressed = false;
boolean rightPressed = false;
boolean upPressed = false;
boolean downPressed = false;
boolean spacePressed = false;

void keyPressed() {
    if (key == 'a') {
        leftPressed = true;
    } else if (key == 'd') {
        rightPressed = true;
    } else if (key == 'w') {
        upPressed = true;
    } else if (key == 's') {
        downPressed = true;
    } else if (key == ' ') {
        spacePressed = true;
    }
}

void keyReleased() {
    if (key == 'a') {
        leftPressed = false;
    } else if (key == 'd') {
        rightPressed = false;
    } else if (key == 'w') {
        upPressed = false;
    } else if (key == 's') {
        downPressed = false;
    } else if (key == ' ') {
        spacePressed = false;
    }
}
