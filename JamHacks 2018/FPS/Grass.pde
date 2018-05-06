PShape grass;
class Grass extends Environment{
    Grass(float xPos, float yPos){
        super(xPos, yPos, getHeight(xPos, yPos), random(0, TWO_PI), 0, grass);
        environment = (Environment[]) append(environment, this);
    }
}

void loadGrass(){
    grass = loadShape("DryGrass2/LPDryGrass2.obj");
}
