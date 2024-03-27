// Data Analysis Tools imported
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

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

// Button Press Positions and Screen Indices
final boolean BUTTON_PRESSED = true;
final boolean BUTTON_NOT_PRESSED = false;
final int HOME_SCREEN = 0;
final int CALENDAR_SCREEN = 1;
final int AIRPORT_SCREEN = 2;
final int DATA_SCREEN = 3;

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

// Toggle Variables are initialised
final int toggleCircleWidth = 40;
final int toggleCircleGap = 8;
final int toggleX = borderScreen + toggleCircleWidth/2 + rowGap;
final int toggleY = firstRowY - (rowHeight/2) - rowGap;

// Toggle Label Variables are initialised
final int toggleLabelX = borderScreen + (toggleCircleWidth+toggleCircleGap)*2 + rowGap;
final int toggleLabelY = firstRowY - rowHeight - rowGap;
final int toggleLabelWidth = 200;

// Calendar Variables are initialised
final int dateWidth = 40;
final int dateGap = 10;
final int dateBox = dateWidth + dateGap;
final int calendarBorder = 30;
final int calendarWidth = dateBox*7 + 2*calendarBorder;
final int calendarHeight = dateBox*9 + 2*calendarBorder;
final int calendarX = toggleLabelX + toggleLabelWidth + 150;
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
Table table;
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
String stateLabel = "State / Territory";
String airportLabel = "Airport";
String selectedStateAirport = stateLabel + " ,  " + airportLabel;
String startLabel = "Start";
String endLabel = "End";
String selectedDateRange = startLabel + "  -  " + endLabel;
boolean mousePressed;

// Variables used for Data Analysis
boolean lateness = false;
int startDate = 0;
int endDate = 0;
String airportState = null;
String airportCode = null;

// Mouse Pressed method
void mousePressed() {
  mousePressed = true;
}
