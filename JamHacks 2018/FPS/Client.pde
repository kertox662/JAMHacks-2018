import processing.net.*;

Client c;
String ipToServer = "127.0.0.1";

int getServerID(String[] ids){
    for (int i = 0; i < ids.length; i++){
        if(ids[i] == ipToServer){
            return i;
        }
    }
    return -1;
}x
