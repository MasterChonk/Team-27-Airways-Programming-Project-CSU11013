class ToggleWidget {
  int x, y, xSlider, ySlider, width, sliderCircleWidth, gap;
  color circleColor, sliderColor, baseSliderColor, selectedSliderColor;
  boolean selected;
  
  ToggleWidget(int x, int y, int width, int gap, color circleColor, color baseSliderColor, color selectedSliderColor, boolean selected) {
    this.x = x; this.y = y; this.width = width; this.gap = gap;
    this.circleColor = circleColor; this.baseSliderColor = baseSliderColor; this.selectedSliderColor = selectedSliderColor;
    this.selected = selected;
    xSlider = x;
    ySlider = y;
    sliderCircleWidth = width + 2*gap;
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
    arc(xSlider + width, ySlider, sliderCircleWidth, sliderCircleWidth, -HALF_PI, HALF_PI);
    rect(xSlider, ySlider - width/2 - gap, width, sliderCircleWidth);
    
    fill(circleColor);
    noStroke();
    circle(x, y, width);
  }
  boolean getEvent(int mX, int mY) {
    if (mX > xSlider - width/2 - gap && mX < xSlider + width + width/2 + gap && mY > ySlider - width/2 - gap && mY < ySlider + width/2 + gap) {
      return BUTTON_PRESSED;
    }
    return BUTTON_NOT_PRESSED;
  }
}
