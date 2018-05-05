import java.awt.Robot;
import shapes3d.*;

PApplet applet = this;

void setup(){
    setRobot();
    fullScreen(P3D);
    frameRate(1000);
    loadTerrain();
}

void draw(){
    background(0);
    setCursorToCenter();
    updateCamera();
    drawTerrain();
}
