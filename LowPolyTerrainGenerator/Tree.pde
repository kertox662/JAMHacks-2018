class Tree extends GameObject{
     
     Tree(){
         super();
         objModels = new String[]{"Trees/Tree1/LPTree1.obj", "Trees/Tree2/LPTree2.obj"};
         loadModel();
     }
     
     void drawTree(){
         drawModel();
     }
}
