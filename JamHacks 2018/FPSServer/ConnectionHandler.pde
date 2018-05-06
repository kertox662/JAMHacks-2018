String[] clientsConnected;

float[][] playerData;
int numPlayers;
int id;

void serverEvent(Server server, Client client) {
    addPlayer();
    send(server, str(id));
    send(server, str(scale));
    send(server, str(terrainLength));
    send(server, str(terrainWidth));
    server.write(terrainString);

    send(server, "");
    send(server,str(numTrees));
    server.write(treeData);
    send(server, "");
    send(server, str(numBushes));
    server.write(bushData);
    send(server, "");
    send(server, str(numGrass));
    server.write(grassData);
}



void addPlayer() {
    for(int i = 0; i < playerData.length; i++) {
        boolean empty = true;
        for(int j = 0; j < 5; j++){
            if (playerData[i][j] != 0){
                //if(float(playerData[i][j]) != 0){
                empty = false;
            }
        }
        if (empty){
            playerData[i] = new float[]{terrainLength/2 * scale, terrainWidth/2 * scale, terrain[terrainLength/2][terrainWidth/2], 0, 0};
            id = i;
            numPlayers++;
            break;
        }
    }
    //println("done");
}

void disconnectEvent(Client c){
    println("Client", c.ip(), "has disconnected");
    numPlayers--;
}
