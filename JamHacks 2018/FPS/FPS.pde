import java.awt.Robot;
import java.awt.MouseInfo;
import java.awt.Toolkit;
import shapes3d.*;

PApplet applet = this;
Environment[] environment = {};

boolean doneFrame = false;

void setup() {
    setRobot();
    fullScreen(P3D);
    frameRate(1000);
    loadTerrain();
    loadModels();
}

void draw() {
    doneFrame = false;

    //Background and Cursor.
    background(0);
    setCursorToCenter();

    updateCamera();

    //3D stuff.
    drawTerrain();
    drawEnvironment();

    //2D stuff.
    doneFrame = true;
}

void waitForFrameFinish() {
    while (true) {
        if (doneFrame) {
            break;
        }
    }
}
