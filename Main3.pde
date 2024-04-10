// Jakub Kieblesz
// Main and Setup Method (where the program begins and where everything is setup)

// Data Analysis Tools imported
import java.util.*;
import java.io.*;

// All American States/Territories and their Abbreviations
final String[] americanStateNames = {"Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia",
  "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland",
  "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
  "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina",
  "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming",
  "Puerto Rico", "Trust Territories", "Virgin Islands"};
final String[] americanStateAbbr = {"AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA",
  "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
  "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
  "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
  "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY",
  "PR", "TT", "VI"};

boolean firstRun = true;

// Button Press Positions and Screen Indices
final boolean BUTTON_PRESSED = true;
final boolean BUTTON_NOT_PRESSED = false;
final int HOME_SCREEN = 0;
final int CALENDAR_SCREEN = 1;
final int AIRPORT_SCREEN = 2;
final int DATA_SCREEN = 3;
final int MAP3D_SCREEN = 4;
final int HEATMAP_SCREEN = 5;
final int HISTOGRAM_SCREEN = 6;
final int BAR_SCREEN = 7;
final int PIE_SCREEN = 8;

// Colors
final color PALE_ORANGE = #f8ddc1;
final color LIGHT_ORANGE = #f0b97e;
final color ORANGE = #e89338;
final color DARK_ORANGE = #cb7518;
final color GREY = #878787;
final color LIGHT_BLACK = #2d2d3e;
final color BLUE_BLACK = #1f1f2b;
final color BLACK = #000000;
final color WHITE = #ffffff;

// Dimensions of Home and Data Screen
final int SCREENX = 1800;
final int SCREENY = 1100;

// Rounding Corners are initialised
final int corner = 8;
final int noCorner = 0;

// Dimensions of the Buttons are initialised
final int firstRowY = 260;
final int secondRowY = 350;
final int rowHeight = 60;
final int rowGap = 20;
final int borderScreen = 100;
final int dataButtonWidth = 200;
final int dataButtonGap = 20;
final int dataButtonBorder = 40;

// Toggle Variables are initialised
final int toggleCircleWidth = 40;
final int toggleCircleGap = 8;
final int toggleLateX = borderScreen + toggleCircleWidth/2 + rowGap;
final int toggleLateY = firstRowY - (rowHeight/2) - rowGap;

// Toggle Label Variables are initialised
final int toggleLateLabelX = borderScreen + (toggleCircleWidth+toggleCircleGap)*2 + rowGap;
final int toggleLateLabelY = firstRowY - rowHeight - rowGap;
final int toggleLateLabelWidth = 200;

// Toggle Switch Variables are initialised
final int toggleDestX = toggleLateLabelX + toggleLateLabelWidth + rowGap + 50;
final int toggleDestY = toggleLateY;

// Toggle Switch Label Variables are initialised
final int toggleDestLabelX = toggleDestX + 200;
final int toggleDestLabelY = toggleLateLabelY;
final int toggleDestLabelWidth = 300;

// Calendar Variables are initialised
final int dateWidth = 40;
final int dateGap = 10;
final int dateBox = dateWidth + dateGap;
final int calendarBorder = 30;
final int calendarWidth = dateBox*7 + 2*calendarBorder;
final int calendarHeight = dateBox*9 + 2*calendarBorder;
final int calendarX = SCREENX - calendarWidth - borderScreen - 330;
final int calendarY = firstRowY;

// Date Selector Variables are initialised
final int selectDateWidth = calendarWidth;
final int selectDateX = calendarX;
final int selectDateY = calendarY - rowHeight - rowGap;

// Airport Window Variables are initialised
final int stateWidth = 160;
final int stateHeight = 34;
final int stateGap = 4;
final int stateBoxWidth = stateWidth + stateGap;
final int stateBoxHeight = stateHeight + stateGap;
final int airportWidth = 200;
final int airportBoxWidth = airportWidth + stateGap;
final int airportWindowBorder = 30;
final int airportWindowWidth = stateBoxWidth*5 + airportBoxWidth*2 + 2*airportWindowBorder;
final int airportWindowHeight = stateBoxHeight*16 + 2*airportWindowBorder;
final int airportWindowX = borderScreen;
final int airportWindowY = secondRowY;

// Airport Selector Variables are initialised
final int selectAirportWidth = airportWindowWidth;
final int selectAirportX = airportWindowX;
final int selectAirportY = airportWindowY - rowHeight - rowGap;

// Search Variables are initialised
final int selectSearchWidth = 300;
final int selectSearchX = SCREENX - selectSearchWidth - borderScreen;
final int selectSearchY = secondRowY - rowHeight - rowGap;

// Image Variable is initialised
final int stockPhotoWidth = 1800;

// Tables are created for Data Analysis
DataTable fullData;
Table allAirports;

// Indices of the All Airports CSV file
final int codeIndex = 0;
final int stateIndex = 1;
final int stateNameIndex = 2;
final int cityIndex = 3;

// ArrayLists for all the Empty and Non-empty Widgets
ArrayList homeWidgetList = new ArrayList();
ArrayList homeEmptyWidgetList = new ArrayList();
ArrayList calendarWidgetList = new ArrayList();
ArrayList calendarEmptyWidgetList = new ArrayList();
ArrayList airportWidgetList = new ArrayList();
ArrayList airportEmptyWidgetList = new ArrayList();
ArrayList dataWidgetList = new ArrayList();
ArrayList dataEmptyWidgetList = new ArrayList();
ArrayList map3dList = new ArrayList();
ArrayList heatMapList = new ArrayList();
ArrayList histogramList = new ArrayList();
ArrayList barChartList = new ArrayList();
ArrayList pieChartList = new ArrayList();

