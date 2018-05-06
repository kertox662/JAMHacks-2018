String nextMessage = "Unknown";

void draw() {
    float[][] info = {};
    if(s.available() != null){
        
        if (nextMessage == "Coords"){
            // id = First line read
            // Coordinates are next 5 lines
        }
        
        else if (nextMessage == "Shoot"){
            //id = First Line read
            // Second Says if it hits something
            // If true, next 3 are coordinates of player hit
        }
        
    }
}

float[][] decode(String data){
    String[] rawRows = data.split("\n");
    float[][] messages = new float[rawRows.length][];
    for(int i = 0; i < rawRows.length; i++){
        String[] rawRow = rawRows[i].split(",");
        float[] messageRow = new float[rawRow.length];
        for(int j = 0; j < rawRow.length; j++){
            messageRow[j] = float(rawRow[j]);
        }
        messages[i] = messageRow;
    }
    return messages;
}
