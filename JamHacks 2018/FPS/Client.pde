import processing.net.*;

Client user;
int clientID = -1;
String ipToServer = "192.168.1.15";
//Stores all the messages server has sent out.
String[] serverMessages = {};
//The index of the message read.
int messageIndex = -1;

int getServerID(String[] ids) {
    for (int i = 0; i < ids.length; i++) {
        if (ids[i] == ipToServer) {
            return i;
        }
    }
    return -1;
}

void getID() {
    clientID = int(getMessage());
}

void createClient() {
    user = new Client(applet, ipToServer, 4531);
    delay(3000);
    checkServer();
}

void sendData() {
    user.write(str(clientID) + "," + str(0) + ","
        + str(mainPlayer.position.x) + ","
        + str(mainPlayer.position.y) + ","
        + str(mainPlayer.position.z) + ","
        + str(mainPlayer.xAngle) + ","
        + str(mainPlayer.yAngle));
}

void checkServer() {
    while (user.available() > 0) {
        serverMessages = concat(serverMessages, split(user.readString(), "\n"));
    }
}

String getMessage() {
    String message = "";
    try {
        messageIndex++;
        message = serverMessages[messageIndex];
    }
    catch(Exception e) {
        messageIndex--;
    }
    return message;
}

String[] getMostRecentMessages(int numMessages){
    String[] messages = new String[numMessages];
    for(int i = 0; i < numMessages; i++){
        messages[i] = serverMessages[serverMessages.length - numMessages + i];
    }
    return messages;
}

void exit() {
    println("id is", clientID);
    user.write(str(clientID));
    super.exit();
}
