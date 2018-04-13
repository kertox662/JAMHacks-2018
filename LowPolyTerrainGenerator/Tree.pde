class Tree extends GameObject{
     
     Tree(){
         super();
         objModels = new PShape[]{LPTree1, LPTree2};
         loadModel();
     }
     
     void drawTree(){
         drawModel();
     }
}
