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
        directionAngle -= 0.1;
    }
    if (rightPressed) {
        directionAngle += 0.1;
    }
    if (upPressed) {
        //println(PVector.fromAngle(directionAngle));
        cameraY += moveSpeed * sin(directionAngle);//PVector.fromAngle(directionAngle).x;
        cameraX += moveSpeed * cos(directionAngle);
    }
    if (downPressed) {
        cameraY -= moveSpeed * sin(directionAngle);
        cameraX -= moveSpeed * cos(directionAngle);
    }
}
