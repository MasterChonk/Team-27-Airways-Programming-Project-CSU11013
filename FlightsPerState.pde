// Junyi Xia 
// Class for creating the Arraylists of flights per state
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
