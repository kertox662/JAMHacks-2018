String treeData; 
String bushData;
String grassData;

float scale = 120;
int terrainLength = 100;
int terrainWidth = 100;
float[][] terrain = new float[terrainLength][terrainWidth];
String terrainString;

int numBushes = 20;
int numTrees = 50;
int numGrass = 2000;

String generateObjects(int numOBJ){
    String[][] objList = new String[numOBJ][3];
    for(int i = 0; i<numOBJ; i++){
        objList[i][0] = str(int(random(1,terrainWidth-1) * scale));
        objList[i][1] = str(int(random(1,terrainLength-1) * scale));
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
            terrain[i][j] = -1000 + 2000 * noise(i/20.0, j/20.0);
        }
    }
}
