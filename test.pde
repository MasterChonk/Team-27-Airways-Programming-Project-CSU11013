import java.util.Collections;
ArrayList<StateShape> states = new ArrayList<StateShape>();
float xoffset = -6.5;
float yoffset = -4;
float angleX, angleY,initialAngleX = 0,initialAngleY = 0,lastMouseX, lastMouseY;
boolean dragging = false;
final float MAX_ANGLE = PI; 
FlightsPerState flights;
String[] lines;
ArrayList<DataPoint> dataPoints = new ArrayList<DataPoint>();
HeatMap heatmap;
void setup() {
  size(1500, 1000, P3D);
  lines = loadStrings("flights2k(1).csv");
  for (int i = 1; i < lines.length; i++) { 
    String[] fields = split(lines[i], ',');
    for (int j = 0; j < fields.length; j++) {
      fields[j] = fields[j].replaceAll("^\"|\"$", "");
    }
    dataPoints.add(new DataPoint(fields)); 
  }
  String FromWhatAirport = "IL";
  FlightsPerState flights = new FlightsPerState(dataPoints,FromWhatAirport);
  states = new ArrayList<StateShape>();
  states.add(new StateShape("AL", loadShape("AL.obj"), xoffset + 8.6, yoffset + 5.6));  states.add(new StateShape("AK", loadShape("AK.obj"), xoffset + 1.7, yoffset + 6.8));
  states.add(new StateShape("AZ", loadShape("AZ.obj"), xoffset + 2.52, yoffset + 4.85));  states.add(new StateShape("AR", loadShape("AR.obj"), xoffset + 7.2, yoffset + 5.05));
  states.add(new StateShape("CA", loadShape("CA.obj"), xoffset + 0.93, yoffset + 3.45));  states.add(new StateShape("CO", loadShape("CO.obj"), xoffset + 4.13, yoffset + 3.69));
  states.add(new StateShape("CT", loadShape("CT.obj"), xoffset + 11.35, yoffset + 2.5));  states.add(new StateShape("DE", loadShape("DE.obj"), xoffset + 10.85, yoffset + 3.35));
  states.add(new StateShape("FL", loadShape("FL.obj"), xoffset + 9.45, yoffset + 6.73));  states.add(new StateShape("GA", loadShape("GA.obj"), xoffset + 9.38, yoffset + 5.48));
  states.add(new StateShape("HI", loadShape("HI.obj"), xoffset + 3.6, yoffset + 7));  states.add(new StateShape("ID", loadShape("ID.obj"), xoffset + 2.43, yoffset + 1.63));
  states.add(new StateShape("IL", loadShape("IL.obj"), xoffset + 7.79, yoffset + 3.6));  states.add(new StateShape("IN", loadShape("IN.obj"), xoffset + 8.46, yoffset + 3.55));
  states.add(new StateShape("IA", loadShape("IA.obj"), xoffset + 6.9, yoffset + 2.95));  states.add(new StateShape("KS", loadShape("KS.obj"), xoffset + 5.7, yoffset + 3.96));
  states.add(new StateShape("KY", loadShape("KY.obj"), xoffset + 8.5, yoffset + 4.25));  states.add(new StateShape("LA", loadShape("LA.obj"), xoffset + 7.36, yoffset + 6.15));
  states.add(new StateShape("ME", loadShape("ME.obj"), xoffset + 11.85, yoffset + 1.2));  states.add(new StateShape("MD", loadShape("MD.obj"), xoffset + 10.59, yoffset + 3.47));
  states.add(new StateShape("MA", loadShape("MA.obj"), xoffset + 11.5, yoffset + 2.2));  states.add(new StateShape("MI", loadShape("MI.obj"), xoffset + 8.25, yoffset + 2.17));
  states.add(new StateShape("MN", loadShape("MN.obj"), xoffset + 6.82, yoffset + 1.6));  states.add(new StateShape("MS", loadShape("MS.obj"), xoffset + 7.8, yoffset + 5.65));
  states.add(new StateShape("MO", loadShape("MO.obj"), xoffset + 7.1, yoffset + 4.03));  states.add(new StateShape("MT", loadShape("MT.obj"), xoffset + 3.5, yoffset + 1.13));
  states.add(new StateShape("NE", loadShape("NE.obj"), xoffset + 5.42, yoffset + 3.07));  states.add(new StateShape("NV", loadShape("NV.obj"), xoffset + 1.67, yoffset + 3.32));
  states.add(new StateShape("NH", loadShape("NH.obj"), xoffset + 11.45, yoffset + 1.7));  states.add(new StateShape("NJ", loadShape("NJ.obj"), xoffset + 11, yoffset + 2.97));
  states.add(new StateShape("NM", loadShape("NM.obj"), xoffset + 3.9, yoffset + 5));  states.add(new StateShape("NY", loadShape("NY.obj"), xoffset + 10.5, yoffset + 2.1));
  states.add(new StateShape("NC", loadShape("NC.obj"), xoffset + 10.05, yoffset + 4.58));  states.add(new StateShape("ND", loadShape("ND.obj"), xoffset + 5.38, yoffset + 1.23));
  states.add(new StateShape("OH", loadShape("OH.obj"), xoffset + 9.2, yoffset + 3.3));  states.add(new StateShape("OK", loadShape("OK.obj"), xoffset + 5.7, yoffset + 4.9));
  states.add(new StateShape("OR", loadShape("OR.obj"), xoffset + 1.15, yoffset + 1.53));  states.add(new StateShape("PA", loadShape("PA.obj"), xoffset + 10.3, yoffset + 2.93));
  states.add(new StateShape("PR", loadShape("PR.obj"), xoffset + 7.6, yoffset + 7.1));  states.add(new StateShape("RI", loadShape("RI.obj"), xoffset + 11.57, yoffset + 2.4));
  states.add(new StateShape("SC", loadShape("SC.obj"), xoffset + 9.9, yoffset + 5.2));  states.add(new StateShape("SD", loadShape("SD.obj"), xoffset + 5.4, yoffset + 2.23));
  states.add(new StateShape("TN", loadShape("TN.obj"), xoffset + 8.55, yoffset + 4.73));  states.add(new StateShape("TX", loadShape("TX.obj"), xoffset + 5.32, yoffset + 6.05));
  states.add(new StateShape("TT", loadShape("TT.obj"), xoffset + 8, yoffset + 7.2));  states.add(new StateShape("UT", loadShape("UT.obj"), xoffset + 2.82, yoffset + 3.32));
  states.add(new StateShape("VT", loadShape("VT.obj"), xoffset + 11.15, yoffset + 1.75));  states.add(new StateShape("VI", loadShape("VI.obj"), xoffset + 8.5, yoffset + 7.1));
  states.add(new StateShape("VA", loadShape("VA.obj"), xoffset + 10.05, yoffset + 3.83));  states.add(new StateShape("WA", loadShape("WA.obj"), xoffset + 1.43, yoffset + 0.58));
  states.add(new StateShape("WV", loadShape("WV.obj"), xoffset + 9.8, yoffset + 3.63));  states.add(new StateShape("WI", loadShape("WI.obj"), xoffset + 7.63, yoffset + 2.2));
  states.add(new StateShape("WY", loadShape("WY.obj"), xoffset + 3.83, yoffset + 2.39));
  heatmap = new HeatMap(flights,states);
}
void draw() {
  background(255);
  lights();
  translate(width / 2, height / 2);
  stroke(0, 255, 0);   line(500,0,0,-500,0,0);  stroke(0, 0, 255);   line(0, -500, 0,0, 500, 0);   stroke(255, 0, 0);   line(0,0,500,0,0,-500);  rotateY(angleY);  
  if (dragging) {
    angleY += (mouseX - lastMouseX) * 0.005;    angleX += (mouseY - lastMouseY) * 0.005;    
    angleX = constrain(angleX, -MAX_ANGLE, MAX_ANGLE);    angleY = constrain(angleY, -MAX_ANGLE, MAX_ANGLE);
  }
  else {
    if (angleX != initialAngleX) {
      angleX += (initialAngleX - angleX) * 0.1;
    }
    if (angleY != initialAngleY) {
      angleY += (initialAngleY - angleY) * 0.1;
    }
  }
  scale(50);
  //for (StateShape state : states) {
  //  state.display();
  //}
    heatmap.display();
  
   lastMouseX = mouseX;
  lastMouseY = mouseY;
}
void mousePressed() {
  dragging = true;
}

void mouseReleased() {
  dragging = false;
}
