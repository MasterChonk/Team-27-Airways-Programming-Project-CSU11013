// Jakub Kieblesz 
// Class for creating the orange toggles you see on the home page
class ToggleWidget {
  int x, y, width, xSlider, ySlider, circleWidth, rectWidth, sliderCircleWidth, gap;
  String label;
  String[] wordArray;
  color circleColor, sliderColor, baseSliderColor, selectedSliderColor, labelColor;
  boolean selected, textToggle;
  PFont widgetFont;
  
  // Constructor for ToggleWidget Class
  ToggleWidget(int x, int y, int width, int gap, String label, color circleColor, color baseSliderColor, color selectedSliderColor, color labelColor, boolean selected, boolean textToggle, PFont widgetFont) {
    this.x = x; this.y = y; this.width = width; this.gap = gap;
    this.label = label;
    this.circleColor = circleColor; this.baseSliderColor = baseSliderColor; this.selectedSliderColor = selectedSliderColor; this.labelColor = labelColor;
    this.selected = selected; this.textToggle = textToggle;
    this.widgetFont = widgetFont;
    xSlider = x;
    ySlider = y;
    sliderCircleWidth = width + 2*gap;
    if (textToggle == true) {
      String longestString = "";
      wordArray = label.split(",");
      for (String word : wordArray) {
        if (word.length() >= longestString.length()) {
          longestString = word;
        }
      }
      rectWidth = 2*((int) textWidth(longestString)) + width;
    }
    else {
      rectWidth = width;
    }
  }
  void mouseMoved() {
    if (mouseX >= xSlider - sliderCircleWidth/2 && mouseX <= xSlider + rectWidth + sliderCircleWidth/2 && mouseY >= ySlider - sliderCircleWidth/2 && mouseY <= ySlider + sliderCircleWidth/2) {
      typeCursor = HAND;
    }
  }
  void draw() {
    if (selected == true) {
      sliderColor = selectedSliderColor;
    }
    else {
      sliderColor = baseSliderColor;
    }
    fill(sliderColor);
    noStroke();
    arc(xSlider, ySlider, sliderCircleWidth, sliderCircleWidth, HALF_PI, 3*HALF_PI);
    arc(xSlider + rectWidth, ySlider, sliderCircleWidth, sliderCircleWidth, -HALF_PI, HALF_PI);
    rect(xSlider, ySlider - sliderCircleWidth/2, rectWidth, sliderCircleWidth);   
    
    fill(circleColor);
    noStroke();
    if (textToggle == true) {
      arc(x, y, width, width, HALF_PI, 3*HALF_PI);
      arc(x + (rectWidth - width)/2, y, width, width, -HALF_PI, HALF_PI);
      rect(x, y - width/2, (rectWidth - width)/2, width);
      
      fill(labelColor);
      textFont(widgetFont);
      textAlign(CENTER, CENTER);
      int xLabel = xSlider; int yLabel = ySlider;
      for (int i = 0; i < 2; i++) {
        text(wordArray[i], xLabel + (rectWidth - width)/4 + i*(rectWidth+width)/2, yLabel);        
      }
    }
    else {
      circle(x, y, width);
    }
    
  }
  boolean getEvent(int mX, int mY) {
    if (mX >= xSlider - sliderCircleWidth/2 && mX <= xSlider + rectWidth + sliderCircleWidth/2 && mY >= ySlider - sliderCircleWidth/2 && mY <= ySlider + sliderCircleWidth/2) {
      return BUTTON_PRESSED;
    }
    return BUTTON_NOT_PRESSED;
  }
}
