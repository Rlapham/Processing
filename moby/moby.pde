import rita.*; 

String dataPath = "/Users/richardlapham/documents/processing/moby";

void setup(){
   size(1290, 720, P3D);  
   smooth();
   loadText(dataPath + "/moby.txt"); 
}

void draw(){
  
  
}

void loadText(String url){
 String[] lines =  loadStrings(url);
 String allText = join(lines, " "); 
 
 String[] sentences = RiTa.splitSentences(allText); 
 println(sentences.length); 
 
 findAndSaveWord(sentences, "?"); 
 
} //end of loadtext

void findAndSaveWord(String[] sentences, String w){
 PrintWriter writer = createWriter(w + ".txt");
 ArrayList<String> finds = new ArrayList(); 
 
 for(String sentence:sentences){
    if (sentence.toLowerCase().indexOf("w") != -1){
    finds.add(sentence);  
    writer.println(sentence); 
   }
 }
 
 writer.flush(); 
 writer.close();  
} // end of find