class Tree extends GameObject{
     
     Tree(){
         super();
         objModels = new PShape[]{tree1, tree2};
         loadModel();
     }
     
     void drawTree(){
         drawModel();
     }
}
