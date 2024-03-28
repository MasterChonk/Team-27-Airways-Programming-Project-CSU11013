import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;

Table table;
HashMap<String, Integer> cityCountMap = new HashMap<String, Integer>();
HashMap<String, Integer> cityDistanceMap = new HashMap<String, Integer>();
ArrayList<String> cities = new ArrayList<String>();
ArrayList<Integer> distances = new ArrayList<Integer>();
int hoverIndex = -1;

 void setup() {
  size(1500, 1000); // Increase canvas size
  table = loadTable("flights2k(1).csv", "header");
  println("total " + table.getRowCount() + " rows");

  for (TableRow row : table.rows()) {
    String city = row.getString(5); // Read city name from row 5
    int distance = row.getInt(17); // Read distance from row 17

    // Update city count
    if (cityCountMap.containsKey(city)) {
      int count = cityCountMap.get(city);
      cityCountMap.put(city, count + 1);
    } else {
      cityCountMap.put(city, 1);
    }

    // Update city distance
    if (cityDistanceMap.containsKey(city)) {
      int totalDistance = cityDistanceMap.get(city);
      cityDistanceMap.put(city, totalDistance + distance);
    } else {
      cityDistanceMap.put(city, distance);
    }
  }

  // Extract data for histogram
  for (Map.Entry<String, Integer> entry : cityCountMap.entrySet()) {
    String city = entry.getKey();
    int count = entry.getValue();
    int distance = cityDistanceMap.get(city);
    cities.add(city);
    distances.add(distance);
  }
}


void draw() {
  background(230, 230, 50);
  stroke(0);
  fill(150);
  int margin = 50; // Set margin size
  int graphWidth = width - 2 * margin;
  int graphHeight = height - 2 * margin;
  int barWidth = graphWidth / cities.size();
  int maxDistance = Integer.MIN_VALUE;
  for (Integer distance : distances) {
    if (distance > maxDistance) {
        maxDistance = distance;
    }
}

  
  for (int i = 0; i < cities.size(); i++) {
    int x = margin + i * barWidth;
    int y = margin + graphHeight - (int)map(distances.get(i), 0, maxDistance, 0, graphHeight);
    rect(x, y, barWidth, graphHeight - (y - margin));
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(20);
    text(cities.get(i), x + barWidth / 2, height - 10);
  }
  
  // Check if mouse is hovering over any bar
  hoverIndex = -1; // Reset hover index
  for (int i = 0; i < cities.size(); i++) {
    int x = margin + i * barWidth;
    int y = margin + graphHeight - (int)map(distances.get(i), 0, maxDistance, 0, graphHeight);
    if (mouseX >= x && mouseX <= x + barWidth && mouseY >= y && mouseY <= height - margin) {
      hoverIndex = i;
      break; // Stop looping once a bar is hovered over
    }
  }

  // Display tooltip if a bar is hovered over
  if (hoverIndex != -1) {
    int tooltipWidth = 400; 
    int tooltipHeight = 200; 
    int tooltipX = width - tooltipWidth - 20; // Adjust to place at top right corner with some margin
    int tooltipY = 20;
    fill(255);
    rect(tooltipX, tooltipY, tooltipWidth, tooltipHeight);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Distance: " + distances.get(hoverIndex), tooltipX + tooltipWidth / 2, tooltipY + tooltipHeight / 2);
  }
}
