import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
 
void sounds(){
  
  minim = new Minim(this);
 
  // this loads mysong.wav from the data folder
  song = minim.loadFile("Sounds/Gunshot2.wav");
  song.play();
}