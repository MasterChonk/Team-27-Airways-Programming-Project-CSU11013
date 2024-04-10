// Thiago Mumare
// function created and updated on 08/04
// the method writes on screen 6 random facts about the US which change over time by selecting a new fact number
void Facts() {
  //timer for showing the next fact
  if (timer <=0) {
    nextFact = random(0, 6);
    if (nextFact == factNo)
      nextFact--;
    factNo = nextFact;
    timer = 500;
  }
// Choose fact to write
  switch ((int) factNo) {
  case 0:
    fact = "In the US there are around 16,405,000 flights per year handled by the FAA, averaging 45,000 flights daily!";
    break;
  case 1:
    fact = "Every day, some 93,000 flights take off from approximately 9,000 airports."+
      "\nAt any given time, there are between 8,000 and 13,000 airplanes in the air!";
    break;
  case 2:
    fact = "Over 30,000 flights with two million passengers on board take off every single day in the United States alone.";
    break;
  case 3:
    fact = "Hartsfield-Jackson Atlanta International Airport is the busiest airport in the US."+
      "\nIt handles 45.4 million passengers on 329,992 flights per year.That's almost 1,000 flights per day."+
      "\nThis makes Atlanta one of the busiest airports in the world.";
    break;
  case 4:
    fact = "U.S. airlines carried 194 million more passengers in 2022 than in 2021, up 30% year-to-year."+
      "\nFor the full year 2022, January through December, U.S. airlines carried 853 million passengers,"+
      "\nup from 658 million in 2021 and 388 million in 2020.";
    break;
  case 5:
    fact = "The most expensive airport to fly out of for U.S. domestic travel is Guam (GUM) with an average cost of $1,521.24";
    break;
  case 6:
    fact = "The least expensive airport to fly out of for U.S. domestic travel is San Bernardino, CA (SBD) with an average cost of $104.03 ";
    break;
  default:
    fact = "In the US there are around 16,405,000 flights per year handled by the FAA, averaging 45,000 flights daily!";
  }
  //Write fact
  textFont(factFont);
  textSize(30);
  textAlign(CENTER, CENTER);
  fill(WHITE);
  text("Here are some facts about the US for you:", SCREENX/2, SCREENY/2 + 300);
  textSize(24);
  text(fact, SCREENX/2, SCREENY/2 + 400);
  timer--;
}
