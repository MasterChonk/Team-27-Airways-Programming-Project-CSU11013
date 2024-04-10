 void DataCreation() { 
  HashMap <String, Integer> counts = findFrequency(fullData.findData(destAirport, lateness, false, startDate, endDate, airportCode));
  ArrayList <String> categories = new ArrayList <String> (Arrays.asList(counts.keySet().toArray(new String[0])));
  ArrayList <Integer> frequencies = new ArrayList <Integer> (Arrays.asList(counts.values().toArray(new Integer[0])));
  
  HashMap <String, Integer> counts1 = findFrequency(fullData.findData(destAirport, lateness, true, startDate, endDate, airportState));
  ArrayList <String> categories1 = new ArrayList <String> (Arrays.asList(counts1.keySet().toArray(new String[0])));
  ArrayList <Integer> frequencies1 = new ArrayList <Integer> (Arrays.asList(counts1.values().toArray(new Integer[0])));
  
  HashMap <String, Integer> counts2 = fullData.findData(lateness, destAirport, startDate, endDate, airportState, "DISTANCE");
  ArrayList <String> categories2 = new ArrayList <String> (Arrays.asList(counts2.keySet().toArray(new String[0])));
  ArrayList <Integer> frequencies2 = new ArrayList <Integer> (Arrays.asList(counts2.values().toArray(new Integer[0])));
  
  // Both Heat Map and 3D Map are initialised
  SetupMaps();
  flights = new FlightsPerState(frequencies1, categories1, airportState);
  maxFlights = Collections.max(frequencies);
  
  // 3D Map Screen Object
  Map3d map3d = new Map3d(flights, stateCubes);
  map3dList.add(map3d);
  
  // Heat Map Screen Object
  HeatMap heatMap = new HeatMap(flights, states);
  heatMapList.add(heatMap);
  
  // Histogram Screen Object
  int[] flightArray = new int[counts.values().toArray(new Integer[0]).length];
  for (int i = 0; i < counts.values().toArray(new Integer[0]).length; i++) {
    flightArray[i] = counts.values().toArray(new Integer[0])[i];
  }
  Histogram histogram = new Histogram(counts, counts.keySet().toArray(new String[0]), flightArray);
  histogramList.add(histogram);
  
  // Bar Chart Screen Object
  BarChart barChart = new BarChart(categories2, frequencies2);
  barChartList.add(barChart);
  
  // Pie Chart Screen Object
  PieChart pieChart = new PieChart(frequencies, categories, airportCode);
  pieChartList.add(pieChart); 
}
