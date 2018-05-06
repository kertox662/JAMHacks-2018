PShape bush;
class Bush extends Environment{
    Bush(float xPos, float yPos){
        super(xPos, yPos, getHeight(xPos, yPos), random(0, TWO_PI), 0, bush);
        environment = (Environment[]) append(environment, this);
    }
}
