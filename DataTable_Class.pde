// 25/3/2024 Created by Kush
// 27/3/2024 Added feature to find frequency
// 28/3/2024 Added date selection feature, and
// features to get late flights and select whether
// 09/5/2024 added feature to get distances for barchart
// the user wants to look at  going to or coming from the airport they have selected


// create class when data is needed/
// pass in what data is needed
// data is found and returned as a
// HashMap with frequencies and categories

class DataTable {
  Table data;
  int distance;
  DataTable(String fileName) {
    // loads data into table
    this.data = loadTable(fileName, "header");
  }

  // methods to search for specific data in a certain column in rows of data and
  // return other data from rows that contain said data in the correct column
  // function overloading used as data contains strings and integers as data
  // @Parametres: bool dest, bool lateness, bool state, int startDate, int endDate, String dataPoint
  // @Return: StringList

  StringList findData(boolean dest, boolean lateness, boolean state, int startDate, int endDate, String dataPoint) {
    String chosenColumn;
    String dataPointOut;

    // Changes what column of data to look for and
    // extract depending on if the user wants to look at states
    // or by airport

    if (!state) {
      chosenColumn = dest ? "DEST" : "ORIGIN";
      dataPointOut = dest ? "ORIGIN" : "DEST";
    } else {
      chosenColumn = dest ? "DEST_STATE_ABR" : "ORIGIN_STATE_ABR";
      dataPointOut = dest ? "ORIGIN_STATE_ABR" : "DEST_STATE_ABR";
    }

    // checks what rows meet the selected criteria and extracts data from the row
    // using class methods

    StringList dataArr = new StringList();
    for (TableRow row : data.rows()) {
      if (row.getString(chosenColumn).equals(dataPoint) && withinDateRange(row, startDate, endDate) && isLate(row) == lateness) {
        dataArr.append(row.getString(dataPointOut));
      }
    }
    return dataArr;
  }

  HashMap<String, Integer> findData(boolean lateness, boolean dest, int startDate, int endDate, String dataPoint, String dataPointOut) {
    HashMap<String, Integer> dist = new HashMap<String, Integer>();
    String chosenColumn;
    String chosenColumn2;
    chosenColumn = dest ? "DEST_STATE_ABR" : "ORIGIN_STATE_ABR";
    chosenColumn2 = !dest ? "DEST_STATE_ABR" : "ORIGIN_STATE_ABR";



    for (TableRow row : data.rows()) {
      if (row.getString(chosenColumn).equals(dataPoint) && withinDateRange(row, startDate, endDate) && isLate(row) == lateness) {
        distance = dist.getOrDefault(row.getString(chosenColumn2), 0);
        distance+=(int)Float.parseFloat(row.getString(dataPointOut));
        dist.put(row.getString(chosenColumn2),distance);
      }
    }
    return dist;
  }

  // checks if a flight as a Row in the table is late or on time by checking the
  // scheduled departure time and the actual departure time

  boolean isLate(TableRow row) {
    int intendedDep = row.getInt("CRS_ARR_TIME");
    int actDep = row.getInt("ARR_TIME");

    if (actDep > intendedDep) return true;
    return false;
  }

  // checks if a flight is within the range of dates selected by the user

  boolean withinDateRange(TableRow row, int startDate, int endDate) {
    // dates can be 10/1/2022 or 10/11/2022 to extract the correct characters we check where the
    // slash is
    boolean dateLessThanTen = row.getString("FL_DATE").substring(3, 4).equalsIgnoreCase("/");

    // depending on where the slash is the characters for the date are extracted and checked
    // that they are valid and within the date range selected by the user
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
// function overloading to allow for finding frequencies in different
// data structures
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
