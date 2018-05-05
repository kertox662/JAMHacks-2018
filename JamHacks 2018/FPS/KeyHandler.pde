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
