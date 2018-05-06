import processing.net.*;

Server s;
PApplet applet = this;

void setup() {
    size(800, 800);
    s = new Server(applet, 4531);
    playerData = new float[4][5];
    clientsConnected = new String[10];
    loadTerrain();
    terrainString = dataToString(terrain);
    treeData = generateObjects(numTrees);
    bushData = generateObjects(numBushes);
    grassData = generateObjects(numGrass);
    //println(terrainString);
}

void drawGUI(String[] slist, int x) {
    //background(255);
    textAlign(CENTER);
    fill(0);
    for (int i = 0; i<slist.length; i++) {
        text(slist[i], x, 20*i+50);
    }
}

//void drawGUI() {
//    textAlign(CENTER);
//    fill(0);
//    background(255);
//    text("RUNNING", 200, 0);
//}
