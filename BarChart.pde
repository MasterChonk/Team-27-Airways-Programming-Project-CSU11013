// Bhudhav Singh
// Class for creating Bar Chart
class BarChart {
  Table table;
  HashMap<String, Integer> cityCountMap = new HashMap<String, Integer>();
  HashMap<String, Integer> cityDistanceMap = new HashMap<String, Integer>();
  ArrayList<String> cities;
  ArrayList<Integer> distances;
  int hoverIndex = -1;
  int topMargin = 400;
  int bottomMargin = 50;
  int leftMargin = 110;
  int rightMargin = 50;
  int availableWidth = width - leftMargin - rightMargin;

  // Constructor for Bar Chart
  BarChart(ArrayList<String> cities, ArrayList<Integer> distances) {
    this.cities = cities;
    this.distances = distances;
    for (int i = 0; i < cities.size(); i++) {
      String city = cities.get(i);
      int distance = distances.get(i);

      if (cityCountMap.containsKey(city)) {
        int count = cityCountMap.get(city);
        cityCountMap.put(city, count + 1);
      } else {
        cityCountMap.put(city, 1);
      }

      if (cityDistanceMap.containsKey(city)) {
        int totalDistance = cityDistanceMap.get(city);
        cityDistanceMap.put(city, totalDistance + distance);
      } else {
        cityDistanceMap.put(city, distance);
      }
    }
  }
  // Bar Chart is drawn
  void draw() {
    // First the Title is drawn
    textSize(30);
    textAlign(CENTER, CENTER);
    fill(BLACK);
    text("Total Distance Travelled " + (destAirport ? "to " : "from ") + stateLabel + ": ( 01/" + ((startDate < 10) ? "0"+startDate : startDate) + "/2022 - 01/" + ((endDate < 10) ? "0"+endDate : endDate) + "/2022 )", width/2 + 30, 240);

    // Draw Bars
    int barWidth = (width - 160) / cities.size();
    int maxDistance = Integer.MIN_VALUE;
    for (Integer distance : distances) {
      if (distance > maxDistance) {
        maxDistance = distance;
      }
    }
    for (int i = 0; i < cities.size(); i++) {
      float x = leftMargin + 3 + i * barWidth;
      float y = map(distances.get(i), 0, maxDistance, height - bottomMargin, topMargin);
      float barHeight = height - bottomMargin - y + 2;

      stroke(WHITE);
      strokeWeight(4);
      fill(ORANGE);
      rect(x, y, barWidth, barHeight);
      textAlign(CENTER, CENTER);
      fill(BLACK);
      textSize(12);
      if (cities.size() <= 20) {
        text(distances.get(i), x + barWidth / 2, y - 10);
      } else {
        float barNumber = (float) Math.round(distances.get(i)/100000)/10;
        String barNumberString = String.valueOf(barNumber);
        barNumberString.substring(0, 2);
        text(barNumberString + "M", x + barWidth / 2, y - 10);
      }
    }

    textSize(30);
    // x-axis
    stroke(0);
    strokeWeight(1);
    line(leftMargin, height - bottomMargin, width - rightMargin, height - bottomMargin);
    // y-axis
    line(leftMargin, topMargin - 20, leftMargin, height - bottomMargin);

    // x-axis label
    textAlign(CENTER, CENTER);
    text("State/Territory", width/2, height - bottomMargin / 2);
    // y-axis label
    pushMatrix();
    translate(leftMargin / 2 - 20, 700);
    rotate(-PI / 2);
    if (cities.size() <= 20) {
      text("Distance (Miles)", 0, 0);
    } else {
      text("Distance (Million Miles)", 0, 0);
    }
    popMatrix();

    // y-scale
    float maxDistances = Collections.max((distances));
    float tickInterval = maxDistances / 5;
    for (int i = 0; i <= 5; i++) { // labels on y
      float y = map(i * tickInterval, 0, maxDistances, height - bottomMargin, topMargin);
      line(leftMargin - 5, y, leftMargin, y); //tick mark
      textAlign(RIGHT, CENTER);
      textSize(12);
      if (cities.size() <= 20) {
        text(Math.round(i * tickInterval), leftMargin - 10, y);
      } else {
        float barNumber = (float) Math.round((i * tickInterval)/100000)/10;
        String barNumberString = String.valueOf(barNumber);
        barNumberString.substring(0, 2);
        text(barNumberString + "M", leftMargin - 10, y);
      }
    }

    // Hover is detected
    hoverIndex = -1;
    for (int i = 0; i < cities.size(); i++) {
      float x = leftMargin + i * barWidth;
      float y = map(distances.get(i), 0, maxDistance, height - bottomMargin, topMargin);
      float barHeight =  height - bottomMargin - y + 2;
      if (mouseX >= x && mouseX <= x + barWidth && mouseY >= y && mouseY <= y + barHeight) {
        hoverIndex = i;
        break;
      }
    }

    if (hoverIndex != -1) {
      // Hover box is created and displayed with the chosen airport and the total number of flights to/from that airport
      float tooltipWidth = 460;
      float tooltipHeight = 100;
      float tooltipX = 30;
      float tooltipY = 210;

      fill(BLUE_BLACK);
      rect(tooltipX, tooltipY, tooltipWidth, tooltipHeight, corner);

      fill(WHITE);
      textSize(30);
      textAlign(LEFT);
      text("Distance: " + distances.get(hoverIndex) + " miles", tooltipX + 20, tooltipY + 40);
      text("State/Territory: " + americanStateNames[Arrays.asList(americanStateAbbr).indexOf(cities.get(hoverIndex))], tooltipX + 20, tooltipY + 80);
    }
  }
}
