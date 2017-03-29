import rita.*;
import java.util.Collections;


RiMarkov markov; 
RiString string;
RiText text;
RiLexicon lexicon; 

ParticleSystem ps;

int NUM_PARTICLE = 20;
Particle[] ourParticles = new Particle[NUM_PARTICLE];

ArrayList<SortableString> sentenceArray;
//ArrayList<SortableString> totArray;

String dataPath = "/Users/richardlapham/Desktop/originSpecies";
String[] wordArray;
String[] wordArray2;
String[] sentences;
String[] repeatAllWords;
String[] tempSentence = {}; 
String[] tempSentence2 = {};
String[] tempSentence3 = {};
String[] calcSentence = {}; 
String[] totSentVal = {}; 
String[] cutArray = {}; 
String[] repeatArray = {}; 
String words; 
String tempSentVal; 
String calcHold; 
String arrayToString;
String arrayToString2; 
String sentSort; 
String cutSent; 
String holdSent; 
String noRepeat;
String sentPause; 
String countText; 
String beginSent; 
String displayText; 
String floatingText1;
String floatingText2;
String floatingText3;
String floatingText4;
String floatingText5;
String floatingText6;
String floatingText7;
String floatingText8;
float totVal; 
float holdVal; 
float length1, length2, length3, length4, length5;
float fHeight = float((height - height/8))/float(8); 
int count = 0; 
int wordCount = 0;
int xText, yText;
//float floatingCount1 = fHeight * 1; 
//float floatingCount2 = fHeight * 2; 
//float floatingCount3 = fHeight * 3; 
//float floatingCount4 = fHeight * 4; 
//float floatingCount5 = fHeight * 5; 
//float floatingCount6 = fHeight * 6; 
//float floatingCount7 = fHeight * 7; 
//float floatingCount8 = fHeight * 8; 
float floatingCount1 = 112.5; 
float floatingCount2 = 208; 
float floatingCount3 = 303.5; 
float floatingCount4 = 399; 
float floatingCount5 = 494.5; 
float floatingCount6 = 590; 
float floatingCount7 = 685.5; 
float floatingCount8 = 781; 
Boolean pushP = false; 
Boolean checkLength = false; 
Boolean counter = false; 
Boolean floating1 = false; 
Boolean floating2 = false; 
Boolean floating3 = false; 
Boolean floating4 = false; 
Boolean floating5 = false; 
Boolean floating6 = false; 
Boolean floating7 = false; 
Boolean floating8 = false; 
PVector holdPos; 
PFont mono;
PFont monoBold;


void setup() {
  println(height/8, fHeight);  
  fullScreen();
  //size(1280,720,P3D);
  smooth();
  mono = createFont("OldStandard-Regular.ttf", 25);
  monoBold = createFont("OldStandard-Bold.ttf", 25);
  xText = width; 
  yText = 20; 
  //make sentences
  loadText(dataPath + "/OriginSent.txt");
  //set word array
  RiTa.tokenize(words);
  repeatAllWords = splitTokens(words); 
  //initialize sentence particles  
  ps = new ParticleSystem(new PVector(random(1, width-1), random(1, height-1)), totVal, sentSort, length1, length2, length3, length4, length5);
  for (int c = 0; c < 15; c++){
     generate(words);
     ps.addParticle(random(1, width-1), random(1, height-1), totVal, sentSort, length1, length2, length3, length4, length5);
     beginSent = sentSort; 
     reset(); 
   }
}