// ArrayList for all the Images
ArrayList homeImageList = new ArrayList();
ArrayList dataImageList = new ArrayList();

// ArrayList for all the Screens
ArrayList screenList = new ArrayList();

// Arrays of the allAirports data
String[] airportCodes;
String[] airportStates;
String[] airportStateNames;
String[] airportCities;

// Important Global Variables
int typeCursor = ARROW;
int currentScreen = HOME_SCREEN;
int nextScreen = -1;
String stateLabel = "State / Territory";
String airportLabel = "Airport";
String selectedStateAirport = stateLabel + " ,  " + airportLabel;
String startLabel = "Start";
String endLabel = "End";
String selectedDateRange = startLabel + "  -  " + endLabel;

// Map Variables are initialised
ArrayList <StateShape> states = new ArrayList <StateShape>();
ArrayList <StateShapeForCubes> stateCubes = new ArrayList <StateShapeForCubes>();
float xoffset = -6.5;
float yoffset = -4;
float angleX, angleY, initialAngleX = 0, initialAngleY = 0, lastMouseX, lastMouseY;
boolean dragging = false;
final float MAX_ANGLE = PI;
FlightsPerState flights;
String[] lines;
HeatMap heatmap;
float maxFlights;
float stateShapeZ;
String stateSelectedMap = "";

// Interesting Facts Variables are initialised
float factNo = random(0, 6);
float nextFact;
String fact;
int timer = 500;
PFont factFont;

// Variables used for Data Analysis
boolean lateness = false;
boolean destAirport = true;
int startDate = 0;
int endDate = 0;
String airportState = null;
String airportCode = null;


// Setup Method for Entire Project
void setup() {
  // Background and TDext Size initialised
  size(1800, 1100, P3D);
  textSize(20);

  // Images and Fonts are initialised
  PImage logo27Airways = loadImage("27 Airways Logo.png");
  PImage experience27Airways = loadImage("27 Airways Experience.jpg");
  PImage calendarIcon = loadImage("Calendar Icon.png");
  PImage airportIcon = loadImage("Airport Icon.png");
  PImage USAflag = loadImage("USA Flag.png");
  PImage Irelandflag = loadImage("Ireland Flag.png");
  PImage doubleArrow = loadImage("Double Arrow.png");
  PImage plane27Airways = loadImage("27 Airways Plane.jpg");
  PFont airlineFont = loadFont("TrebuchetMS-Bold-48.vlw");
  PFont selectorFont = loadFont("Calibri-Bold-40.vlw");
  PFont headerFont = loadFont("Calibri-Bold-25.vlw");
  PFont regularFont = loadFont("Calibri-20.vlw");
  PFont boldRegularFont = loadFont("Calibri-Bold-20.vlw");
  factFont = selectorFont;

  // Tables are assigned to the Data
  fullData = new DataTable("flights_full.csv");
  allAirports = loadTable("All Airports.csv", "header");

  // Check if CSV file for all Airports is created
  if (allAirports == null) {
    AirportCSV(fullData.data);
    allAirports = loadTable("All Airports.csv", "header");
  }

  // allAirports CSV file data is loaded in
  airportCodes = allAirports.getStringColumn("Code");
  airportStates = allAirports.getStringColumn("State");
  airportStateNames = allAirports.getStringColumn("State Name");
  airportCities = allAirports.getStringColumn("City");

  // Methods are called
  ImageCreation(logo27Airways, experience27Airways, calendarIcon, airportIcon, USAflag, Irelandflag, doubleArrow, plane27Airways);
  WidgetCreation(airlineFont, selectorFont, headerFont, regularFont, boldRegularFont);

  // ScreenList is filled
  Screen homeScreen = new Screen(HOME_SCREEN, WHITE, homeWidgetList, homeImageList, homeEmptyWidgetList);
  Screen calendarScreen = new Screen(CALENDAR_SCREEN, WHITE, calendarWidgetList, null, calendarEmptyWidgetList);
  Screen airportScreen = new Screen(AIRPORT_SCREEN, WHITE, airportWidgetList, null, airportEmptyWidgetList);
  Screen dataScreen = new Screen(DATA_SCREEN, WHITE, dataWidgetList, dataImageList, dataEmptyWidgetList);
  Screen map3dScreen = new Screen(MAP3D_SCREEN, WHITE, map3dList, null, null);
  Screen heatMapScreen = new Screen(HEATMAP_SCREEN, WHITE, heatMapList, null, null);
  Screen histogramScreen = new Screen(HISTOGRAM_SCREEN, WHITE, histogramList, null, null);
  Screen barScreen = new Screen(BAR_SCREEN, WHITE, barChartList, null, null);
  Screen pieScreen = new Screen(PIE_SCREEN, WHITE, pieChartList, null, null);

  screenList.add(homeScreen);
  screenList.add(calendarScreen);
  screenList.add(airportScreen);
  screenList.add(dataScreen);
  screenList.add(map3dScreen);
  screenList.add(heatMapScreen);
  screenList.add(histogramScreen);
  screenList.add(barScreen);
  screenList.add(pieScreen);
}
