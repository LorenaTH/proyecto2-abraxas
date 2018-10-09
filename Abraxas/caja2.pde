class Caja2 { 
  
  float ancho;
  float alto;
  Body b;
  color c;
  PFont h;
  
  Caja2(float x_, float y_,float ancho_, float alto_){
    this.ancho = ancho_;
    this.alto = alto_;
    this.c = color(random(255),random(255),random(255));
    
   
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_,y_));
    
   
    b = box2d.createBody(bd);
    
    
    PolygonShape ps = new PolygonShape();
    float anchoAjustado = box2d.scalarPixelsToWorld(ancho_/2);
    float altoAjustado = box2d.scalarPixelsToWorld(alto_/2);
    ps.setAsBox(anchoAjustado,altoAjustado);
    
   
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5; 
    
   
    b.createFixture(fd);
    
    b.setAngularVelocity(10);
  }
  
  boolean estaEnPantalla(){
    Vec2 posicion = box2d.getBodyPixelCoord(b);
   if(posicion.y>height+max(this.ancho,this.alto)){
      eliminarBody();
     return false;
   }
   else{
     return true;
   }
  }
  
  void eliminarBody(){
    box2d.destroyBody(b);  
  }
  
 
  void display(){
    Vec2 posicion = box2d.getBodyPixelCoord(b);
    
    pushMatrix();
    translate(posicion.x,posicion.y);
    fill(this.c);
     h = createFont( "Chiller", 30);
      textFont(h);
      textAlign(CENTER);
    text("MIEDO",0,0);
    text("PROHIBIDO",100,130);
    text("SOMBRA",140,200);
    text("ESTIGMA",50, 230); 
    text("CRUELDAD",280,300); 
    text("MUERTE",25,350);
    text("VIOLENCIA",350,40); 
    text("ASESINATOS",10,450); 
    text("ADULTEZ",480,80);
    text("SUICIDIO",25,60); 
    text("DOLOR",400,10);
   
    popMatrix();    
  }
  
}