void draw() {
  background(255); 
  pushMatrix(); 
  translate(height/2, height/2); 
  fill(20);
  ellipse(0, 0, height-20, height-20); 
  popMatrix(); 

  ps.update();
  ps.intersection();
  ps.display();
  

  //add at intersection 
  if (pushP = true){
  pushPart(holdPos, holdVal, holdSent, length1, length2, length3, length4, length5); 
  println(holdPos, holdVal, holdSent); 
  countText = holdSent; 
  pushP = false; 
  holdPos = null;
  reset();
  }
  
  
  if (holdSent != null){
    if (wordCount == 8){
      displayText = countText; 
      wordCount = 0; 
    }
    wordCount++;
  }
  
  //text
 if (displayText != null){
    fill(20); 
    textFont(monoBold);
    text(displayText, height+40, height/8);
    if (floatingText1 == null){
      floatingText1 = displayText; 
    }    
    if (floatingText2 == null){
      floatingText2 = displayText; 
    }  
      if (floatingText3 == null){
      floatingText3 = displayText; 
    }  
      if (floatingText4 == null){
      floatingText4 = displayText; 
    }  
      if (floatingText5 == null){
      floatingText5 = displayText; 
    }  
        if (floatingText6 == null){
      floatingText6 = displayText; 
    }  
      if (floatingText7 == null){
      floatingText7 = displayText; 
    } 
       if (floatingText8 == null){
      floatingText8 = displayText; 
    } 
  }

  if (floatingText1 != null){
  pushMatrix();
  textFont(mono);
  fill(20, map(floatingCount1, 0, height, 255, 150)); 
  text(floatingText1, height+40, floatingCount1);
  popMatrix();
  }
  
  if (floatingText2 != null){
  fill(20, map(floatingCount2, 0, height, 255, 150)); 
  text(floatingText2, height+40, floatingCount2);
  }
  if (floatingText3 != null){
  fill(20, map(floatingCount3, 0, height, 255, 150)); 
  text(floatingText3, height+40, floatingCount3);
  }
  if (floatingText4 != null){
  fill(20, map(floatingCount4, 0, height, 255, 150)); 
  text(floatingText4, height+40, floatingCount4);
  }
  if (floatingText5 != null){
  fill(20, map(floatingCount5, 0, height, 255, 150)); 
  text(floatingText5, height+40, floatingCount5);
    }
  if (floatingText6 != null){
  fill(20, map(floatingCount6, 0, height, 255, 150)); 
  text(floatingText6, height+40, floatingCount6);
  }
  if (floatingText7 != null){
  fill(20, map(floatingCount7, 0, height, 255, 150)); 
  text(floatingText7, height+40, floatingCount7);
    }
  if (floatingText8 != null){
  fill(20, map(floatingCount8, 0, height, 255, 150)); 
  text(floatingText8, height+40, floatingCount8);
    }
  
   floatingCount1+=2; 
 if (floatingCount1 > height){
    floating1 = true; 
    floatingCount1 = height/8+20; 
  }
  
   floatingCount2+=2; 
 if (floatingCount2 > height){
    floating2 = true; 
    floatingCount2 = height/8+20; 
  }
  
     floatingCount3+=2; 
 if (floatingCount3 > height){
    floating3 = true; 
    floatingCount3 = height/8+20; 
  }
     floatingCount4+=2; 
 if (floatingCount4 > height){
    floating4 = true; 
    floatingCount4 = height/8+20; 
  }
     floatingCount5+=2; 
 if (floatingCount5 > height){
    floating5 = true; 
    floatingCount5 = height/8+20; 
  }
     floatingCount6+=2; 
 if (floatingCount6 > height){
    floating6 = true; 
    floatingCount6 = height/8+20; 
  }
     floatingCount7+=2; 
 if (floatingCount7 > height){
    floating7 = true; 
    floatingCount7 = height/8+20; 
  }
       floatingCount8+=2; 
 if (floatingCount8 > height){
    floating8 = true; 
    floatingCount8 = height/8+20; 
  }
  
  
  if (floating1){
   floatingText1 = null;  
   floating1 = false;  
  }
  
  if (floating2){
   floatingText2 = null;  
   floating2 = false;  
  }
    if (floating3){
   floatingText3 = null;  
   floating3 = false;  
  }
    if (floating4){
   floatingText4 = null;  
   floating4 = false;  
  }
    if (floating5){
   floatingText5 = null;  
   floating5 = false;  
  }
      if (floating6){
   floatingText6 = null;  
   floating6 = false;  
  }
    if (floating7){
   floatingText7 = null;  
   floating7 = false;  
  }
  if (floating8){
   floatingText8 = null;  
   floating8 = false;  
  }
  
   count++; 
   if (count == 70){
    counter = true; 
    count = 0; 
  }
  
  //keep making new sentences
  if (counter){
  if (holdSent == null){
    for (int c = 0; c < 15; c++){
     generate(words);
     ps.addParticle(random(1, width-1), random(1, height-1), totVal, sentSort, length1, length2, length3, length4, length5);
     reset(); 
    }
   }
   counter = false; 
  }
 
 
}

