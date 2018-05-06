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

void createClient() {
    user = new Client(applet, ipToServer, 4531);
    delay(3000);
    checkServer();
}

void checkServer() {
    while (user.available() > 0) {
        serverMessages = concat(serverMessages, user.readString().split("\n"));
    }
}

String getMessage() {
    checkServer();
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
