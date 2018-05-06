boolean aPressed = false;
boolean dPressed = false;
boolean wPressed = false;
boolean sPressed = false;
boolean spacePressed = false;

void keyPressed() {
    if (key == 'a') {
        aPressed = true;
    } else if (key == 'd') {
        dPressed = true;
    } else if (key == 'w') {
        wPressed = true;
    } else if (key == 's') {
        sPressed = true;
    } else if (key == ' ') {
        spacePressed = true;
    }
}

void keyReleased() {
    if (key == 'a') {
        aPressed = false;
    } else if (key == 'd') {
        dPressed = false;
    } else if (key == 'w') {
        wPressed = false;
    } else if (key == 's') {
        sPressed = false;
    } else if (key == ' ') {
        spacePressed = false;
    }
}

void keyRespond(){
    if (wPressed) {
        mainPlayer.position.x += mainPlayer.speed / (frameRate/60) * sin(mainPlayer.xAngle);
        mainPlayer.position.y += mainPlayer.speed / (frameRate/60) * cos(mainPlayer.xAngle);
    }
    if (aPressed) {
        mainPlayer.position.x -= mainPlayer.speed / (frameRate/60) * sin(mainPlayer.xAngle - PI/2);
        mainPlayer.position.y -= mainPlayer.speed / (frameRate/60) * cos(mainPlayer.xAngle - PI/2);
    }
    if (sPressed) {
        mainPlayer.position.x -= mainPlayer.speed / (frameRate/60) * sin(mainPlayer.xAngle);
        mainPlayer.position.y -= mainPlayer.speed / (frameRate/60) * cos(mainPlayer.xAngle);
    }
    if (dPressed) {
        mainPlayer.position.x -= mainPlayer.speed / (frameRate/60) * sin(PI/2 + mainPlayer.xAngle);
        mainPlayer.position.y -= mainPlayer.speed / (frameRate/60) * cos(PI/2 + mainPlayer.xAngle);
    }
    if (spacePressed) {
    }
}
