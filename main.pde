 //<>//
final int X = 1500;
final int Y = 1000;
DataTable data;


void setup() {
  data = new DataTable();
  size(1500, 1000);

  for (String data : data.findData("DEST", "HNL", "ORIGIN")) {
    println(data);
  }  '

}
