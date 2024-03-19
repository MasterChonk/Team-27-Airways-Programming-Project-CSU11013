import uibooster.*;
import uibooster.components.*;
import uibooster.model.*;
import uibooster.model.formelements.*;
import uibooster.model.options.*;
import uibooster.utils.*;
import java.util.Arrays;
import java.util.Date;

final int X = 1500;
final int Y = 1000;
DataPoint[] dataPoints;
String[] lines;
Table data;

void setup() {
  data = loadTable("flights2k(1).csv", "header");
  size(1500, 1000);
  lines = loadStrings("flights2k(1).csv");
  dataPoints = new DataPoint[lines.length - 1];

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
  
  for (TableRow row : data.rows()) {
    println(row.getString("ORIGIN"));
  }
}





void draw() {
}
