// Written by Kush Voorakkara 19/03/2024
// create class when data is needed/
// pass in what data is needed
// data is found and returned as an array

class DataTable {
  Table data;

  DataTable() {
    // loads data into table
    this.data = loadTable("flights2k(1).csv", "header");
  }
  
  // methods to search for specific data in a certain column in rows of data and 
  // return other data from rows that contain said data in the correct column
  // function overloading used as data contains strings and integers as data

  StringList findData(String chosenColumn, String dataPoint, String dataPointOut) {
    StringList dataArr = new StringList();
    for (TableRow row : data.rows()) {
      if (row.getString(chosenColumn).equals(dataPoint)) {
        dataArr.append(row.getString(dataPointOut));
      }
    }
    return dataArr;
  }

  IntList findData(String chosenColumn, String dataPoint, int dataPointOut) {
    IntList dataArr = new IntList();
    for (TableRow row : data.rows()) {
      if (row.getString(chosenColumn).equals(dataPoint)) {
        dataArr.append(row.getInt(dataPointOut));
      }
    }
    return dataArr;
  }

  StringList findData(String chosenColumn, int dataPoint, String dataPointOut) {
    StringList dataArr = new StringList();
    for (TableRow row : data.rows()) {
      if (row.getInt(chosenColumn) == dataPoint) {
        dataArr.append(row.getString(dataPointOut));
      }
    }
    return dataArr;
  }

  IntList findData(String chosenColumn, int dataPoint, int dataPointOut) {
    IntList dataArr = new IntList();
    for (TableRow row : data.rows()) {
      if (row.getInt(chosenColumn) == dataPoint) {
        dataArr.append(row.getInt(dataPointOut));
      }
    }
    return dataArr;
  }
}
