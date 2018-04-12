class Grass extends GameObject{
    Grass(){
         super();
         objModels = new String[]{"Grass/DryGrass1/LPDryGrass1.obj", "Grass/DryGrass2/LPDryGrass2.obj","Grass/DryGrass3/LPDryGrass3.obj",
     "Grass/DryGrass4/LPDryGrass4.obj","Grass/Grass1/LPGrass1.obj","Grass/Grass2/LPGrass2.obj","Grass/Grass3/LPGrass3.obj","Grass/Grass4/LPGrass4.obj"};
         loadModel();
     }
     
     void drawGrass(){
         drawModel();
     }
}
