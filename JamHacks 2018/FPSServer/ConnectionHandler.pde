String[] clientsConnected;

float[][] playerData;
int numPlayers;
int id;

void serverEvent(Server server, Client client) {
    addPlayer();
    println("Client ip is", client.ip());
    send(server, str(id));
    
    send(server, str(scale));
    send(server, str(terrainLength));
    send(server, str(terrainWidth));
    send(server, terrainString);

    send(server, "");
    send(server,str(numTrees));
    send(server, treeData);
    send(server, "");
    send(server, str(numBushes));
    send(server, bushData);
    send(server, "");
    send(server, str(numGrass));
    send(server, grassData);
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
            playerData[i] = new float[]{100, 100, 150, 0, 0};
            id = i;
            println("New player joined:", id);
            numPlayers++;
            break;
        }
    }
    //println("done");
}

void disconnectEvent(Client c){
    println("Client", c.ip(), "has disconnected");
    Client client = s.available();
    println(client.readString());
    //int id = int(client.readString());
    //playerData[id] = new float[]{0,0,0,0,0};
    //println("Had ID of", id);
    numPlayers--;
}
