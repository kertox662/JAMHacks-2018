boolean leftPressed = false;
boolean rightPressed = false;
boolean upPressed = false;
boolean downPressed = false;

void keyPressed() {
    if (keyCode == LEFT) {
        leftPressed = true;
    } else if (keyCode == RIGHT) {
        rightPressed = true;
    } else if (keyCode == UP) {
        upPressed = true;
    } else if (keyCode == DOWN) {
        downPressed = true;
    }
}

void keyReleased() {
    if (keyCode == LEFT) {
        leftPressed = false;
    } else if (keyCode == RIGHT) {
        rightPressed = false;
    } else if (keyCode == UP) {
        upPressed = false;
    } else if (keyCode == DOWN) {
        downPressed = false;
    }
}

void keyRespond() {
    if (leftPressed) {
        cameraX -= moveSpeed / (frameRate/60) * sin(xAngle);
        cameraY -= moveSpeed / (frameRate/60) * cos(xAngle);
    }
    if (rightPressed) {
        cameraX += moveSpeed / (frameRate/60) * sin(xAngle);
        cameraY += moveSpeed / (frameRate/60) * cos(xAngle);
    }
    if (upPressed) {
        cameraY -= moveSpeed / (frameRate/60) * sin(xAngle);
        cameraX -= moveSpeed / (frameRate/60) * cos(xAngle);
    }
    if (downPressed) {
        cameraY += moveSpeed / (frameRate/60) * sin(xAngle);
        cameraX += moveSpeed / (frameRate/60) * cos(xAngle);
    }
}
