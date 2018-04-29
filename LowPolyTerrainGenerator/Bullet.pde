class Bullet{
    PVector position;
    float xAngle;
    float yAngle;
    float speed;
    
    boolean firstFrame = true;
    
    Bullet(PVector position, float xAngle, float yAngle, float speed){
        this.position = position;
        this.xAngle = xAngle;
        this.yAngle = yAngle;
        this.speed = speed;
    }
    
    void update(){
        //Change this if code not working
        position.add(speed * cos(xAngle), speed * sin(xAngle), speed * sin(yAngle));
    }
    
    void display(){
        
    }
}
