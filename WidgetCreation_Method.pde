// Jakub Kieblesz
// Method for creating all widgets, empty widgets and toggle widgets and adding them to each screen
void WidgetCreation(PFont airlineFont, PFont selectorFont, PFont headerFont, PFont regularFont, PFont boldRegularFont) {   
  // Home Screen Widgets
  ToggleWidget latenessToggle = new ToggleWidget(toggleLateX, toggleLateY, toggleCircleWidth, toggleCircleGap, null, WHITE, GREY, ORANGE, BLACK, false, false, null);
  ToggleWidget toFromToggle = new ToggleWidget(toggleDestX, toggleDestY, toggleCircleWidth, toggleCircleGap, "Destination,Origin", WHITE, GREY, ORANGE, BLACK, false, true, boldRegularFont);
  Widget dateSelector = new Widget(selectDateX, selectDateY, selectDateWidth, rowHeight, corner, LEFT, CALENDAR_SCREEN, selectedDateRange, 
    BLUE_BLACK, LIGHT_BLACK, WHITE, selectorFont);
  Widget airportSelector = new Widget(selectAirportX, selectAirportY, selectAirportWidth, rowHeight, corner, LEFT, AIRPORT_SCREEN, selectedStateAirport,
    BLUE_BLACK, LIGHT_BLACK, WHITE, selectorFont);
  Widget search = new Widget(selectSearchX, selectSearchY, selectSearchWidth, rowHeight, corner, CENTER, DATA_SCREEN, "Search", ORANGE, DARK_ORANGE, WHITE, selectorFont);

  homeWidgetList.add(latenessToggle);
  homeWidgetList.add(toFromToggle);
  homeWidgetList.add(dateSelector);
  homeWidgetList.add(airportSelector);  
  homeWidgetList.add(search);
  
  // Home Screen Empty Widgets
  EmptyWidget widgetBarHome = new EmptyWidget(0, 0, SCREENX, 400, noCorner, CENTER, null, BLUE_BLACK, WHITE, null, false);
  EmptyWidget logoName = new EmptyWidget(220, 30, 300, rowHeight, noCorner, CENTER, "A I R W A Y S", BLUE_BLACK, WHITE, airlineFont, true); 
  EmptyWidget latenessLabel = new EmptyWidget(toggleLateLabelX, toggleLateLabelY, toggleLateLabelWidth, rowHeight, corner, CENTER, "Lateness", BLUE_BLACK, WHITE, selectorFont, true);
  EmptyWidget airportTypeLabel = new EmptyWidget(toggleDestLabelX, toggleDestLabelY, toggleDestLabelWidth, rowHeight, corner, CENTER, "Airport", BLUE_BLACK, WHITE, selectorFont, true);
  homeEmptyWidgetList.add(widgetBarHome);
  homeEmptyWidgetList.add(logoName);
  homeEmptyWidgetList.add(latenessLabel);
  homeEmptyWidgetList.add(airportTypeLabel);
    
  // Airport Screen Widgets
  int airportButtonWidth = 100; int airportButtonHeight = stateHeight; int airportButtonGap = 20;  
  Widget clearAirport = new Widget(airportWindowX + airportWindowWidth - airportWindowBorder - 2*airportButtonWidth - airportButtonGap, airportWindowY + airportWindowHeight - airportWindowBorder - airportButtonHeight, 
    airportButtonWidth, airportButtonHeight, corner, CENTER, AIRPORT_SCREEN, "Clear", WHITE, LIGHT_ORANGE, BLACK, boldRegularFont);
  Widget doneAirport = new Widget(airportWindowX + airportWindowWidth - airportWindowBorder - airportButtonWidth, airportWindowY + airportWindowHeight - airportWindowBorder - airportButtonHeight, 
    airportButtonWidth, airportButtonHeight, corner, CENTER, HOME_SCREEN, "Done", ORANGE, BLUE_BLACK, WHITE, boldRegularFont);
  airportWidgetList.add(clearAirport);
  airportWidgetList.add(doneAirport);
  
  int stateHorizontalOffset = 0; int stateVerticalOffset = 0;
  for (int i = 0; i < americanStateNames.length; i++) {
    String currentState = americanStateNames[i];
    int index = Arrays.asList(airportStateNames).indexOf(currentState);
    ArrayList allStateAirports = new ArrayList();
    int cityHorizontalOffset = 0; int cityVerticalOffset = 0; int CSVindex = index;
    for (int j = 0; CSVindex < 369 && currentState.equals(airportStateNames[CSVindex]); j++) {
      AirportWidget airportName;
      if (j == 0) {
        cityHorizontalOffset = 0;
      }
      else {
        cityVerticalOffset = j % 14;
        cityHorizontalOffset = (cityVerticalOffset == 0) ? cityHorizontalOffset + 1: cityHorizontalOffset;
      }
      String airportLabel = airportCities[index + j] + " (" + airportCodes[index + j] + ")";
      airportName = new AirportWidget(airportWindowX + airportWindowBorder + stateBoxWidth*5 + airportBoxWidth*cityHorizontalOffset + stateGap/2, airportWindowY + airportWindowBorder + stateBoxHeight*(cityVerticalOffset + 1) + stateGap/2, 
        (int) textWidth(airportLabel) + 20, stateHeight, corner, airportCodes[index + j], airportLabel, LIGHT_ORANGE, ORANGE, BLACK, WHITE, regularFont, boldRegularFont, false, false, true, null);       
      allStateAirports.add(airportName);
      CSVindex++;
    }
    if (i == 0) {
      stateHorizontalOffset = 0;
    }
    else {
      stateVerticalOffset = i % 14;
      stateHorizontalOffset = (stateVerticalOffset == 0) ? stateHorizontalOffset + 1: stateHorizontalOffset;
    }
    if (i < americanStateNames.length - 3) {
      AirportWidget stateName = new AirportWidget(airportWindowX + airportWindowBorder + stateBoxWidth*(stateHorizontalOffset) + stateGap/2, airportWindowY + airportWindowBorder + stateBoxHeight*(stateVerticalOffset + 1), 
        (int) textWidth(americanStateNames[i]) + 20, stateHeight, corner, americanStateAbbr[i], americanStateNames[i], LIGHT_ORANGE, ORANGE, BLACK, WHITE, regularFont, boldRegularFont, false, false, true, allStateAirports); 
      airportWidgetList.add(stateName);
    }
    else {
      AirportWidget territoryName = new AirportWidget(airportWindowX + airportWindowBorder + stateBoxWidth*(stateHorizontalOffset + 1), airportWindowY + airportWindowBorder + stateBoxHeight*(stateVerticalOffset - 7), 
        (int) textWidth(americanStateNames[i]) + 20, stateHeight, corner, americanStateAbbr[i], americanStateNames[i], LIGHT_ORANGE, ORANGE, BLACK, WHITE, regularFont, boldRegularFont, false, false, true, allStateAirports); 
      airportWidgetList.add(territoryName);
    }
  }
  
  // Airport Screen Empty Widgets
  EmptyWidget stateBackground = new EmptyWidget(airportWindowX, airportWindowY, airportWindowWidth, airportWindowHeight, corner, CENTER, null, WHITE, WHITE, null, false);  
  EmptyWidget stateTitle = new EmptyWidget(airportWindowX + airportWindowBorder + stateGap/2, airportWindowY + airportWindowBorder + stateGap/2, stateWidth, stateHeight, noCorner, LEFT,
    "United States", WHITE, ORANGE, headerFont, true);
  EmptyWidget territoryTitle = new EmptyWidget(airportWindowX + airportWindowBorder + stateBoxWidth*4, airportWindowY + airportWindowBorder + stateGap/2, stateWidth, stateHeight, noCorner, LEFT,
    "US Territories", WHITE, ORANGE, headerFont, true);
  EmptyWidget airportsTitle = new EmptyWidget(airportWindowX + airportWindowBorder + stateBoxWidth*5, airportWindowY + airportWindowBorder + stateGap/2, stateWidth, stateHeight, noCorner, LEFT,
    "Airports", WHITE, ORANGE, headerFont, true);
  EmptyWidget stateNotPicked = new EmptyWidget(airportWindowX + airportWindowBorder + stateBoxWidth*5, airportWindowY + airportWindowBorder + stateBoxHeight, stateWidth, stateHeight, noCorner, LEFT,
    "Select a State / Territory", WHITE, GREY, regularFont, true);
  airportEmptyWidgetList.add(stateBackground);
  airportEmptyWidgetList.add(stateTitle);
  airportEmptyWidgetList.add(territoryTitle);
  airportEmptyWidgetList.add(airportsTitle);
  airportEmptyWidgetList.add(stateNotPicked);
  
  // Calendar Screen Widgets
  int calendarButtonWidth = 100; int calendarButtonHeight = dateWidth; int calendarButtonGap = 20;  
  Widget clearCalendar = new Widget(calendarX + calendarWidth - calendarBorder - 2*calendarButtonWidth - calendarButtonGap - dateGap/2, calendarY + calendarHeight - calendarBorder - calendarButtonHeight - dateGap/2, 
    calendarButtonWidth, calendarButtonHeight, corner, CENTER, CALENDAR_SCREEN, "Clear", WHITE, LIGHT_ORANGE, BLACK, boldRegularFont);
  Widget doneCalendar = new Widget(calendarX + calendarWidth - calendarBorder - calendarButtonWidth - dateGap/2, calendarY + calendarHeight - calendarBorder - calendarButtonHeight - dateGap/2, 
    calendarButtonWidth, calendarButtonHeight, corner, CENTER, HOME_SCREEN, "Done", ORANGE, BLUE_BLACK, WHITE, boldRegularFont);
  calendarWidgetList.add(clearCalendar);
  calendarWidgetList.add(doneCalendar);
  int horizontalOffset; int verticalOffset = 2; int dateNumber = 1; 
  for (int i = 5; i < 36; i++) {
    horizontalOffset = i % 7;
    verticalOffset = (horizontalOffset == 0) ? verticalOffset + 1 : verticalOffset;
    CalendarWidget date = new CalendarWidget(calendarX + dateBox*horizontalOffset + dateBox/2 + calendarBorder, calendarY + dateBox*verticalOffset + dateBox/2 + calendarBorder, dateWidth,  
      dateNumber, String.valueOf(dateNumber), LIGHT_ORANGE, ORANGE, BLACK, WHITE, regularFont, boldRegularFont, false, false, true);
    calendarWidgetList.add(date);
    dateNumber++;
  }
  
  // Calendar Screen Empty Widgets  
  EmptyWidget calendarBackground = new EmptyWidget(calendarX, calendarY, calendarWidth, calendarHeight, corner, CENTER, null, WHITE, WHITE, null, false);  
  EmptyWidget monthName = new EmptyWidget(calendarX + calendarBorder, calendarY + calendarBorder, dateBox*7, dateBox, noCorner, CENTER, "January 2022", WHITE, BLACK, headerFont, true);  
  calendarEmptyWidgetList.add(calendarBackground);
  calendarEmptyWidgetList.add(monthName);
  String[] days = {"Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"};
  for (int i = 0; i < 7; i++) {
    EmptyWidget dayName = new EmptyWidget(calendarX + calendarBorder + dateBox*i, calendarY + calendarBorder + dateBox, dateBox, dateBox, noCorner, CENTER, days[i], WHITE, GREY, regularFont, true);
    calendarEmptyWidgetList.add(dayName);
  }
  
  for (int i = 1; i < 31; i++) {
    CalendarWidget dateWidget = (CalendarWidget) calendarWidgetList.get(i+1);
    if (i % 7 == 2) {      
      EmptyWidget firstHalf = new EmptyWidget(dateWidget.x, dateWidget.y - dateWidth/2, dateWidth/2, dateWidth, noCorner, CENTER, null, PALE_ORANGE, WHITE, null, true);  
      CalendarWidget nextDateWidget = (CalendarWidget) calendarWidgetList.get(i+2);
      EmptyWidget secondHalf = new EmptyWidget(nextDateWidget.x - dateWidth/2, nextDateWidget.y - dateWidth/2, dateWidth/2, dateWidth, noCorner, CENTER, null, PALE_ORANGE, WHITE, null, true);
      calendarEmptyWidgetList.add(firstHalf);
      calendarEmptyWidgetList.add(secondHalf);
    }
    else {
      EmptyWidget dateIncluded = new EmptyWidget(dateWidget.x, dateWidget.y - dateWidth/2, dateBox, dateWidth, noCorner, CENTER, null, PALE_ORANGE, WHITE, null, true);
      calendarEmptyWidgetList.add(dateIncluded);
    }   
  }
  
  // Data Screen Widgets
  Widget returnHomeWidget = new Widget(30, 30, 200, rowHeight, noCorner, CENTER, HOME_SCREEN, null, BLUE_BLACK, BLUE_BLACK, WHITE, regularFont);
  Widget map3dWidget = new Widget(SCREENX - 5*dataButtonWidth - 4*dataButtonGap - dataButtonBorder, 30, dataButtonWidth, rowHeight, corner, CENTER, MAP3D_SCREEN, "3D Map", 
    ORANGE, DARK_ORANGE, WHITE, selectorFont);
  Widget heatMapWidget = new Widget(SCREENX - 4*dataButtonWidth - 3*dataButtonGap - dataButtonBorder, 30, dataButtonWidth, rowHeight, corner, CENTER, HEATMAP_SCREEN, "Heat Map", 
    ORANGE, DARK_ORANGE, WHITE, selectorFont);
  Widget histogramWidget = new Widget(SCREENX - 3*dataButtonWidth - 2*dataButtonGap - dataButtonBorder, 30, dataButtonWidth, rowHeight, corner, CENTER, HISTOGRAM_SCREEN, "Histogram", 
    ORANGE, DARK_ORANGE, WHITE, selectorFont);
  Widget barChartWidget = new Widget(SCREENX - 2*dataButtonWidth - dataButtonGap - dataButtonBorder, 30, dataButtonWidth, rowHeight, corner, CENTER, BAR_SCREEN, "Bar Chart", 
    ORANGE, DARK_ORANGE, WHITE, selectorFont);
  Widget pieChartWidget = new Widget(SCREENX - dataButtonWidth - dataButtonBorder, 30, dataButtonWidth, rowHeight, corner, CENTER, PIE_SCREEN, "Pie Chart", 
    ORANGE, DARK_ORANGE, WHITE, selectorFont);
  
  dataWidgetList.add(returnHomeWidget);
  dataWidgetList.add(map3dWidget);
  dataWidgetList.add(heatMapWidget);
  dataWidgetList.add(histogramWidget);
  dataWidgetList.add(barChartWidget);
  dataWidgetList.add(pieChartWidget);
  
  // Data Screen Empty Widgets
  EmptyWidget widgetBarData = new EmptyWidget(0, 0, SCREENX, 200, noCorner, CENTER, null, BLUE_BLACK, WHITE, null, false);
  dataEmptyWidgetList.add(widgetBarData);
  dataEmptyWidgetList.add(logoName);
}
