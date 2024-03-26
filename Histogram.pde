import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

Table table;
HashMap<String, Integer> cityCountMap = new HashMap<String, Integer>();
String[] cities;
int[] flights;

int hoverIndex = -1;

void setup() {
  size(2000, 1400); 
  background(255);

  table = loadTable("flights2k(1).csv","header");
  println("total " + table.getRowCount() + " rows");
  
  for (TableRow row : table.rows()) {
    String city = row.getString(5); 
    if (cityCountMap.containsKey(city)) {
        int count = cityCountMap.get(city);
        cityCountMap.put(city, count + 1);
    } else {
        cityCountMap.put(city, 1);
    }
  }
  
  // Extracting cities and counts from the map
  ArrayList<String> citiesList = new ArrayList<String>();
  ArrayList<Integer> flightsList = new ArrayList<Integer>();
  for (Map.Entry<String, Integer> entry : cityCountMap.entrySet()) {
    citiesList.add(entry.getKey());
    flightsList.add(entry.getValue());
  }
  
  // Convert ArrayLists to arrays
  cities = citiesList.toArray(new String[citiesList.size()]);
  flights = new int[flightsList.size()];
  for (int i = 0; i < flightsList.size(); i++) {
    flights[i] = flightsList.get(i);
  }
}

void draw() {
  background(255);
  
  float topMargin = 200;
  float bottomMargin = 50;
  float leftMargin = 80; 
  float rightMargin = 50;
  
  float availableWidth = width - leftMargin - rightMargin;
  float availableHeight = height - topMargin - bottomMargin;
  
  textSize(30);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Number of Flights on 01/01/2022", width/2, topMargin/2);
  
  // x-axis
  stroke(0);
  line(leftMargin, height - bottomMargin, width - rightMargin, height - bottomMargin);
  // y-axis
  line(leftMargin, topMargin, leftMargin, height - bottomMargin);
  
  // x label
  textAlign(CENTER, CENTER);
  text("City", width / 2, height - bottomMargin / 2);
  // y label
  pushMatrix();
  translate(leftMargin / 2, height / 2);
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

    color barColor;
    if (i < cities.length / 2) {
      float blueAmount = map(i, 0, cities.length / 2, 0, 1);
      barColor = lerpColor(color(173, 216, 230), color(25, 25, 112), blueAmount);
    } else {
      float redAmount = map(i, cities.length / 2, cities.length - 1, 0, 1);
      barColor = lerpColor(color(139, 0, 0), color(255, 192, 203), redAmount);
    }
    
    fill(barColor);
    rect(x, y, barWidth, barHeight);

    // Draw state names
    textAlign(CENTER, TOP);
    textSize(12);
    text(cities[i], x + barWidth / 2, height - 20);

    // Draw flight numbers
    textAlign(CENTER, BOTTOM);
    text(flights[i], x + barWidth / 2, y - 5);
  }
  
  // small box on top right
  if (hoverIndex != -1) {
    float tooltipWidth = 300; 
    float tooltipHeight = 100; 
    float tooltipX = width - tooltipWidth - 10; 
    float tooltipY = 10; 
    fill(255); 
    rect(tooltipX, tooltipY, tooltipWidth, tooltipHeight);
    fill(0); 
    textSize(23); 
    textAlign(LEFT);
    text("City: " + cities[hoverIndex], tooltipX + 10, tooltipY + 20);
    text("Flights: " + flights[hoverIndex], tooltipX + 10, tooltipY + 40);
    float averageFlights = calculateAverageFlights(cities[hoverIndex], cityCountMap);
    text("Average Flights per Day: " + nf(averageFlights, 0, 2), tooltipX + 10, tooltipY + 60);
  }
}
// count average, need to change
float calculateAverageFlights(String city, HashMap<String, Integer> cityCountMap) {
  int totalFlights = cityCountMap.get(city);
  return totalFlights / 31.0; 
}

void mouseMoved() {
  // Detect mouse hover
  float barWidth = (width - 80 - 50) / (float)cityCountMap.size();
  int potentialHoverIndex = int((mouseX - 80) / barWidth);
  hoverIndex = (potentialHoverIndex >= 0 && potentialHoverIndex < cityCountMap.size()) ? potentialHoverIndex : -1;
}
