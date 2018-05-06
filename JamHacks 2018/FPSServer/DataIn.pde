void draw() {
    background(255);
    Client c = s.available();
    if (c != null) {
        float[][] info = decode(c.readString());
        for (int i = 0; i < info.length; i++) {
            if (info[i][1] == 0) {
                //id, x, y, z, xa, ya
                //println();
                //println(info[i][1], info[i][2], info[i][3], info[i][4], info[i][5], info[i][6]);
                int id = int(info[i][0]);
                float x = info[i][2];
                float y = info[i][3];
                float z = info[i][4];
                float xA = info[i][5];
                float yA = info[i][6];
                playerData[id] = new float[] {x, y, z, xA, yA};
                //println("Player Data: ", playerData[id]);
            } else if (info[i][1] == 1) {
            }
        }
    }
    String dataString = dataToString(playerData);
    
    send(s, dataString);
    send(s, "\n*");
}

float[][] decode(String data) {
    String[] rawRows = split(data, "\n");
    float[][] messages = new float[rawRows.length][];
    for (int i = 0; i < rawRows.length; i++) {
        String[] rawRow = split(rawRows[i], ",");
        float[] messageRow = new float[rawRow.length];
        for (int j = 0; j < rawRow.length; j++) {
            messageRow[j] = float(rawRow[j]);
        }
        messages[i] = messageRow;
    }
    return messages;
}
