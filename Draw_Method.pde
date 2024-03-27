void draw() {
  // Initialised Screens
  Screen theScreen = (Screen) screenList.get(currentScreen);
  if (currentScreen == CALENDAR_SCREEN || currentScreen == AIRPORT_SCREEN) {
    Screen theScreen2 = (Screen) screenList.get(HOME_SCREEN);
    theScreen2.draw();
  }
  theScreen.draw();
  // Mouse press registered
  if (mousePressed) {
    boolean event;
    boolean eventToggle;
    ArrayList currentWidgetList = theScreen.widgetList;
    ArrayList currentEmptyWidgetList = theScreen.emptyWidgetList;
    
    
    // Calendar Screen
    if (currentScreen == CALENDAR_SCREEN) {
      EmptyWidget calendarBackground = (EmptyWidget) currentEmptyWidgetList.get(0);
      if ((mouseX < calendarBackground.x || mouseX > calendarBackground.x + calendarBackground.width) || 
          (mouseY < calendarBackground.y || mouseY > calendarBackground.y + calendarBackground.height)) {
        currentScreen = HOME_SCREEN;
      }
      // Clear Button 
      Widget clearButton = (Widget) currentWidgetList.get(0);
      event = clearButton.getEvent(mouseX, mouseY);
      if (event == BUTTON_PRESSED) {
        if (startDate != 0) {
          CalendarWidget calendarStartDate = (CalendarWidget) currentWidgetList.get(startDate + 1);
          calendarStartDate.startDate = false;
          startDate = 0;
        }
        if (endDate != 0) {
          CalendarWidget calendarEndDate = (CalendarWidget) currentWidgetList.get(endDate + 1);
          calendarEndDate.endDate = false;
          endDate = 0;
        }
      }  
      // Done Button
      Widget doneButton = (Widget) currentWidgetList.get(1);
      event = doneButton.getEvent(mouseX, mouseY);
      if (event == BUTTON_PRESSED) {
        currentScreen = doneButton.moveScreen;
      }
      // Choosing Start and End Date
      for (int i = 2; i < currentWidgetList.size(); i++) {
        CalendarWidget calendarDate = (CalendarWidget) currentWidgetList.get(i);
        event = calendarDate.getEvent(mouseX, mouseY);
        if (event == BUTTON_PRESSED) {
          if (startDate == 0 && endDate == 0) {
            calendarDate.startDate = true;
            startDate = calendarDate.dateNumber;
          }
          else if (startDate != 0 && endDate == 0) {
            if (calendarDate.dateNumber < startDate) {
              CalendarWidget previousStartDate = (CalendarWidget) currentWidgetList.get(startDate + 1);
              previousStartDate.endDate = true;
              previousStartDate.startDate = false;
              endDate = startDate;
              calendarDate.startDate = true;
              startDate = calendarDate.dateNumber;
            }
            else {
              calendarDate.endDate = true;
              endDate = calendarDate.dateNumber;
            }
          }
          else if (startDate != 0 && endDate != 0) {
            CalendarWidget previousStartDate = (CalendarWidget) currentWidgetList.get(startDate + 1);
            CalendarWidget previousEndDate = (CalendarWidget) currentWidgetList.get(endDate + 1);
            previousStartDate.startDate = false;
            previousEndDate.endDate = false;
            startDate = calendarDate.dateNumber;
            endDate = 0;
            calendarDate.startDate = true;
            calendarDate.endDate = false;
          } 
        }
      }
      // Calendar Selection Between Chosen Dates
      if (startDate != 0 && endDate != 0) {
        int counter = 0;
        for (int i = 1; i < startDate; i++) {
          if (i % 7 == 2) {
            counter++;
          }
        }
        for (int i = startDate; i < endDate; i++) {
          if (i % 7 == 2) {
            EmptyWidget firstHalf = (EmptyWidget) currentEmptyWidgetList.get(i + 8 + counter);
            EmptyWidget secondHalf = (EmptyWidget) currentEmptyWidgetList.get(i + 9 + counter);
            firstHalf.transparent = false;
            secondHalf.transparent = false;            
            counter++;
          }
          else {
            EmptyWidget dateIncluded = (EmptyWidget) currentEmptyWidgetList.get(i + 8 + counter);
            dateIncluded.transparent = false;
          }          
        }
      }
      // Cancelling Calendar Selection Between Chosen Dates
      if (endDate == 0 || endDate == startDate) {
        for (int i = 1; i < 36; i++) {
          EmptyWidget dateIncluded = (EmptyWidget) currentEmptyWidgetList.get(i+8);   
          dateIncluded.transparent = true;
        }
      }
      // Changing Start and End Date Selector
      startLabel = (startDate != 0) ? "Jan " + String.valueOf(startDate) : "Start";
      endLabel = (endDate != 0) ? "Jan " + String.valueOf(endDate) : "End";
      Screen theScreen2 = (Screen) screenList.get(HOME_SCREEN);
      Widget theWidget = (Widget) theScreen2.widgetList.get(1);
      selectedDateRange = startLabel + "  -  " + endLabel;      
      theWidget.label = selectedDateRange; 
    }
    
    
    // Airport Screen
    else if (currentScreen == AIRPORT_SCREEN) {
      EmptyWidget airportBackground = (EmptyWidget) currentEmptyWidgetList.get(0);
      if ((mouseX < airportBackground.x || mouseX > airportBackground.x + airportBackground.width) || 
          (mouseY < airportBackground.y || mouseY > airportBackground.y + airportBackground.height)) {
        currentScreen = HOME_SCREEN;
      }
      // Clear Button 
      Widget clearButton = (Widget) currentWidgetList.get(0);
      event = clearButton.getEvent(mouseX, mouseY);
      if (event == BUTTON_PRESSED) {
        if (airportState != null) {
          AirportWidget chosenState = (AirportWidget) currentWidgetList.get(Arrays.asList(americanStateNames).indexOf(stateLabel) + 2);
          chosenState.isAirportState = false;
          airportState = null;
          if (airportCode != null) {
            for (int i = 0; i < chosenState.airportList.size(); i++) {
              AirportWidget chosenAirport = (AirportWidget) chosenState.airportList.get(i);
              if (chosenAirport.isAirportCode == true) {
                chosenAirport.isAirportCode = false;
                airportCode = null;
              }
            }     
          }  
        }
      }  
      // Done Button
      Widget doneButton = (Widget) currentWidgetList.get(1);
      event = doneButton.getEvent(mouseX, mouseY);
      if (event == BUTTON_PRESSED) {
        currentScreen = doneButton.moveScreen;
      }
      // Choosing State and Airport
      for (int i = 2; i < currentWidgetList.size(); i++) {
        AirportWidget chosenState = (AirportWidget) currentWidgetList.get(i);
        event = chosenState.getEvent(mouseX, mouseY);
        if (event == BUTTON_PRESSED) {
          if (airportState != null) {   
            AirportWidget previousChosenState = (AirportWidget) currentWidgetList.get(Arrays.asList(americanStateNames).indexOf(stateLabel) + 2);
            previousChosenState.isAirportState = false;
            if (airportCode != null) {
              for (int j = 0; j < previousChosenState.airportList.size(); j++) {
                AirportWidget previousChosenAirport = (AirportWidget) previousChosenState.airportList.get(j);
                if (previousChosenAirport.isAirportCode == true) {
                  previousChosenAirport.isAirportCode = false;
                  airportCode = null;
                  break;
                }
              }  
            }  
          }
          chosenState.isAirportState = true;
          stateLabel = chosenState.label;
          airportState = chosenState.CSVstring;
        }
        else if (airportState != null) {
          boolean eventAirport;
          AirportWidget previousChosenState = (AirportWidget) currentWidgetList.get(Arrays.asList(americanStateNames).indexOf(stateLabel) + 2);          
          for (int j = 0; j < previousChosenState.airportList.size(); j++) {
            AirportWidget chosenAirport = (AirportWidget) previousChosenState.airportList.get(j);
            eventAirport = chosenAirport.getEvent(mouseX, mouseY);
            if (eventAirport == BUTTON_PRESSED) {
              if (airportCode != null) {
                for (int k = 0; k < previousChosenState.airportList.size(); k++) {
                  AirportWidget previousChosenAirport = (AirportWidget) previousChosenState.airportList.get(k);
                  if (previousChosenAirport.isAirportCode == true) {
                    previousChosenAirport.isAirportCode = false;
                    break;
                  }
                }  
              }   
              chosenAirport.isAirportCode = true;
              airportLabel = chosenAirport.label;
              airportCode = chosenAirport.CSVstring;
            }
          }
        }
      }
      // Changing State and Airport Selector
      stateLabel = (airportState != null) ? stateLabel : "State / Territory";
      airportLabel = (airportCode != null) ? airportLabel : "Airport";
      Screen theScreen2 = (Screen) screenList.get(HOME_SCREEN);
      Widget theWidget = (Widget) theScreen2.widgetList.get(2);
      selectedStateAirport = stateLabel + " ,  " + airportLabel;      
      theWidget.label = selectedStateAirport; 
    }
    
    
    // Data Screen
    else if (currentScreen == DATA_SCREEN) {
      Widget theWidget = (Widget) currentWidgetList.get(0);
      event = theWidget.getEvent(mouseX, mouseY);
      if (event == BUTTON_PRESSED) {
        currentScreen = theWidget.moveScreen;
      }
    }
    
    
    // Home Screen
    else if (currentScreen == HOME_SCREEN) {
      ToggleWidget theToggleWidget = (ToggleWidget) currentWidgetList.get(0);
      eventToggle = theToggleWidget.getEvent(mouseX, mouseY);
      if (eventToggle == BUTTON_PRESSED) {
        if (theToggleWidget.selected == false) {
          theToggleWidget.selected = true;
          theToggleWidget.x += theToggleWidget.width;
          lateness = true;
        }
        else {
          theToggleWidget.selected = false;
          theToggleWidget.x -= theToggleWidget.width;
          lateness = false;
        }
      }
      for (int i = 1; i < currentWidgetList.size(); i++) {
        Widget theWidget = (Widget) currentWidgetList.get(i);
        event = theWidget.getEvent(mouseX, mouseY);
        if (event == BUTTON_PRESSED) {
          currentScreen = theWidget.moveScreen;
        }
      }
    }
    mousePressed = false;
  }
  cursor(typeCursor);
  typeCursor = ARROW;
}
