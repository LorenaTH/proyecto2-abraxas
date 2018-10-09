class Caja{ 

  float ancho;
  float alto;
  Body b;
  color c;
  PFont h;
 
 
  Caja(float x_, float y_,float ancho_, float alto_){
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
    //textSize(10);
    h = createFont("High Tower Text Cursiva", 30);
      textFont(h);
      textAlign(CENTER);
    text("HOGAR",0,0);
    text("RIGOR",100,130);
    text("AMOR",140,200);
    text("COLEGIO",50, 230); 
    text("BIBLIA",280,300); 
    text("CONDUCTA EJEMPLAR",25,350);
    text("BUENAS COSTUMBRES",350,40); 
    text("PAZ",10,450); 
    text("INFANCIA",480,80);
    text("PADRE",25,60); 
    text("MADRE",400,10);
   popMatrix();    
  }
  
}
