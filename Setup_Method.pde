void setup() {
  textSize(20);
  // Images and Fonts are initialised
  PImage logo27Airways = loadImage("27 Airways Logo.png");
  PImage experience27Airways = loadImage("27 Airways Experience.jpg");
  PImage calendarIcon = loadImage("Calendar Icon.png");
  PImage airportIcon = loadImage("Airport Icon.png");
  PImage USAflag = loadImage("USA Flag.png");
  PImage Irelandflag = loadImage("Ireland Flag.png");
  PImage doubleArrow = loadImage("Double Arrow.png");
  PFont airlineFont = loadFont("TrebuchetMS-Bold-48.vlw");
  PFont selectorFont = loadFont("Calibri-Bold-40.vlw");
  PFont headerFont = loadFont("Calibri-Bold-25.vlw");
  PFont regularFont = loadFont("Calibri-20.vlw");
  PFont boldRegularFont = loadFont("Calibri-Bold-20.vlw");
  
  // Tables are assigned to the Data
  table = loadTable("flights full month.csv", "header");  
  allAirports = loadTable("All Airports.csv", "header");
  
  // Check if CSV file for all Airports is created
  if (allAirports == null) {
    AirportCSV(table);
    allAirports = loadTable("All Airports.csv", "header");   
  }   
  
  // allAirports CSV file data is loaded in
  airportCodes = allAirports.getStringColumn("Code");
  airportStates = allAirports.getStringColumn("State");
  airportStateNames = allAirports.getStringColumn("State Name");
  airportCities = allAirports.getStringColumn("City"); 

  // Methods are called
  ImageCreation(logo27Airways, experience27Airways, calendarIcon, airportIcon, USAflag, Irelandflag, doubleArrow);
  WidgetCreation(airlineFont, selectorFont, headerFont, regularFont, boldRegularFont);

  // ScreenList is filled
  Screen homeScreen = new Screen(HOME_SCREEN, WHITE, homeWidgetList, homeImageList, homeEmptyWidgetList);
  Screen calendarScreen = new Screen(CALENDAR_SCREEN, WHITE, calendarWidgetList, null, calendarEmptyWidgetList);  
  Screen airportScreen = new Screen(AIRPORT_SCREEN, WHITE, airportWidgetList, null, airportEmptyWidgetList);
  Screen dataScreen = new Screen(DATA_SCREEN, WHITE, dataWidgetList, dataImageList, dataEmptyWidgetList);
  screenList.add(homeScreen);
  screenList.add(calendarScreen);
  screenList.add(airportScreen);
  screenList.add(dataScreen);
}
