// Kevin Liu
// Class for creating the Histogram
class Histogram {
  HashMap<String, Integer> cityCountMap = new HashMap<String, Integer>();
  String[] cities;
  int[] flights;
  int hoverIndex = -1;
  color[] barColors;
  float topMargin = 400;
  float bottomMargin = 50;
  float leftMargin = 110;
  float rightMargin = 50;
  float availableWidth = width - leftMargin - rightMargin;

  // Constructor for Histogram
  Histogram(HashMap<String, Integer> cityCountMap, String[] cities, int[] flights) {
    this.cityCountMap = cityCountMap;
    this.cities = cities;
    this.flights = flights;
    // Calculate bar colors
    barColors = new color[cities.length];
    for (int i = 0; i < cities.length; i++) {
      if (i < cities.length / 2) {
        float blueAmount = map(i, 0, cities.length / 2, 0, 1);
        barColors[i] = lerpColor(color(173, 216, 230), color(25, 25, 112), blueAmount);
      } else {
        float redAmount = map(i, cities.length / 2, cities.length - 1, 0, 1);
        barColors[i] = lerpColor(color(139, 0, 0), color(255, 192, 203), redAmount);
      }
    }
  }
  // Histogram is drawn
  void draw() {
    // Title is drawn
    textSize(30);
    textAlign(CENTER, CENTER);
    fill(BLACK);
    text("Frequency of "+(lateness?"Delayed ":"On Time ")+"Flights " + (destAirport ? "to ":"from ") + stateLabel + ": ( 01/" + ((startDate < 10) ? "0"+startDate : startDate) + "/2022 - 01/" + ((endDate < 10) ? "0"+endDate : endDate) + "/2022 )", width/2, topMargin - 95);

    // x-axis
    stroke(0);
    line(leftMargin, height - bottomMargin, width - rightMargin, height - bottomMargin);
    // y-axis
    line(leftMargin, topMargin - 20, leftMargin, height - bottomMargin);

    // x label
    if (cities.length < 50) {
      textAlign(LEFT, CENTER);
      text("Airport", 15, height - bottomMargin / 2);
    } else {
      textAlign(CENTER, CENTER);
      text("Airport", width/2, height - bottomMargin / 2);
    }
    // y label
    pushMatrix();
    translate(leftMargin / 2 - 20, 700);
    rotate(-PI / 2);
    text("Number of Flights", 0, 0);
    popMatrix();

    // y
    float maxFlights = max(flights);
    float tickInterval = maxFlights / 5;
    for (int i = 0; i <= 5; i++) { // labels on y
      float y = map(i * tickInterval, 0, maxFlights, height - bottomMargin, topMargin);
      line(leftMargin - 5, y, leftMargin, y); //tick mark
      textAlign(RIGHT, CENTER);
      textSize(12);
      text(floor(i * tickInterval), leftMargin - 10, y);
    }

    // colors
    float barWidth = availableWidth / cities.length;
    for (int i = 0; i < cities.length; i++) {
      float x = leftMargin + i * barWidth;
      float y = map(flights[i], 0, maxFlights, height - bottomMargin, topMargin);
      float barHeight = height - bottomMargin - y;

      stroke(BLACK);
      strokeWeight(1);
      fill(barColors[i]); // Set fill color to match the bar color
      rect(x, y, barWidth, barHeight);

      // Draw state names
      textAlign(CENTER, TOP);
      textSize(20);
      if (cities.length < 50) {
        text(cities[i], x + barWidth /2, height - 40);
      }

      // Draw flight numbers
      textAlign(CENTER, BOTTOM);
      if (cities.length < 50) {
        textSize(20);
      } else {
        textSize(10);
      }
      text(flights[i], x + barWidth / 2, y - 5);
    }

    // small box beside the right side of the homepage picture
    if (hoverIndex != -1) {
      float tooltipWidth = 210;
      float tooltipHeight = 100;
      float tooltipX = 1400;
      float tooltipY = 250;

      // Hover box is created and displayed
      fill(BLUE_BLACK);
      rect(tooltipX, tooltipY, tooltipWidth, tooltipHeight, corner);

      fill(WHITE);
      textSize(30);
      textAlign(LEFT);
      text("Airport: " + cities[hoverIndex], tooltipX + 20, tooltipY + 40);
      text("Flights: " + flights[hoverIndex], tooltipX + 20, tooltipY + 80);
    }
  }

  void mouseMoved() {
    float infoLineY = topMargin - 50;

    if (mouseY >= infoLineY) {
      float barWidth = (float) availableWidth / cities.length; // Considering both left and right margins
      hoverIndex = -1; // Reset hover index

      for (int i = 0; i < cities.length; i++) {
        float x = (float) leftMargin + i * barWidth;
        if (mouseX >= x && mouseX < x + barWidth) {
          hoverIndex = i;
          break; // Stop looping once a bar is hovered over
        }
      }
    }
  }
}
