final float MARGINY = 350; //<>//
final float GAPPERCENT = 30;

class BarChart{
  ArrayList<String> names;
  ArrayList<Integer> frequency;
  float barWidth;
  int barGap = 20;
  int largestFreq;
  int barHeight;
  float multiple;
  float gap;
  float barSpace;
  float MARGINX;
  String FromWhatAirport;
  
  BarChart(ArrayList<String> name, ArrayList<Integer> frequency, String FromWhatAirport){
    this.names = name; 
    this.frequency = frequency;
    this.FromWhatAirport = FromWhatAirport;
    
    barWidth = (SCREENX-400)/(name.size()*2+1);
    
    for (Integer freq : frequency) {
      if (largestFreq<freq) {
        largestFreq=(int)freq;
      }
    }
    println(largestFreq);
    if(largestFreq%10>=5)
      barHeight = (largestFreq-(largestFreq%10))+10;
    else
      barHeight = (largestFreq-(largestFreq%10))+5;
    println(barHeight);
  }
  
  void draw(){

    
    int counter = 0;
    
    for (Integer freq : frequency)
    {
      fill(255,128,0);
      noStroke();
      rect(barWidth+200 + (barWidth)*counter, SCREENY-200-(600*freq/barHeight), barWidth, 600*freq/barHeight+1);
      counter+=2;
    }
    counter = 0;
    
    for (String name : names) {
      fill(0);
      float textsize;
      if (barWidth>30) {
      textsize = 30;
        textSize(textsize);}
      else {
      textsize = barWidth/2;
        textSize(textsize);
      }
      textAlign(CENTER);
      text(name, 200+barWidth*counter+barWidth*3/2, SCREENY-200+textsize*2);
      counter+=2;
    }
if(barHeight<=100){
   for(int i = 0;i<=barHeight;i+=5){
          textSize(30);
       textAlign(CENTER);
       
       text(i, 165,(SCREENY-185)-(i*600/barHeight));
   }}
   if(barHeight<=1000){
   for(int i = 0;i<=barHeight;i+=50){
          textSize(30);
       textAlign(CENTER);
       
       text(i, 165,(SCREENY-185)-(i*600/barHeight));
   }}
   if(barHeight<=10000){
   for(int i = 0;i<=barHeight;i+=500){
          textSize(30);
       textAlign(CENTER);
       
       text(i, 165,(SCREENY-185)-(i*600/barHeight));
   }}
   
   
    for (int i = 0; i < names.size(); i++) {
      Integer flightCount = frequency.get(i);
      fill(0);
        if (barWidth>30) 
          textSize(30);
        else 
          textSize(barWidth/2);
        textAlign(CENTER);
        text(flightCount,200+barWidth*3/2+i*2*barWidth , 790-600*flightCount/barHeight);
      }
          textSize(40);
    textAlign(CENTER);
    text("From:" + FromWhatAirport,100,SCREENY-120);
    noStroke();
    fill(0);
    rect(200,800,1100,5);
    rect(200,200,5,600);
  }
}
