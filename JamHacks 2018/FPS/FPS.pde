import java.awt.Robot;
import picking.*;
import shapes3d.*;

void setup(){
    loadTerrain();
}

void draw(){
    updateCamera();
    drawTerrain();
}
