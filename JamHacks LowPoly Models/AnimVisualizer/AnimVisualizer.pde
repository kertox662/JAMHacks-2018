import ch.dieseite.colladaloader.ColladaLoader;
import ch.dieseite.colladaloader.wrappers.ColladaModel;

ColladaModel model;

void settings() {
    size(500,500,P3D);
}

void setup() {

    lights();
    frameRate(10);
    
    model = ColladaLoader.load("sketchup.kmz",this,null);
    //notes:
    //- loader accepts kmz and dae file endings
    //- user can create unlimited numbers of models
    //- loader can process user options via 3rd param
}

void draw() {

    background(0);
    
    model.draw();
    //notes: (see also javadoc)
    //- model can draw using default renderer (2D) or OpenGL (P2D/P3D)
    //- model can scale, move or rotate its 3D positions without changing rest of view
}
