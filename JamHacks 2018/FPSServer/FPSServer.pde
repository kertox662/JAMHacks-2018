import processing.net.*;

Server s;
PApplet applet = this;

String[][] playerData;
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
    playerData = new String[10][5];
    clientsConnected = new String[10];
    loadTerrain();
    terrainString = dataToString(terrain);
    treeData = generateObjects(10);
    bushData = generateObjects(10);
    println(treeData);
}

void draw() {
    if(s.available() != null){
        //Donny's parser
    }
}

void addPlayer(Client c) {
    for(int i = 0; i < playerData.length; i++) {
        int numTrue = 0;
        for(int j =0; j < playerData[i].length; i++){
            if (float(playerData[i][j]) == 0){
                numTrue++;
            }
        }
        if (numTrue >= playerData[i].length){
            playerData[i][0] = str(terrainLength/2 * scale);
            playerData[i][1] = str(terrainWidth/2 * scale);
            playerData[i][0] = str(terrain[terrainLength/2][terrainWidth/2]);
            playerData[i][0] = "0";
            playerData[i][0] = "0";
            break;
        }
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
       objStringList[i] = join(objList[i], "\n");
    }
    String objString = join(objStringList, "\n*\n");
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
        dataStringList[i] = join(twodStringList[i], "\n");
    }
    
    dataString = join(dataStringList, "*\n");
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
    addPlayer(client);
    server.write("Terre");
    send(server, str(scale));
    send(server, str(terrainLength));
    send(server, str(terrainWidth));
    server.write(terrainString);
    //for(int i = 0; i < terrainLength; i++){
    //    for(int j = 0; j < terrainWidth; j++){
    //        send(server, str(terrain[i][j]));
    //    }
    //}
    //server.write(terrainString);
    //server.write("Tree");
    //server.write(treeData);
    //server.write("Bush");
    //server.write(bushData);
}

void send(Server server, String input){
    server.write(input + "\n");
}
