PImage reticle0;
PImage reticle1;
PImage reticle2;
PImage reticle3;
PImage reticle4;

Reticle currentReticle = new Reticle(reticle1);

class Reticle{
    PImage reticle;
    //PImage r is the .png file of the reticle.
    Reticle(PImage r){
        reticle = r;
    }
    
    void display(){
        pushMatrix();
        translateToCharacter();
        image(reticle, -16, -16);
        popMatrix();
    }
}

void loadReticles(){
    reticle0 = loadImage("PointerIcons/reticle0.png");
    reticle1 = loadImage("PointerIcons/reticle1.png");
    reticle2 = loadImage("PointerIcons/reticle2.png");
    reticle3 = loadImage("PointerIcons/reticle3.png");
    reticle4 = loadImage("PointerIcons/reticle4.png");
}
