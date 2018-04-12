class Tree{
    String[] treeOptions = {"Trees/Tree1/LPTree1.obj", "Trees/Tree1/LPTree2.obj"};
    PShape tree;
    PVector position;
    Tree(){
        tree = loadShape(treeOptions[int(random(0,2))]);
        int xCoor = int(random(0,width + 1));
        int yCoor = int(random(0,height + 1));
        float zCoor = heights[xCoor][yCoor];
        position = new PVector(xCoor, yCoor, zCoor);
        
    }
    
    void drawTree(){
        
    }
}
