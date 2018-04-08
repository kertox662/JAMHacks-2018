class Box{
    PVector position;
    
    Box(PVector position){
        this.position = position;
    }
    
    void displayBox(){
        translate(position.x, position.y, position.z);
        box(150);
    }
}
