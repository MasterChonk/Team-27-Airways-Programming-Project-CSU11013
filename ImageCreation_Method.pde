// Jakub Kieblesz
// Method for creating all Images for Home Screen and Data Screen 
void ImageCreation(PImage logo27Airways, PImage experience27Airways, PImage calendarIcon, PImage airportIcon, PImage USAflag, PImage Irelandflag, PImage doubleArrow, PImage plane27Airways) {
  // Home Screen Images
  Image logo = new Image(30, 30, logo27Airways, false);
  Image stockPhoto = new Image((SCREENX - stockPhotoWidth)/2, 400, experience27Airways, false);
  Image calendar = new Image(calendarX + calendarWidth - 100, selectDateY, calendarIcon, false);
  Image airport = new Image(calendarX + calendarWidth - 100, selectAirportY, airportIcon, false); 
  Image flag1 = new Image(SCREENX - 414, 30, USAflag, false);
  Image flag2 = new Image(SCREENX - 160, 30, Irelandflag, false);
  Image arrow = new Image(SCREENX - 280, 30, doubleArrow, false);
  Image stockPhoto2 = new Image((SCREENX - stockPhotoWidth)/2, 200, plane27Airways, true);
  homeImageList.add(logo);
  homeImageList.add(stockPhoto);
  homeImageList.add(calendar); 
  homeImageList.add(airport);
  homeImageList.add(flag1);
  homeImageList.add(flag2);
  homeImageList.add(arrow);
  dataImageList.add(logo);
  dataImageList.add(stockPhoto2);
}
