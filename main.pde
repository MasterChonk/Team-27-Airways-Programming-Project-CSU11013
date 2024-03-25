import java.util.*;


final int X = 1500;
final int Y = 1000;
DataTable data;


void setup() {
  data = new DataTable("flights_full.csv");
  HashMap<String, Integer> n = findFrequency(data.findData("DEST" ,"LAX" ,"ORIGIN_STATE_ABR"));
  ArrayList<String> airports = new ArrayList<String>(Arrays.asList(n.keySet().toArray(new String[0]))); // ArrayList of unique airports 
  ArrayList<Integer> frequency = new ArrayList<Integer>(Arrays.asList(n.values().toArray(new Integer[0]))); // ArrayList of frequencies of unique airports
  for (Map.Entry me : n.entrySet()) {
    println(me.getKey() + " occurs " + me.getValue() + " times");
  }
    
  //for (String n : data.findData("DEST" ,"LAX" ,"ORIGIN")) {
  //  println(n);  
  //}
  
}
