// Jakub Kieblesz
// Class for creating all Airport Widgets for the airport selector
class AirportWidget {
  int x, y, width, height, corner, moveScreen;
  String CSVstring, label; 
  color widgetColor, hoverColor, selectedColor, labelColor, baseLabelColor, selectedLabelColor;
  PFont widgetFont, baseFont, selectedFont;
  boolean isAirportState, isAirportCode, transparent;
  ArrayList airportList;

  AirportWidget(int x, int y, int width, int height, int corner, String CSVstring, String label, color hoverColor, color selectedColor, color baseLabelColor, color selectedLabelColor,
        PFont baseFont, PFont selectedFont, boolean isAirportState, boolean isAirportCode, boolean transparent, ArrayList airportList) {
    this.x = x; this.y = y; this.width = width; this.height = height; this.corner = corner;
    this.CSVstring = CSVstring; this.label = label; 
    this.hoverColor = hoverColor; this.selectedColor = selectedColor; this.baseLabelColor = baseLabelColor; this.selectedLabelColor = selectedLabelColor;
    this.baseFont = baseFont; this.selectedFont = selectedFont;
    this.isAirportState = isAirportState; this.isAirportCode = isAirportCode; this.transparent = transparent;
    this.airportList = airportList;   
  }
  void mouseMoved() {
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
      typeCursor = HAND;
    }
    if (isAirportState == true || isAirportCode == true) {
      widgetColor = selectedColor;
      labelColor = selectedLabelColor;
      widgetFont = selectedFont;
      transparent = false;
    }
    else {
      if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {        
        widgetColor = hoverColor;
        transparent = false;
      }
      else {
        labelColor = baseLabelColor;
        widgetFont = baseFont;
        transparent = true;
      }
    }
  }
  void draw() { 
    if (transparent == true) {
      noFill();
    }
    else {
      fill(widgetColor);     
    }
    noStroke(); 
    rect(x, y, width, height, corner);
    
    fill(labelColor);
    textFont(widgetFont);
    textAlign(LEFT, CENTER);
    text(label, x + 10, y + (height/2));    
  }
  boolean getEvent(int mX, int mY) {
    if (mX >= x && mX <= x+width && mY >= y && mY <= y+height) {
      return BUTTON_PRESSED;
    }
    return BUTTON_NOT_PRESSED;
  }
}
