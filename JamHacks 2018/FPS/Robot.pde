Robot robot;
int displayMiddleX = displayWidth/2;
int displayMiddleY = displayHeight/2;

void setRobot(){
    noCursor();
    try{
        robot = new Robot();
    }catch(Exception e){
        e.printStackTrace();
    }
}

void recalculateDisplayCenter(){
    displayMiddleX = displayWidth/2;
    displayMiddleY = displayHeight/2;
}

void setCursorToCenter(){
    robot.mouseMove(displayMiddleX, displayMiddleY);
}
