void ImageCreation(PImage logo27Airways, PImage experience27Airways, PImage calendarIcon, PImage airportIcon, PImage USAflag, PImage Irelandflag, PImage doubleArrow) {
  // Home Screen Images
  Image logo = new Image(30, 30, logo27Airways);
  Image stockPhoto = new Image((SCREENX - stockPhotoWidth)/2, 400, experience27Airways);
  Image calendar = new Image(calendarX + calendarWidth - 100, selectDateY, calendarIcon);
  Image airport = new Image(calendarX + calendarWidth - 100, selectAirportY, airportIcon); 
  Image flag1 = new Image(SCREENX - 414, 30, USAflag);
  Image flag2 = new Image(SCREENX - 160, 30, Irelandflag);
  Image arrow = new Image(SCREENX - 280, 30, doubleArrow);
  homeImageList.add(logo);
  homeImageList.add(stockPhoto);
  homeImageList.add(calendar); 
  homeImageList.add(airport);
  homeImageList.add(flag1);
  homeImageList.add(flag2);
  homeImageList.add(arrow);
  dataImageList.add(logo);
}
