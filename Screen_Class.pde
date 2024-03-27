class Screen {
  int typeScreen;
  color backgroundColor;
  ArrayList widgetList, imageList, emptyWidgetList;
  
  
  Screen(int typeScreen, color backgroundColor, ArrayList widgetList, ArrayList imageList, ArrayList emptyWidgetList) {
    this.typeScreen = typeScreen;
    this.backgroundColor = backgroundColor;
    this.widgetList = widgetList; this.imageList = imageList; this.emptyWidgetList = emptyWidgetList;
  }
  
  void draw() {
    if (currentScreen != CALENDAR_SCREEN && currentScreen != AIRPORT_SCREEN) {
      windowResize(SCREENX, SCREENY);
      background(backgroundColor);
    }
    if (emptyWidgetList != null) {
      int listLength = emptyWidgetList.size();
      if (typeScreen == AIRPORT_SCREEN) {
        if (airportState != null) {
          listLength--;
        }
      }
      for (int i = 0; i < listLength; i++) {
        EmptyWidget theEmptyWidget = (EmptyWidget) emptyWidgetList.get(i);
        theEmptyWidget.draw();
      }
    }
    if (typeScreen == HOME_SCREEN) {
      ToggleWidget theToggleWidget = (ToggleWidget) widgetList.get(0);
      theToggleWidget.draw();
      for (int i = 1; i < widgetList.size(); i++) {
        Widget theWidget = (Widget) widgetList.get(i);
        theWidget.mouseMoved();
        theWidget.draw();
      }
    }
    else if (typeScreen == CALENDAR_SCREEN) { 
      for (int i = 0; i < widgetList.size(); i++) {
        if (i < 2) {
          Widget theWidget = (Widget) widgetList.get(i);
          theWidget.mouseMoved();
          theWidget.draw();
        }
        else {
          CalendarWidget theCalendarWidget = (CalendarWidget) widgetList.get(i);
          theCalendarWidget.mouseMoved();
          theCalendarWidget.draw();  
        }  
      }
    }
    else if (typeScreen == AIRPORT_SCREEN) {
      for (int i = 0; i < widgetList.size(); i++) {
        if (i < 2) {
          Widget theWidget = (Widget) widgetList.get(i);
          theWidget.mouseMoved();
          theWidget.draw();
        }
        else {
          AirportWidget stateWidget = (AirportWidget) widgetList.get(i);
          stateWidget.mouseMoved();
          stateWidget.draw();
          if (stateWidget.isAirportState == true) {
            for (int j = 0; j < stateWidget.airportList.size(); j++) {
              AirportWidget stateAirportWidget = (AirportWidget) stateWidget.airportList.get(j);
              stateAirportWidget.mouseMoved();
              stateAirportWidget.draw();              
            }
          } 
        }  
      }
    }
    else if (typeScreen == DATA_SCREEN) {
      for (int i = 0; i < widgetList.size(); i++) {
        Widget theWidget = (Widget) widgetList.get(i);
        theWidget.mouseMoved();
        theWidget.draw();
      }
    }
    if (imageList != null) {
      for (int i = 0; i < imageList.size(); i++) {
        Image theImage = (Image) imageList.get(i);
        theImage.draw();
      }
    }
  }
}
