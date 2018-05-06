String treeData; 
String bushData;

float scale = 120;
int terrainLength = 100;
int terrainWidth = 100;
float[][] terrain = new float[terrainLength][terrainWidth];
String terrainString;

int numBushes = 10;
int numTrees = 10;

String generateObjects(int numOBJ){
    String[][] objList = new String[numOBJ][3];
    for(int i = 0; i<numOBJ; i++){
        objList[i][0] = str(int(random(0,terrainWidth)));
        objList[i][1] = str(int(random(0,terrainLength)));
        objList[i][2] = str(random(TWO_PI));
    }
    String[] objStringList = new String[numOBJ];
    for(int i = 0; i < numOBJ; i++){
       objStringList[i] = join(objList[i], "\n");
    }
    String objString = join(objStringList, "\n");
    return objString;
}



void loadTerrain() {
    for (int i = 0; i < terrainLength; i++) {
        for (int j = 0; j < terrainWidth; j++) {
            terrain[i][j] = -1000 + 1000.0 * noise(i/10.0, j/10.0);
        }
    }
}
