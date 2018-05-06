import java.awt.Robot;
import java.awt.MouseInfo;
import java.awt.Toolkit;
import shapes3d.*;

PApplet applet = this;

boolean doneFrame = false;

void setup() {
    setRobot();
    fullScreen(P3D);
    frameRate(1000);
    createClient();
    loadTerrain();
    loadEnvironment();
    loadModels();
    loadReticles();
    currentReticle = new Reticle(reticleImg1);
    //for(int i =0; i < 200; i++){
    //    Bush bush = new Bush(random(1000, terrain.length * scale -1000), random(1000, terrain[0].length * scale - 1000));
    //    bush.addToEnvironment();
    //}
}

void draw() {
    doneFrame = false;
    //Background and Cursor.
    lights();
    background(82, 210, 255);
    setCursorToCenter();
    
    keyRespond();
    updateCamera();

    //3D stuff.
    drawTerrain();
    drawEnvironment();

    //2D stuff.
    currentReticle.display();
    
    checkServer();
    
    doneFrame = true;
    
}

void waitForFrameFinish() {
    while (true) {
        if (doneFrame) {
            break;
        }
    }
}
