void AirportCSV(Table table) {
  // 3 Columns of Data are loaded in
  String[] airportCodes = table.getStringColumn("ORIGIN");
  String[] airportCities = table.getStringColumn("ORIGIN_CITY_NAME");
  String[] airportStates = table.getStringColumn("ORIGIN_STATE_ABR");
  
  // All State Detials are loaded in
  ArrayList <ArrayList> stateDetails = new ArrayList();
  for (int i = 0; i < americanStateNames.length; i++) {
    ArrayList newState = new ArrayList();
    newState.add(americanStateAbbr[i]);
    newState.add(americanStateNames[i]);
    stateDetails.add(newState);
  }

  // allAirports ArrayList is created  
  ArrayList uniqueAirportCodes = new ArrayList();
  ArrayList <ArrayList <String>> allAirports = new ArrayList();
  for (int i = 0; i < table.getRowCount(); i++) {
    if (!uniqueAirportCodes.contains(airportCodes[i])) {
      uniqueAirportCodes.add(airportCodes[i]);
      
      String currentCode = airportCodes[i]; 
      String currentState = airportStates[i];
      String currentCity = airportCities[i];
      currentCity = currentCity.substring(0, currentCity.length() - 4);
      //currentCity = (currentCity.equals("Washington")) ? "Washington, D.C." : currentCity; 
      for (int j = 0; j < currentCity.length(); j++) {
        if (currentCity.charAt(j) == '/') {
          currentCity = currentCity.substring(0, j);
        }
      }
      
      ArrayList newAirport = new ArrayList();
      newAirport.add(currentCode);
      newAirport.add(currentState);      
      for (int j = 0; j < stateDetails.size(); j++) {
        String stateAbbr = (String) stateDetails.get(j).get(0);
        if (stateAbbr.equals(currentState)) {
          String stateName = (String) stateDetails.get(j).get(1);
          newAirport.add(stateName);
          break;
        }
      }
      newAirport.add(currentCity);
      allAirports.add(newAirport);
    }
  }
  
  // allAirports now sorted by State Name and City
  Collections.sort(allAirports, new Comparator <ArrayList <String>>() {
    public int compare(ArrayList <String> airportA, ArrayList <String> airportB) {
      int cmp = airportA.get(stateNameIndex).compareTo(airportB.get(stateNameIndex));
      
      if (cmp == 0) {
        return airportA.get(cityIndex).compareTo(airportB.get(cityIndex));
      }
      return cmp;
    }
  });  
  
  // New Table is created
  Table AirportCSV = new Table();
  
  // Add Columns
  AirportCSV.addColumn("Code");
  AirportCSV.addColumn("State");
  AirportCSV.addColumn("State Name");
  AirportCSV.addColumn("City");
  
  // Add Rows
  for (int i = 0; i < allAirports.size(); i++) {
    TableRow newRow = AirportCSV.addRow();
    newRow.setString("Code", (String) allAirports.get(i).get(codeIndex));
    newRow.setString("State", (String) allAirports.get(i).get(stateIndex));
    newRow.setString("State Name", (String) allAirports.get(i).get(stateNameIndex));
    newRow.setString("City", (String) allAirports.get(i).get(cityIndex));
  }
  
  // Save Table to CSV File
  saveTable(AirportCSV, "All Airports.csv");
}
