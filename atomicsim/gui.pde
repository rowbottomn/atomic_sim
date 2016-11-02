/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void OK(GButton source, GEvent event) { //_CODE_:button1:269541:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button1:269541:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:587559:
  appc.background(230);
} //_CODE_:window1:587559:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("AtomSim");
  label1 = new GLabel(this, 64, 161, 80, 20);
  label1.setText("My label");
  label1.setOpaque(false);
  label2 = new GLabel(this, 288, 150, 80, 20);
  label2.setText("My label");
  label2.setOpaque(false);
  titleLabel = new GLabel(this, 18, 24, 406, 102);
  titleLabel.setText("AtomSim");
  titleLabel.setTextBold();
  titleLabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  titleLabel.setOpaque(false);
  button1 = new GButton(this, 179, 264, 80, 30);
  button1.setText("OK");
  button1.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  button1.addEventHandler(this, "OK");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 240, 120, JAVA2D);
  window1.noLoop();
  window1.addDrawHandler(this, "win_draw1");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GLabel label1; 
GLabel label2; 
GLabel titleLabel; 
GButton button1; 
GWindow window1;