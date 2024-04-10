// Junyi Xia
// Class for creating Heat Map
class HeatMap {
  FlightsPerState flightsData;
  ArrayList<StateShape> states;

  HeatMap(FlightsPerState flightsData, ArrayList<StateShape> states) {
    this.flightsData = flightsData;
    this.states = states;
    applyColorMapping();
  }

  void applyColorMapping() {
    int maxFlights = 1;
    for (Integer flightsCount : flightsData.numberOfFlights) {
      if (flightsCount > maxFlights) {
        maxFlights = flightsCount;
      }
    }
    for (int i = 0; i < flightsData.airportNames.size(); i++) {
      String airportName = flightsData.airportNames.get(i);
      PImage texture = createColorTexture(flightsData.numberOfFlights.get(i), maxFlights);
      for (StateShape state : states) {
        if (state.name.equals(airportName)) {
          state.shape.setTexture(texture);
          break;
        }
      }
    }
  }

  PImage createColorTexture(int flights, int maxFlights) {
    int red = 0, green = 0, blue = 0;
    float ratio = flights / (float)maxFlights;
    if (flights == 0) {
      red = 128;
      green = 128;
      blue = 128;
    } else {
      if (ratio < 0.33) {
        red = (int) (ratio * 3 * 255);
        green = 255;
      } else if (ratio < 0.66) {
        red = 255;
        green = (int) ((0.66 - ratio) * 3 * 255);
      } else {
        red = 255;
        green = (int) ((1.0 - ratio) * 3 * 255);
      }
      blue = 0;
    }

    PImage texture = createImage(1, 1, RGB);
    texture.loadPixels();
    for (int i = 0; i < texture.pixels.length; i++) {
      texture.pixels[i] = color(red, green, blue);
    }
    texture.updatePixels();
    return texture;
  }
  // First each individual state/territory is drawn
  void display() {
    for (StateShape state : states) {
      state.display();
    }
  }
  // Then the Heat Map is drawn fully
  void draw() {
    translate(0, 50, 0);
    textSize(50);
    for (StateShape state : states) {
      float mouseXTransformed = (mouseX - (width) / 2) / 100.0;
      float mouseYTransformed = (mouseY - (height+50)/ 2) / 100.0;
      if (isMouseOverState(mouseXTransformed, mouseYTransformed, state)) {
        pushMatrix();
        translate(0, 0, 0.5);
        fill(0);
        stateSelectedMap += americanStateNames[Arrays.asList(americanStateAbbr).indexOf(state.name)];
        int number;
        int index = flights.airportNames.indexOf(state.name);
        if (index != -1)
          number = flights.numberOfFlights.get(index);
        else
          number = 0;
        stateSelectedMap += " : " + number;
        popMatrix();
        break;
      }
    }
    scale(100);
    for (StateShape state : states) {
      float mouseXTransformed = (mouseX - width / 2) / 100.0;
      float mouseYTransformed = (mouseY - (height+50) / 2) / 100.0;
      state.updateTargetZ(isMouseOverState(mouseXTransformed, mouseYTransformed, state));
      state.updateZ();
      state.display();
    }
    lastMouseX = mouseX;
    lastMouseY = mouseY;
  }
}
boolean isMouseOverState(float mouseX, float mouseY, StateShape state) {
  float distance = dist(mouseX, mouseY, state.x, state.y);
  return distance < 0.5;
}
