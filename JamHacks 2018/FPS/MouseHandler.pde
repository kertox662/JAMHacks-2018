void mousePressed() {
  gunshot = minim.loadFile("Sounds/Gunshot2.wav");
    gunshot.play();
    
}

void mouseMoved() {
    if (!(mouseX == displayWidth/2 && mouseY == displayHeight/2)) {
        waitForFrameFinish();
        PVector cameraChangeAngle = PVector.fromAngle(atan2(pmouseY - mouseY, pmouseX - mouseX)).mult(0.05);
        mainPlayer.xAngle += cameraChangeAngle.x;
        mainPlayer.yAngle = min(PI/2, max(-PI/2, mainPlayer.yAngle + cameraChangeAngle.y));
    }
}

void mouseReleased() {
}