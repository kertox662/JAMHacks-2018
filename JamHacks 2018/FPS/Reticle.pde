PImage reticleImg0;
PImage reticleImg1;
PImage reticleImg2;
PImage reticleImg3;
PImage reticleImg4;

Reticle currentReticle;

class Reticle {
    PImage reticle;
    //PImage r is the .png file of the reticle.
    Reticle(PImage r) {
        currentReticle = this;
        reticle = r;
    }

    void display() {
        noLights();
        hint(DISABLE_DEPTH_TEST);
        pushMatrix();
        translateToCharacter();
        translate(0, 500, 0);
        rotateX(PI/2);
        rotateZ(PI);
        image(reticle, -16, -16);
        popMatrix();
        hint(ENABLE_DEPTH_TEST);
    }
}

void loadReticles() {
    reticleImg0 = loadImage("PointerIcons/reticle0.png");
    reticleImg1 = loadImage("PointerIcons/reticle1.png");
    reticleImg2 = loadImage("PointerIcons/reticle2.png");
    reticleImg3 = loadImage("PointerIcons/reticle3.png");
    reticleImg4 = loadImage("PointerIcons/reticle4.png");
}
