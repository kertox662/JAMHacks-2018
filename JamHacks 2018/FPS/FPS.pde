import java.awt.Robot;
import java.awt.MouseInfo;
import java.awt.Toolkit;
import shapes3d.*;

PApplet applet = this;
Environment[] environment = {};

void setup(){
    setRobot();
    fullScreen(P3D);
    frameRate(1000);
    loadTerrain();
    loadModels();
}

void draw(){
    //Background and Cursor.
    background(0);
    setCursorToCenter();
    
    updateCamera();
    
    //3D stuff.
    drawTerrain();
    drawEnvironment();
    
    //2D stuff.
    
}
