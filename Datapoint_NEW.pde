// create class when data is needed/
// pass in what data is needed
// data is found and returned as an array

class DataTable {
  Table data;
  String chosenColumn;
  String dataPoint;
  
  DataTable(String dataColumn, String dataPoint) {
    this.dataPoint = dataPoint;
    this.data = loadTable("flights2k(1).csv", "header");
    this.chosenColumn = dataColumn;
  }

  ArrayList<String> findData() {
    ArrayList<String> data;
    for (TableRow row : data.findRows(chosenColumn, dataPoint)) {
      data.add(row.getString(chosenColumn));
    }
  } 
}
