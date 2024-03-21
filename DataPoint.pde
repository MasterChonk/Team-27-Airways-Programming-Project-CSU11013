class DataPoint {
  String date; 
  String carrierCode;
  int flightNumber;
  String originCode;
  String originCity;
  String originCityShort;
  String originState;
  int originWac;
  String dest;
  String destCity;
  String destCityShort;
  String destState;
  int destWac;
  String CRSDepTime;
  String depTime;
  String CRSArrTime;
  String arrTime;
  float cancelled;
  float diverted;
  Float dis;
  
  
  DataPoint(String[] fields) {
    this.date = fields[0];
    this.carrierCode = fields[1];
    this. flightNumber = Integer.parseInt(fields[2]);
    this.originCode = fields[3];
    this.originCity = fields[4];
    this.originCityShort = fields[5];
    this.originState = fields[6];
    this.originWac = Integer.parseInt(fields[7]);
    this.dest = fields[8];
    this.destCity = fields[9];
    this.destCityShort = fields[10]; 
    this.destState = fields[11];
    this.destWac = Integer.parseInt(fields[12]);
    this.CRSDepTime = fields[13];
    this.depTime = fields[14];
    this.CRSArrTime = fields[15];
    this.arrTime = fields[16];
    this.cancelled = Float.parseFloat(fields[17]);
    this.diverted = Float.parseFloat(fields[18]);
    this.dis = Float.parseFloat(fields[19]);
  }
}
