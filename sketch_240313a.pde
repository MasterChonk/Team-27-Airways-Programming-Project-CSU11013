String[] lines;

void setup() {
  lines = loadStrings("flights2k(1).csv");
  DataPoint[] dataPoints = new DataPoint[lines.length - 1]; 

  for (int i = 1; i < lines.length; i++) {
    String[] fields = split(lines[i], ',');
    for (int j = 0; j < fields.length; j++) {
      fields[j] = fields[j].replaceAll("^\"|\"$", "");
    }
    dataPoints[i - 1] = new DataPoint(fields);
  }
  for (int i = 0; i < dataPoints.length; i++) {
  if (dataPoints.length > 0) {
    println(dataPoints[i].originCity); 
  }
 }
 for (int i = 0; i < dataPoints.length; i++) {
    if (dataPoints[i].originState.equals("IL") || dataPoints[i].destState.equals("IL")) {
      println("DataPoint containing 'NY' found at index: " + i);
    }
  }
}

void draw() {
}