////individual word array//
void loadText(String url) {
  String[] lines = loadStrings(url);
  String allText = join(lines, " ");
  words = RiTa.stripPunctuation(allText);  
}

void generate(String input){
  ///make sentences 
  makeSentence(input);  
  //make array list
  loadSentences(arrayToString); 
  //sort sentences by length
  Collections.sort(sentenceArray);
  for (int i = 0; i < tempSentence.length; i++){
    String wordHold2 = sentenceArray.get(i).text; 
    tempSentence2 = splice(tempSentence2, wordHold2, i); 
  }
  arrayToString2 = join(tempSentence2, " ");
  sentSort = RiTa.stripPunctuation(arrayToString2);
  //calculate values
  calculateSent(sentSort);
}

void makeSentence(String text){  
  RiTa.tokenize(text);
  wordArray = splitTokens(text); 

  //add words to sentence   
    for (int r = 0; r < 6; r++){
      float f = random(0, (wordArray.length));
      int i = int(f); 
      String wordHold = wordArray[i];

      tempSentence = splice(tempSentence, wordHold, r); 
    }

  //convert array to string 
  arrayToString = join(tempSentence, ". ");
} 

void loadSentences(String url) {
  RiTa.tokenize(url);
  String [] sentences = splitTokens(url); 
  sentenceArray = new ArrayList();
  for (String s : sentences) { 
  sentenceArray.add(new SortableString(s));
  }
}
 

void calculateSent(String url){
    RiTa.tokenize(url);
    String[] splitSort = splitTokens(url); 
    
    
    for (int j = 0; j < splitSort.length -1; j++){
      float intHold = (splitSort[j+1].length()*100/splitSort[j].length()*100);
      intHold = intHold/10000; 
      calcHold = nf(intHold);
      calcSentence = splice(calcSentence, calcHold, j); 
    } 
    //record length value
      String lengthHold = calcSentence[0]; 
      length1 = float(lengthHold); 
      lengthHold = calcSentence[1];
      length2 = float(lengthHold); 
      lengthHold = calcSentence[2];
      length3 = float(lengthHold); 
      lengthHold = calcSentence[3];
      length4 = float(lengthHold); 
      lengthHold = calcSentence[4];
      length5 = float(lengthHold); 
    
    ///get distance from 1.61
    for (int i = 0; i < calcSentence.length; i++){
      float valHold = dist(float(calcSentence[i]), float(calcSentence[i]), 1.61, 1.61); 
      totVal = totVal + valHold; 
    }
  }
  
void reset(){ 
    //reset 
    totVal = 0; 
    sentences = null;
    tempSentence = new String[0]; 
    tempSentence2 = new String[0];
    tempSentence3 = new String[0];
    calcSentence = new String[0]; 
    totSentVal = new String[0];
    cutArray = new String[0]; 
    repeatArray = new String[0]; 
}




///for particle
void particleCalc(String input){
  //erase duplicates
  noRepeat(input);
  ////make sentences 
  makeSentencePart(noRepeat);
  //make array list
  loadSentences(noRepeat); 
  //sort sentences by length
  Collections.sort(sentenceArray);
  for (int i = 0; i < tempSentence.length; i++){
    String wordHold2 = sentenceArray.get(i).text; 
    tempSentence2 = splice(tempSentence2, wordHold2, i); 
  }
  arrayToString2 = join(tempSentence2, " ");
  sentSort = RiTa.stripPunctuation(arrayToString2);
  //cut half sentence
  partCut(sentSort); 
  //calculate values
  calculateSent(cutSent);
}


void makeSentencePart(String text){  
  RiTa.tokenize(text);
  wordArray = splitTokens(text); 

  //add words to sentence   
    for (int r = 0; r < wordArray.length; r++){
      float f = random(0, (wordArray.length));
      int i = int(f); 
      String wordHold = wordArray[i];

      tempSentence = splice(tempSentence, wordHold, r); 
    }
  //convert array to string 
  arrayToString = join(tempSentence, ". ");
  //println("ATS", arrayToString);
} 

