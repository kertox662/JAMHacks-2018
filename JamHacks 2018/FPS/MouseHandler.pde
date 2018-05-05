void mousePressed() {
    if (!(mouseX == displayWidth/2 && mouseY == displayHeight/2)) {
        waitForFrameFinish();
        PVector cameraChangeAngle = PVector.fromAngle(atan2(pmouseY - mouseY, pmouseX - mouseX)).mult(0.05);
        player.xAngle += cameraChangeAngle.x;
        player.yAngle = min(PI/2, max(-PI/2, player.yAngle + cameraChangeAngle.y));
    }
}

void mouseMoved() {
}

void mouseReleased() {
}
