import processing.net.*;

Client c;
String ipToServer = "192.168.1.25";
String[] serverMessages = {};
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
    c = new Client(applet, ipToServer, 4531);
    delay(1000);
    checkServer();
}

void checkServer(){
    while (c.available() > 0) {
        serverMessages = concat(serverMessages, c.readString().split("\n"));
    }
}

String getMessage(){
    String message = "";
    try{
        messageIndex++;
        message = serverMessages[messageIndex];
    }catch(Exception e){
        messageIndex--;
    }
    //println(message);
    return message;
}
