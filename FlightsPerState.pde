class FlightsPerState {
  //ArrayList<DataPoint> flights;
  ArrayList<String> airportNames;
  ArrayList<Integer> numberOfFlights;
  String specificAirport;

  FlightsPerState(ArrayList<Integer> numberOfFlights, ArrayList<String> airportNames, String specificAirport) {
    this.specificAirport = specificAirport;
    this.airportNames = airportNames;
    this.numberOfFlights = numberOfFlights;
  }
}
