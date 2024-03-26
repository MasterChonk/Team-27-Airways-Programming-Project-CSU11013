import org.gicentre.utils.stat.*;
import java.util.*;
import java.io.*;

// shows sample bar chart using library aswell

final int X = 1500;
final int Y = 1000;
DataTable data1;
BarChart barchart;


void setup() {
  // use the name of the csv file to load data into the table
  data1 = new DataTable("flights_full.csv");

  // The hash map is a object that stores a key in this case a string category and a value
  // in this case the frequency of the category
  HashMap<String, Integer> n = findFrequency(data1.findData("ORIGIN_STATE_ABR", "NY", "DEST_STATE_ABR"));
  // ArrayList of unique airports
  // If you want just a normal array use : frequencyOfCategories.keySet().toArray(new String[0]);
  ArrayList<String> categories = new ArrayList<String>(Arrays.asList(n.keySet().toArray(new String[0])));
  // ArrayList of frequencies of unique airports
  // If you wnat just a normal array use : frequencyOfCategories.values().toArray(new Integer[0]);
  // NOTE : this is an Integer[] array not int[] array!!
  ArrayList<Integer> frequency = new ArrayList<Integer>(Arrays.asList(n.values().toArray(new Integer[0]))); // ArrayList of frequencies of unique airports
  for (Map.Entry me : n.entrySet()) {
    println(me.getKey() + " occurs " + me.getValue() + " times");
  }
  size(1600, 1000);
  barchart = new BarChart(this);
  float[] d = new float[frequency.size()];
  for (int i = 0; i < frequency.size(); i++) {
    d[i] = (float) frequency.get(i);
  }
  barchart.setData(d);

  barchart.setMinValue(0);
  barchart.setMaxValue(Collections.max(frequency));

  barchart.showValueAxis(true);
  barchart.showCategoryAxis(true);
  String[] nam = new String[categories.size()];
  for (int i = 0; i < categories.size(); i++) {
    nam[i] = categories.get(i);
  }
  barchart.setBarLabels(nam);
  barchart.setBarGap(8);
  barchart.setBarColour(color(200, 80, 80, 150));
  barchart.setCategoryAxisLabel("\nStates");

}

void draw() {
  barchart.draw(15, 15, width - 30, height - 30);
}
