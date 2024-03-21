String[] lines;
ArrayList<DataPoint> dataPoints = new ArrayList<DataPoint>();
BarChart flightBarChart;
FlightsPerAirport flights;
final int SCREENX = 1500;
final int SCREENY = 1000;
void setup() {
  size(1500,1000);
  lines = loadStrings("flights_full.csv");//导入数据


  for (int i = 1; i < lines.length; i++) { // 获取信息
    String[] fields = split(lines[i], ',');
    for (int j = 0; j < fields.length; j++) {
      fields[j] = fields[j].replaceAll("^\"|\"$", "");
    }
    dataPoints.add(new DataPoint(fields)); 
  }

String FromWhatAirport = " NY";
FlightsPerAirport flights = new FlightsPerAirport(dataPoints,FromWhatAirport);//创建一个数据库
  
  for (int i = 0; i < flights.airportNames.size(); i++) {
            String airportName = flights.airportNames.get(i);
            Integer flightCount = flights.numberOfFlights.get(i);
      }
  flightBarChart = new BarChart(flights.airportNames, flights.numberOfFlights,FromWhatAirport);//创建barchart
}

void draw() {
  background(255,255,255);
  flightBarChart.draw();
  
}
