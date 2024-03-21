class FlightsPerAirport{
  ArrayList<DataPoint> flights;
  ArrayList<String> airportNames;
  ArrayList<Integer> numberOfFlights;
  String specificAirport;
  
  FlightsPerAirport(ArrayList<DataPoint> flights,String specificAirport){
    this.flights = flights;
    this.specificAirport = specificAirport;
    airportNames = new ArrayList<String>();
    numberOfFlights = new ArrayList<Integer>();
    
    for(DataPoint dp : flights){
    if(dp.originCityShort.equals(specificAirport)){
      if(!airportNames.contains(dp.destCityShort)){
        airportNames.add(dp.destCityShort);
        numberOfFlights.add(1);
      }
      
      else{
        int index = airportNames.indexOf(dp.destCityShort);
        int currentValue = numberOfFlights.get(index);
        numberOfFlights.set(index,currentValue+1);
      }
    }
  }
}
}
