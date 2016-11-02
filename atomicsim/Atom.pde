public class Atom{
  PVector pos;
  PVector move;
  float siz = 20;
  float charge = 5;
  float dist = 100;
  
  public Atom(){
    init_val();
  }
  
  public Atom(PVector p){
   
  }
  
  public void init_val(){
    siz = 20;
    charge = 5;
    dist = 100;
    pos = PVector.random3D();
    move = PVector.random3D();

    pos.mult(dist);
  }
  
  void jostle(){
     move = PVector.random3D();
     move.mult(15.);
     move.add(pos);
     applyF();
    
     move.setMag(dist);
     
  }
  void jostle(float amount){
     move = PVector.random3D();
     move.mult(amount);
     move.add(pos);
     applyF();
    
     move.setMag(dist);
     
  }  
  void applyF(){
    for (Atom a : atoms){ 
      if (a!=this){
        //find a vector between the two Atoms
        PVector disp = new PVector(a.pos.x,a.pos.y);
        disp.sub(this.pos);
        disp.normalize();
        float force = 0.2*this.charge*a.charge/disp.magSq();
        disp.mult(force/1000.);
        pos.add(disp);
      }
      pos.setMag(dist);
    }
  }
  
  
  void adjust(){
    
  }
  
  void drawA(){
    pushMatrix();
      //translate(width/2,width/2,width/2);
    line(0,0,0,pos.x,pos.y,pos.z);
    translate(pos.x,pos.y,pos.z);
      fill(200,200,10, 50);
    sphere(20);
    popMatrix();
        pushMatrix();
    translate(move.x,move.y,move.z);
    fill(0,50,200,30);
    sphere(20);
    popMatrix();
  }
}