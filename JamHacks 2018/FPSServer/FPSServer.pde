import processing.net.*;

Server s;
PApplet applet = this;

void setup() {
    size(400,400);
    textAlign(CENTER);
    fill(0);
    background(255);
    text("RUNNING",200,200);
    s = new Server(applet, 4531);
    playerData = new String[10][5];
    clientsConnected = new String[10];
    loadTerrain();
    terrainString = dataToString(terrain);
    treeData = generateObjects(numTrees);
    bushData = generateObjects(numBushes);
    grassData = generateObjects(numGrass);
    //println(terrainString);
}
