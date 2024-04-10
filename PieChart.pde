//Thiago Mumare
//Class updaded multiple times throughout the duration of the project
//Class for creating and drawing the pie chart
class PieChart
{
  final int ARC_X = width/2;
  final int ARC_Y = height/2 + 100;
  final int RADIUS = 600;
  ArrayList<Integer> data;
  ArrayList<Float> angles;
  ArrayList<String> places;
  String airport;
  int openedDone = 0;
  int angle = 360;
  int total;
  float topMargin = 400;
  float tXpos, tYpos, tAngle;
  boolean open = false;
  boolean closed = false;

  // Constructor - takes in the data list in numbers and places (ordered) and the airport selected
  PieChart (ArrayList<Integer> data, ArrayList<String> places, String airport)
  {
    this.data = data;
    for (int i=0; i < data.size(); i++)
    {
      total += data.get(i);
    }
    this.places = places;
    angles = convertDataToAngles(data);
    this.places.add("Others");
    this.airport = airport;
  }

  // Method to convert the data into angles to be the angles for the pie chart
  // Return an arraylist of angles
  ArrayList<Float> convertDataToAngles(ArrayList<Integer> data)
  {
    float others = 0;
    ArrayList<Float> ang = new ArrayList<Float>();
    // Array of numbers to be removed from the data and added to "others"
    ArrayList<Integer> rem = new ArrayList<Integer>();


    for (int i=0; i < data.size(); i++)
    {
      float a = (float)Math.ceil(data.get(i)*3600/total)/10;
      if (a <= 7)
      {
        rem.add(i);
        others += a;
      } else
        ang.add(a);
    }
    for (int i=rem.size()-1; i >= 0; i--)
    {
      places.remove((int)rem.get(i));
    }
    float totalAng = 0;
    ang.add(others);
    for (int i=0; i < ang.size(); i++)
    {
      totalAng += ang.get(i);
    }
    ang.set(ang.size()-1, (ang.get(ang.size()-1)+360-totalAng));
    return ang;
  }
  // Draw Method for Pie Chart
  void draw()
  {
    // Pie Chart is drawn
    if (!closed)
    {
      // Title is drawn
      textSize(30);
      textAlign(CENTER, CENTER);
      fill(BLACK);
      text("Percentage of "+(lateness?"Delayed ":"On Time ")+"Flights " + (destAirport ? "to ":"from ") + stateLabel + ", " + airport: ( 01/" + ((startDate < 10) ? "0"+startDate : startDate) + "/2022 - 01/" + ((endDate < 10) ? "0"+endDate : endDate) + "/2022 )", width/2, topMargin - 150);

      float lastAngle = 0;
      for (int i = 0; i < angles.size(); i++)
      {
        // change color for each arc
        if (i < angles.size()-1)
        {
          float grey = map(i, 0, angles.size(), 0, 255);
          fill (20+grey, 21+0.4*grey, 90-0.5*grey);
        } else
          fill (60);
        arc(ARC_X, ARC_Y, RADIUS, RADIUS, lastAngle, lastAngle+radians(angles.get(i)));
        // write the name of the place of each arc
        tAngle = lastAngle+(radians(angles.get(i))/2);
        fill(BLACK);
        tXpos = ARC_X + RADIUS*cos(tAngle)/1.7;
        tYpos = ARC_Y + RADIUS*sin(tAngle)/1.7;
        textSize(6+5/angles.size()+2*RADIUS/90);
        text(places.get(i), tXpos-6, tYpos+6);
        lastAngle += radians(angles.get(i)); 
      }
      lastAngle = 0;
      for (int i = 0; i<angles.size(); i++){
        tAngle = lastAngle+(radians(angles.get(i))/2);
        //write the percentage for each arc
        fill(WHITE);
        tXpos = ARC_X + RADIUS*cos(tAngle)/2.5;
        tYpos = ARC_Y + RADIUS*sin(tAngle)/2.5;
        textSize(6+5/places.size()+RADIUS/60);
        text(Math.ceil((double)(angles.get(i))*1000/360)/10+"%", tXpos, tYpos+2);
        
        lastAngle += radians(angles.get(i)); 

      }
    }
    // Hover box is created and displayed with the chosen airport and the total number of flights to/from that airport
    float tooltipWidth = 220;
    float tooltipHeight = 100;
    float tooltipX = 1400;
    float tooltipY = 550;
   
    fill(BLUE_BLACK);
    rect(tooltipX, tooltipY, tooltipWidth, tooltipHeight, corner);

    fill(WHITE);
    textSize(30);
    textAlign(LEFT);
    text("Airport: " + airport, tooltipX + 20, tooltipY + 40);
    text("Flights: " + total, tooltipX + 20, tooltipY + 80);

    // Open the Pie Chart initially if it is the first time clicking on it
    noStroke();
    if (!open)
    {
      //fill(WHITE);     // background color
      arc(ARC_X, ARC_Y, RADIUS+100, RADIUS+100, 0, radians(angle));
      angle = angle-10;
      if (angle <=0)
        open = true;
    }
  }
}
