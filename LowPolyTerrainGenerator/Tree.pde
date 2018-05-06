<<<<<<< HEAD
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
=======
class Tree extends Model{
     Tree(){
         super();
         objModels = new PShape[]{tree1, tree2};
         loadModel();
         createHitboxes();
     }
     
     void createHitboxes(){
         Box b1 = new Box(app, 100, 100, 100);
         b1.drawMode(S3D.SOLID | S3D.WIRE);
         //b1.visible(false);
         b1.tag = str(id);
         this.addHitbox(b1);
     }
     
}
>>>>>>> master
