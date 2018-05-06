import processing.net.*;

Client user;
String ipToServer = "192.168.1.25";
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

int getID(){
    return int(getMessage());
}

void createClient() {
    user = new Client(applet, ipToServer, 4531);
    delay(3000);
    checkServer();
}

void sendData(){
    user.write(str(0) + "," + str(mainPlayer.id) + "," + mainPlayer.position.x + "," + mainPlayer.position.y + "," + mainPlayer.position.z + "," + mainPlayer.xAngle + "," + mainPlayer.yAngle + "\n");
}

void checkServer() {
    while (user.available() > 0) {
        serverMessages = concat(serverMessages, user.readString().split("\n"));
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

void exit(){
    user.write(mainPlayer.id);
    super.exit();
}
