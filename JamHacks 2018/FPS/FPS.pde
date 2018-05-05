import java.awt.Robot;
import shapes3d.*;

PApplet applet = this;

void setup(){
    noCursor();
    fullScreen(P3D);
    frameRate(1000);
    loadTerrain();
}

void draw(){
    background();
    updateCamera();
    drawTerrain();
}
