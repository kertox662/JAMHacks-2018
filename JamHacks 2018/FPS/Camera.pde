void updateCamera() {
    camera( player.position.x, player.position.y, player.position.z, 
        player.position.x + sin(player.xAngle), player.position.y + cos(player.xAngle), player.position.z + sin(player.yAngle), 
        0, 1, 0);
}
