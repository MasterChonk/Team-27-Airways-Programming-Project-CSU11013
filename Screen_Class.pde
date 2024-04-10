// Jakub Kieblesz
// Class for displaying each individual screen with its associated features/widgets
class Screen {
  int typeScreen;
  color backgroundColor;
  ArrayList widgetList, imageList, emptyWidgetList;

  // Constructor for Screen Class
  Screen(int typeScreen, color backgroundColor, ArrayList widgetList, ArrayList imageList, ArrayList emptyWidgetList) {
    this.typeScreen = typeScreen;
    this.backgroundColor = backgroundColor;
    this.widgetList = widgetList;
    this.imageList = imageList;
    this.emptyWidgetList = emptyWidgetList;
  }

  // Draw Method for Screens
  void draw() {
    if (currentScreen == HOME_SCREEN || currentScreen == DATA_SCREEN) {
      windowResize(SCREENX, SCREENY);
      background(backgroundColor);
      if (nextScreen == HOME_SCREEN) currentScreen = HOME_SCREEN;
      else if (nextScreen == CALENDAR_SCREEN) currentScreen = CALENDAR_SCREEN;
      else if (nextScreen == AIRPORT_SCREEN) currentScreen = AIRPORT_SCREEN;
      else if (nextScreen == DATA_SCREEN) currentScreen = DATA_SCREEN;
      else if (nextScreen == MAP3D_SCREEN) currentScreen = MAP3D_SCREEN;
      else if (nextScreen == HEATMAP_SCREEN) currentScreen = HEATMAP_SCREEN;
      else if (nextScreen == HISTOGRAM_SCREEN) currentScreen = HISTOGRAM_SCREEN;
      else if (nextScreen == BAR_SCREEN) currentScreen = BAR_SCREEN;
      else if (nextScreen == PIE_SCREEN) currentScreen = PIE_SCREEN;
      nextScreen = -1;
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
      for (int i = 0; i < widgetList.size(); i++) {
        if (i < 2) {
          ToggleWidget theToggleWidget = (ToggleWidget) widgetList.get(i);
          theToggleWidget.mouseMoved();
          theToggleWidget.draw();
        } else {
          Widget theWidget = (Widget) widgetList.get(i);
          theWidget.mouseMoved();
          theWidget.draw();
        }
      }
    } else if (typeScreen == CALENDAR_SCREEN) {
      for (int i = 0; i < widgetList.size(); i++) {
        if (i < 2) {
          Widget theWidget = (Widget) widgetList.get(i);
          theWidget.mouseMoved();
          theWidget.draw();
        } else {
          CalendarWidget theCalendarWidget = (CalendarWidget) widgetList.get(i);
          theCalendarWidget.mouseMoved();
          theCalendarWidget.draw();
        }
      }
    } else if (typeScreen == AIRPORT_SCREEN) {
      for (int i = 0; i < widgetList.size(); i++) {
        if (i < 2) {
          Widget theWidget = (Widget) widgetList.get(i);
          theWidget.mouseMoved();
          theWidget.draw();
        } else {
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
    } else if (typeScreen == DATA_SCREEN) {
      for (int i = 0; i < widgetList.size(); i++) {
        Widget theWidget = (Widget) widgetList.get(i);
        theWidget.mouseMoved();
        theWidget.draw();
      }
    } else if (typeScreen == MAP3D_SCREEN) {
      // Title is drawn
      textSize(30);
      textAlign(CENTER, CENTER);
      fill(WHITE);
      text("Frequency of "+(lateness?"Delayed ":"On Time ")+"Flights " + (destAirport ? "to ":"from ") + stateLabel + ": ( 01/" + ((startDate < 10) ? "0"+startDate : startDate) + "/2022 - 01/" + ((endDate < 10) ? "0"+endDate : endDate) + "/2022 )", width/2, 150);
      Map3d map3d = (Map3d) widgetList.get(0);
      DrawMaps();
      map3d.draw();
    } else if (typeScreen == HEATMAP_SCREEN) {
      // Title is drawn
      textSize(30);
      textAlign(CENTER, CENTER);
      fill(WHITE);
      text("Number of "+(lateness?"Delayed ":"On Time ")+"Flights " + (destAirport ? "to ":"from ") + stateLabel + ": ( 01/" + ((startDate < 10) ? "0"+startDate : startDate) + "/2022 - 01/" + ((endDate < 10) ? "0"+endDate : endDate) + "/2022 )", width/2 - 200, 150);      
      textAlign(LEFT, CENTER);
      text(stateSelectedMap, width - 450, 150);
      stateSelectedMap = "";
      HeatMap heatMap = (HeatMap) widgetList.get(0);
      DrawMaps();
      heatMap.draw();
    } else if (typeScreen == HISTOGRAM_SCREEN) {
      Histogram histogram = (Histogram) widgetList.get(0);
      histogram.mouseMoved();
      histogram.draw();
    } else if (typeScreen == BAR_SCREEN) {
      BarChart barChart = (BarChart) widgetList.get(0);
      barChart.draw();
    } else if (typeScreen == PIE_SCREEN) {
      PieChart pieChart = (PieChart) widgetList.get(0);
      pieChart.draw();
    }
    if (imageList != null) {
      int listLength = imageList.size();
      boolean factsDraw = true;
      if (currentScreen == MAP3D_SCREEN || currentScreen == HEATMAP_SCREEN || currentScreen == HISTOGRAM_SCREEN || currentScreen == BAR_SCREEN || currentScreen == PIE_SCREEN) {
        listLength--;
        factsDraw = false;
      }
      for (int i = 0; i < listLength; i++) {
        Image theImage = (Image) imageList.get(i);
        theImage.draw();
      }
      if (factsDraw == true && currentScreen == DATA_SCREEN) {
        Facts();
      }
    }
  }
}
