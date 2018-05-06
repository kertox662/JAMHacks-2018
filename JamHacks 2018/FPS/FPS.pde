import java.awt.Robot;
import java.awt.MouseInfo;
import java.awt.Toolkit;
import shapes3d.*;

PApplet applet = this;

boolean doneFrame = false;

void setup() {
    setRobot();
    minim = new Minim(applet);
    
    loadModels();
    fullScreen(P3D);
    frameRate(1000);
    //Hey! Order matters here. Don't switch around the functions; it will mess up input from server.
    createClient();
    mainPlayer.id = getID();
    loadTerrain();
    loadEnvironment();
    loadReticles();
    currentReticle = new Reticle(reticleImg1);
    for(int i = 0; i<10; i++){
        playerData[i] = new Player(0,0,0,0,15);
    }
}

void draw() {
    doneFrame = false;
    updatePlayerData();
    //Background and Cursor.
    lights();
    background(82, 210, 255);
    setCursorToCenter();
    
    keyRespond();
    sendData();
    checkServer();
    
    updateCamera();

    //3D stuff.
    drawTerrain();
    drawEnvironment();
    mainPlayer.display();

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
