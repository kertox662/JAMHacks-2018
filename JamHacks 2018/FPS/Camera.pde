void updateCamera() {
    camera( mainPlayer.position.x, mainPlayer.position.y, mainPlayer.position.z, 
        mainPlayer.position.x + sin(mainPlayer.xAngle), mainPlayer.position.y + cos(mainPlayer.xAngle), mainPlayer.position.z + sin(mainPlayer.yAngle), 
        0, 0, -1);
}
