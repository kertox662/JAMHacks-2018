String[] clientsConnected;

String[][] playerData;

void serverEvent(Server server, Client client) {
    addPlayer();
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
    send(server, "");
    send(server,str(numTrees));
    println(numBushes);
    println(bushData);
    //println(num);
    server.write(treeData);
    send(server, "");
    send(server, str(numBushes));
    server.write(bushData);
}



void addPlayer() {
    for(int i = 0; i < playerData.length; i++) {
        boolean empty = true;
        for(int j = 0; j < 5; j++){
            if (playerData[i][j] != null){
                //if(float(playerData[i][j]) != 0){
                empty = false;
            }
        }
        if (empty){
            playerData[i] = new String[]{str(terrainLength/2 * scale), str(terrainWidth/2 * scale), str(terrain[terrainLength/2][terrainWidth/2]), "0", "0"};
            break;
        }
    }
    //println("done");
}
