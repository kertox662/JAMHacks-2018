
class Grass extends Model{
    Grass(){
         super();
         objModels = new PShape[]{grass1, grass2, grass3, grass4, dryGrass1, dryGrass2, dryGrass3, dryGrass4};
         loadModel();
     }
}
