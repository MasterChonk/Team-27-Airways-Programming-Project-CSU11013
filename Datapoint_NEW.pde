// create class when data is needed/
// pass in what data is needed
// data is found and returned as an array

class DataTable {
  Table data;

  DataTable(String fileName) {
    // loads data into table
    this.data = loadTable(fileName, "header");
  }

  // methods to search for specific data in a certain column in rows of data and
  // return other data from rows that contain said data in the correct column
  // function overloading used as data contains strings and integers as data

  StringList findData(int startDate, int endDate, String chosenColumn, String dataPoint, String dataPointOut) {
    StringList dataArr = new StringList();
    for (TableRow row : data.rows()) {
      if (row.getString(chosenColumn).equals(dataPoint) && withinDateRange(row, startDate, endDate)) {
        dataArr.append(row.getString(dataPointOut));
      }
    }
    return dataArr;
  }

  boolean withinDateRange(TableRow row, int startDate, int endDate) {
    boolean dateLessThanTen = row.getString("FL_DATE").substring(3, 4).equalsIgnoreCase("/");
    if (dateLessThanTen) {
      if (Integer.parseInt(row.getString("FL_DATE").substring(2, 3)) >= startDate && Integer.parseInt(row.getString("FL_DATE").substring(2, 3)) <= endDate) {
        return true;
      }
    } else {
      if (Integer.parseInt(row.getString("FL_DATE").substring(2, 4)) >= startDate && Integer.parseInt(row.getString("FL_DATE").substring(2, 4)) <= endDate) {
        return true;
      }
    }
    return false;
  }
}

// method to get the frequency of unique occurances of an array of
// different values and return it as a hashmap of frequencies
HashMap findFrequency(StringList data) {
  HashMap<String, Integer> dataFrequency = new HashMap<String, Integer>();
  for (String element : data) {
    dataFrequency.put(element, dataFrequency.getOrDefault(element, 0) + 1);
  }
  return dataFrequency;
}

HashMap findFrequency(String[] data) {
  HashMap<String, Integer> dataFrequency = new HashMap<String, Integer>();
  for (String element : data) {
    dataFrequency.put(element, dataFrequency.getOrDefault(element, 0) + 1);
  }
  return dataFrequency;
}

HashMap findFrequency(ArrayList<String> data) {
  HashMap<String, Integer> dataFrequency = new HashMap<String, Integer>();
  for (String element : data) {
    dataFrequency.put(element, dataFrequency.getOrDefault(element, 0) + 1);
  }
  return dataFrequency;
}
