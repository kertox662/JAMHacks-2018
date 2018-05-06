Robot robot;
float displayMiddleX;
float displayMiddleY;

void setRobot() {
    noCursor();
    calculateDisplayCenter();
    try {
        robot = new Robot();
    }
    catch(Exception e) {
        e.printStackTrace();
    }
}

void calculateDisplayCenter() {
    displayMiddleX = displayWidth/2.0;
    displayMiddleY = displayHeight/2.0;
}

void setCursorToCenter() {
    robot.mouseMove(int(displayMiddleX), int(displayMiddleY));
}
