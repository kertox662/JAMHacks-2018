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
    String dataIN;
    if(c.available() > 0){
        println(c.readString());
    }
    frameRate(1000);
    loadTerrain();
    loadModels();
    loadReticles();
    currentReticle = new Reticle(reticleImg1);
}

void draw() {
    doneFrame = false;
    //Background and Cursor.
    background(82, 210, 255);
    setCursorToCenter();
    
    keyRespond();
    updateCamera();

    //3D stuff.
    drawTerrain();
    drawEnvironment();

    //2D stuff.
    currentReticle.display();
    
    doneFrame = true;
}

void waitForFrameFinish() {
    while (true) {
        if (doneFrame) {
            break;
        }
    }
}
