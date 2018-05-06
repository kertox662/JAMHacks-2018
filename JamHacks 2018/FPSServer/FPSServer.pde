import processing.net.*;

Server s;
PApplet applet = this;

float[][] playerData;
String[] clientsConnected;

String treeData; 
String bushData;

float scale = 120;
int terrainLength = 100;
int terrainWidth = 100;
float[][] terrain = new float[terrainLength][terrainWidth];
String terrainString;

String testString = "Hello there ";

void setup() {
    s = new Server(applet, 4531);
    playerData = new float[10][5];
    clientsConnected = new String[10];
    loadTerrain();
    terrainString = dataToString(terrain);
    println(terrainString.length());
    //println(terrainString);
    treeData = generateObjects(5);
    bushData = generateObjects(5);
}

void draw() {
    
}

void addPlayer(Client c) {
    for(int i = 0; i < playerData.length; i++) {
        //if (playerData[i] == {0, 0, 0, 0, 0}){
        //    playerData[i] = {0, 0, -50, 0, 0};
        //}
    }
}

boolean isArrayEmpty(float[] array) {
    int numsTrue = 0;
    for (int j = 0; j < array.length; j++) {
        if (array[j] == 0) {
            numsTrue++;
        }
    }
    if (numsTrue == array.length) {
        return true;
    }
    return false;
}

String generateObjects(int numOBJ){
    String[][] objList = new String[numOBJ][5];
    for(int i = 0; i<numOBJ; i++){
        objList[i][0] = str(int(random(0,terrainWidth)));
        objList[i][1] = str(int(random(0,terrainLength)));
        objList[i][2] = str(terrain[int(objList[i][0])][int(objList[i][0])]);
        objList[i][3] = str(random(TWO_PI));
        objList[i][4] = "0";
    }
    String[] objStringList = new String[numOBJ];
    for(int i = 0; i < numOBJ; i++){
       objStringList[i] = join(objList[i], ",");
    }
    String objString = join(objStringList, "|");
    return objString;
}

String dataToString(float[][] data){
    String dataString;
    String[] dataStringList = new String[data.length];
    String[][] twodStringList = new String[data.length][data[0].length];
    
    for(int i = 0; i < data.length; i++){
        for(int j = 0; j < data[i].length; j++){
            twodStringList[i][j] = str(data[i][j]);
        }
        dataStringList[i] = join(twodStringList[i], ",");
    }
    
    dataString = join(dataStringList, "|");
    return dataString;
}

void loadTerrain() {
    for (int i = 0; i < terrainLength; i++) {
        for (int j = 0; j < terrainWidth; j++) {
            terrain[i][j] = -1000 + 1000.0 * noise(i/10.0, j/10.0);
        }
    }
    
    
}

void serverEvent(Server server, Client client) {
    //server.write("Scale");
    send(server, str(scale));
    send(server, str(terrainLength));
    send(server, str(terrainWidth));
    for(int i = 0; i < terrainLength; i++){
        for(int j = 0; j < terrainWidth; j++){
            send(server, str(terrain[i][j]));
        }
    }
    //server.write(terrainString);
}

void send(Server server, String input){
    server.write(input + "\n");
}
