import processing.net.*;

Client c;
String ipToServer = "127.0.0.1";

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
