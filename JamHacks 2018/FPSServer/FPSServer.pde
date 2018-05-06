import processing.net.*;

Server s;
PApplet applet = this;

void setup() {
    s = new Server(applet, 4531);
    playerData = new String[10][5];
    clientsConnected = new String[10];
    loadTerrain();
    terrainString = dataToString(terrain);
    treeData = generateObjects(10);
    bushData = generateObjects(10);
    //println(terrainString);
}
