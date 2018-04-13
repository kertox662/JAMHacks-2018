class Grass extends GameObject{
    Grass(){
         super();
         objModels = new PShape[]{Grass1, Grass2, Grass3, Grass4, DryGrass1, DryGrass2, DryGrass3, DryGrass4};
         loadModel();
     }
     
     void drawGrass(){
         drawModel();
     }
}
