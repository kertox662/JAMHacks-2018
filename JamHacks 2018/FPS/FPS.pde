import java.awt.Robot;
import java.awt.MouseInfo;
import java.awt.Toolkit;
import shapes3d.*;

PApplet applet = this;

boolean doneFrame = false;

void setup() {
    setRobot();
    fullScreen(P3D);
    c = new Client(applet, ipToServer, 4531);
    frameRate(1000);
    loadTerrain();
    loadModels();
}

void draw() {
    doneFrame = false;

    //Background and Cursor.
    background(0);
    setCursorToCenter();
    
    keyRespond();
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
