
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import ddf.minim.*;
Box2DProcessing box2d; 
Caja una;
Caja2 dos;


PImage img;
PImage img1;
PImage img2;
PImage img3;
int pantalla;
ArrayList<Caja> cajas; 
ArrayList<Caja2> cajasdos;
PFont f;
PFont g;
PFont m;

Minim minim; 

AudioPlayer cancion1; 
AudioPlayer cancion2; 

void setup(){ 
  size(800,600); 
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,5);
  una = new Caja(200,200,30,20);
  dos = new Caja2 (200,200,30,20);
 cajas = new ArrayList<Caja>();
 cajasdos = new ArrayList<Caja2>();
 
 img = loadImage("portada.jpg");
 img1 = loadImage("eleccion.jpg");
 img2 = loadImage("sinclair.jpg");
 img3 = loadImage("demian.jpg");
 
minim = new Minim(this); 

cancion1 = minim.loadFile("abraxas2.mp3"); 
cancion2 = minim.loadFile("silence.mp3");

cancion1.play();


}

void draw(){
  switch(pantalla) {  
    case 0:{
  image(img,0,0);

  noStroke();
  fill(255);
 rect(270,480,300,80);
 fill(0);
 textSize(50);
 f = createFont("Algerian", 50);
textFont(f);
 text("Descifrar",295,540);

    }
    break;
    case 1: {
      background(255);
      image(img1,0,0);
      fill(0);
      rect(50,215,200,100);
      fill(255);
      //textSize(50);
      g = createFont("Bodoni MT Negrita", 60);
      textFont(g);
      text("Sinclair",57,280);
      fill(255);
      rect(550,215,200,100);
      fill(0);
      //textSize(50); 
      text("Demian",553,280);
    } 
    break; 
    case 2:{ 
    background(255); 
    image(img2,150,90);
    m = createFont("Monotype Corsiva", 20);
      textFont(m);
    textAlign(CENTER);
    fill(0);
    text("La niñez había quedado atrás.",400,50); 
    text("Una vaga desilusión fue debilitando y esfumando mis sentimientos y alegrías habituales.",400,80);
    box2d.step();
  una.display();
  
   for(int i = cajas.size()-1; i>=0; i--){
    Caja c = cajas.get(i);
    if(c.estaEnPantalla()){
      c.display();
    }
    else{
      cajas.remove(i);
    }
    
  }
  
    
  }
    
    break;  
    
    case 3: {
      background(0);
      image(img3,150,90);
       m = createFont("Monotype Corsiva", 20);
      textFont(m);
    textAlign(CENTER);
    fill(255);
    text("Quería tan sólo intentar vivir lo que Tendía a brotar espontáneamente de mi.",400,50); 
    text("¿Por qué había de serme tan difícil?.",400,80);
      box2d.step();
  dos.display();
  
   for(int i = cajasdos.size()-1; i>=0; i--){
    Caja2 c = cajasdos.get(i);
    if(c.estaEnPantalla()){
      c.display();
    }
    else{
      cajasdos.remove(i);
    }
    
  }
  
     } 
     
  }
     
  }
  
    
    
void mousePressed(){
  switch(pantalla){ 
    case 0:{
  
 if((mouseX>270)&& (mouseX<570) &&(mouseY>480) && (mouseY<560)){
  
   pantalla=1;
   cancion1.pause();
 }
    }
 break; 
 
 case 1: {
  if((mouseX>50)&& (mouseX<250) &&(mouseY>215) && (mouseY<315)) {
    pantalla=2;  
    cancion2.play();
  }
    else{
      if((mouseX>550)&& (mouseX<750) &&(mouseY>215) && (mouseY<315)){
        pantalla=3;
        cancion2.play();
      }
    }
  
 } 
 break; 
 
 case 2: 
 if((mouseX>150)&& (mouseX<650) &&(mouseY>90) && (mouseY<590)){
 Caja c = new Caja(mouseX,mouseY,30,20);
  cajas.add(c);
} 
break; 
case 3:
if((mouseX>150)&& (mouseX<650) &&(mouseY>90) && (mouseY<590)){
 Caja2 c = new Caja2(mouseX,mouseY,30,20);
  cajasdos.add(c);
} 
 
 
 
 }
}
 