void partCut(String input){
    String[] tempArray = splitTokens(input); 
    for (int m = 0; m < tempArray.length/2; m++){
      int ind = int(random((m +(m-1)), (m + m)));  
      cutArray = splice(cutArray, tempArray[ind], m); 
    }
    cutSent = join(cutArray, " "); 
}

void pushPart(PVector coord, float value, String sentence, Float L1, Float L2, Float L3, Float L4, Float L5){
    ps.addParticle(random(1, width-1), random(1, height-1), value, sentence, L1, L2, L3, L4, L5);
}

void noRepeat(String input){
  RiTa.tokenize(input);
  wordArray2 = splitTokens(input); 
  
  //delete duplicate words
  for (int a = 0; a < wordArray2.length; a++){
      String repeatHold = wordArray2[a];
   
      //convert array to temp string 
      String checkString = join(repeatArray, " ");
      //check for more duplicates 
      Boolean check = checkString.contains(repeatHold);
      if (!check){           
        repeatArray = append(repeatArray, repeatHold);
      } //end of check
  } //end a
  
  
  // repopulate repeatArray && parse duplicates
  while (repeatArray.length < 12){
      float f = random(0, (repeatAllWords.length));
      int i = int(f); 
      String wordHold = repeatAllWords[i];
      String [] wordHoldArray = splitTokens(wordHold); 
      
      //check for length duplicates
        for (int b = 0; b < repeatArray.length; b++){
          int check1 = repeatArray[b].length(); 
          int check2 = wordHoldArray[0].length();
            if (check1 == check2){
                checkLength = true; 
             } //end of if 
         } // end of check length   
     
     if (!checkLength){
       if (wordHold.length() > 2){
         println(wordHold.length()); 
      //check for duplicates 
      //convert array to temp string 
      String checkString = join(repeatArray, " ");
      //check for more duplicates 
      Boolean check = checkString.contains(wordHold);
        if (!check){           
          repeatArray = append(repeatArray, wordHold);
        } //end of check
       }//end of length 
      } // end check length
  checkLength = false;
  }
      
  //convert array to string 
 
  noRepeat = join(repeatArray, ". ");
  //println("NR", noRepeat);
  repeatArray = new String[0]; 
}

//void textMove(String str1){
//  // set the fill for the text
//  fill(250);
  
//  // set the font   
//  textFont(mono);

//  // If the head of the text has started to go off screen, 
//  // draw a second copy behind it by 50 pixels
//  if (xText < 0) {

//    text(str1, xText + textWidth(str1) + 50, 20);
//  }

//  //// if the first copy of the text is completely offscreen, set x to be 
//  //// at the current location of the second copy
//  //if (xText <= -textWidth(str1)) {
//  //  xText = xText + (int)textWidth(str1) + 50;
//  //}

//  // Draw the text
//  text(str1, xText, yText);
//  // move the position one to the left
//  xText--;
//} 
  



//old
//void markSentence(String text){
//   RiMarkov rm = new RiMarkov(this, 3);
//   String[] tempwordArray = splitTokens(text); 
//   rm.loadTokens(tempwordArray); // in data dir.
//   String[] sents = rm.generateSentences(1);
//   for (int i = 0; i < sents.length; i++) {
//     System.out.println(sents[i]);
//   } 
//}


  //setup 
  //make sentences
  //loadText(dataPath + "/OriginSent.txt");
  //generate sentence and calc
  //for (int i = 0; i < NUM_PARTICLE; i++){
  //  //make particle
  //  generate(words); 
  //  ourParticles[i] = new Particle(totVal, sentSort);
  //  println(totVal, sentSort);

  //  //reset 
  //  totVal = 0; 
  //  sentences = null;
  //  tempSentence = new String[0]; 
  //  tempSentence2 = new String[0];
  //  calcSentence = new String[0]; 
  //  totSentVal = new String[0];     
  //}

  //draw
  //run particles
  //for (int j = 0; j < NUM_PARTICLE; j++){
  //ourParticles[j].run(); 
  //}



  