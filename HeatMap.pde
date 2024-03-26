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
     PImage texture = createColorTexture(flightsData.numberOfFlights.get(i),maxFlights);
      for (StateShape state : states) {
        if (state.name.equals(airportName)) {
          state.shape.setTexture(texture);
          break;
        }
      }
    }
  }

PImage createColorTexture(int flights, int maxFlights) {
  int red, green, blue;
  float ratio = flights / (float)maxFlights;
  if (flights == 0) {
    red = 128;    green = 128;    blue = 128;
  } else {
    if (ratio < 0.5) {
      red = (int) (2 * ratio * 255); 
      green = 255;
    } else {
      red = 255;
      green = (int) ((1 - ratio) * 2 * 255); 
    }
    blue = 0;
  }

  PImage texture = createImage(100, 100, RGB);
  texture.loadPixels();
  for (int i = 0; i < texture.pixels.length; i++) {
    texture.pixels[i] = color(red, green, blue);
  }
  texture.updatePixels();
  return texture;
}

  void display() {
    for (StateShape state : states) {
      state.display();
    }
  }
}
