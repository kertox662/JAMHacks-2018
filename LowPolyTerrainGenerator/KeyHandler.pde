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

void keyRespond() {
    if (leftPressed) {
        cameraX -= moveSpeed / (frameRate/60) * sin(xAngle - PI/2);
        cameraY -= moveSpeed / (frameRate/60) * cos(xAngle - PI/2);
    }
    if (rightPressed) {
        cameraX -= moveSpeed / (frameRate/60) * sin(PI/2 + xAngle);
        cameraY -= moveSpeed / (frameRate/60) * cos(PI/2 + xAngle);
    }
    if (upPressed) {
        cameraX += moveSpeed / (frameRate/60) * sin(xAngle);
        cameraY += moveSpeed / (frameRate/60) * cos(xAngle);
    }
    if (downPressed) {
        cameraX -= moveSpeed / (frameRate/60) * sin(xAngle);
        cameraY -= moveSpeed / (frameRate/60) * cos(xAngle);
    } //<>//
    if(spacePressed){
        if(onGround){
            upVelocity = 10;
            onGround = false;
        }
    }
}
