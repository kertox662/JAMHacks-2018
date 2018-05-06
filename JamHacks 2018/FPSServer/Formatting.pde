void send(Server server, String input){

    server.write(input + "\n");
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
    
    dataString = join(dataStringList, "\n");
    dataString = "\n" + dataString;
    return dataString;
}
