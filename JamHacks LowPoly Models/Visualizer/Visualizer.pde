String text = "";

Box box1 = new Box(new PVector(300, 400, -50));

PShape s;
float rate = -600.0;

void setup() {
    frameRate(500);
    size(800, 600, P3D);
    s = loadShape("LPSnowPine.obj");
    s.scale(-50);
}

void draw() {
    background(255);
    translate(width/2, 3 * height/5, 0);
    //rotateX(PI);
    rotateY(-PI/2 + frameCount/rate);
    //rotateZ(PI/4);
    shape(s);
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == UP) {
            rate += 20.0;
            println(rate);
        }else if(keyCode == DOWN){
            rate -= 20.0;
            println(rate);
        }    
    }
}
