import processing.net.*;

Client c;
String ipToServer = "192.168.1.25";

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
    if (c.available() > 0) {
        println(c.readString());
    }
}

void checkServer(){
    if (c.available() > 0) {
        println(c.readString());
    }
}
