import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

import g4p_controls.*;

import java.util.ArrayList;

ArrayList <Atom> atoms;
ArrayList <PVector> points;

PeasyCam cam;
int numAtoms = 6;
double newE = 0;
double oldE = 10000;
double minE = 0.;
float step = (numAtoms+1)*10;
float aveAngle = 0;

void setup(){
     frameRate(10);
    size(500,500, P3D);
  strokeWeight(5);
  reset();
}

void reset(){
  newE = 0;
  oldE = 10000;
  minE = 0.;
   step = (numAtoms+1)*10;
   aveAngle = 0;
  cam = new PeasyCam(this, 500);
    cam.setMinimumDistance(50);
    cam.setMaximumDistance(2000);
    atoms = new ArrayList<Atom>();

    for (int i = 0; i < numAtoms; i ++){
      atoms.add(new Atom());
    }   
        points = new ArrayList<PVector>();
        points.add(new PVector(0,-3.6*100+260));
  //  createGUI();
}

void calcE(Atom _p){

  for (Atom a : atoms){ 
    if (a!=_p){
      newE += _p.charge*a.charge/_p.move.dist(a.move);
    }
  }
}

float aveAngle(){
  float angle = 0;
  float count = 0;
  for (Atom a: atoms){
     for (Atom aa:atoms){
      if (a!=aa){ angle += PVector.angleBetween(a.pos,aa.pos);count ++;}
     }
  }
  
  angle = (angle * 180.)/ ((count)*PI);
  return angle;  
}

public void keyPressed(){
   if (key == ' '){
     reset();
   }
}

void draw(){
  background(200,200,200);
  //draw the central atom
  noStroke();
 
  fill(30,30,30,110);
  pushMatrix();
  //translate(500/2,500/2, 0);
  sphere(40);
  popMatrix();
  stroke(255,100,0,50);

      newE = 0;
  for (Atom p:atoms){

    p.jostle(step*(float)Math.random());
  
    calcE(p);
    p.drawA();
  }
  
  if ((newE - oldE) < minE){
    step *= 0.98;//(numAtoms);
    for (Atom p:atoms){
      p.pos.set( p.move);
      //for (Atom a:atoms
    }
    float scaledE = (float)newE*-numAtoms*10+300;//*-numAtoms*+numAtoms*100;
 
    //find the average angle
    println(newE +","+oldE+","+(int)scaledE+","+step +","+aveAngle());

      oldE = newE;
    points.add(new PVector(points.size()*10,scaledE));    
  }
  else {step += 3.*(numAtoms-1)/1000.;}
  cam.beginHUD();
  for (int i = 1; i < points.size();i++){
     line(points.get(i-1).x, points.get(i-1).y,points.get(i).x, points.get(i).y ); 
  }
  cam.endHUD();
  if (points.size()*10>width){
     noLoop(); 
  }
}