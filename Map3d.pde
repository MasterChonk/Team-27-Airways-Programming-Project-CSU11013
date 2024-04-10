// Junyi Xia
// Class for creating the 3D map with the orange bars
class Map3d {
  FlightsPerState flightsData;
  ArrayList<StateShapeForCubes> stateCubes;
  float divider;
  Map3d(FlightsPerState flightsData, ArrayList<StateShapeForCubes> stateCubes) {
    this.flightsData = flightsData;
    this.stateCubes = stateCubes;
  }
  void draw() {
    // 3D Map is drawn
    translate(0, 0, 0);
    scale(100);
    rotateX(0.5);
    for (StateShapeForCubes state : stateCubes) {
      state.display();
    }

    for (StateShapeForCubes state : stateCubes) {
      stroke(255);
      strokeWeight(0.01);
      fill(ORANGE);
      int airportIndex = flights.airportNames.indexOf(state.name);
      float numberOfFlightsForState;
      if (airportIndex == -1) {
        numberOfFlightsForState = 0;
      } else {
        numberOfFlightsForState = flights.numberOfFlights.get(airportIndex);
      }
      maxFlights = Collections.max(flightsData.numberOfFlights);
      float height = (numberOfFlightsForState/maxFlights)*5;
      pushMatrix();
      translate(state.x, state.y, height/2);
      if (height != 0)
        box(0.15, 0.15, height);
      popMatrix();
    }
  }
}
