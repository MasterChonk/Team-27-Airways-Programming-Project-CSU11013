class FlightsPerState{
  ArrayList<DataPoint> flights;
  ArrayList<String> airportNames;
  ArrayList<Integer> numberOfFlights;
  String specificAirport;
  
  FlightsPerState(ArrayList<DataPoint> flights,String specificAirport){
    this.flights = flights;
    this.specificAirport = specificAirport;
    airportNames = new ArrayList<String>();
    numberOfFlights = new ArrayList<Integer>();
    
    for(DataPoint dp : flights){
    if(dp.originState.equals(specificAirport)){
      if(!airportNames.contains(dp.destState)){
        airportNames.add(dp.destState);
        numberOfFlights.add(1);
      }
      
      else{
        int index = airportNames.indexOf(dp.destState);
        int currentValue = numberOfFlights.get(index);
        numberOfFlights.set(index,currentValue+1);
      }
    }
  }
}
}
