//PImage ourImage; 
import processing.video.*; 

Capture video;

void setup(){
  size(640,480);
  //ourImage = loadImage("cb0912d6f80078594c34d3d47ed49f3f.jpg");
  //ourImage.resize(width, height);  
  video = new Capture(this.width, this.height); 
  video.start; 
}

void draw(){
 //ourImage.loadPixels();
 if (video.available() ) video.read(); 
 video.loadPixels();
 loadPixels(); 
 
 for (int x = 0; x < width; x++){
  for (int y = 0; y <height; y++){ 
     int ourPix = x + y * width;   
     //color ourColor = ourImage.pixels[ourPix]; 
     color ourColor = video.pixels[ourPix]; 
     
     float R = red(ourColor); 
     float G = green(ourColor);
     float B = blue(ourColor); 
     
     pixels[ourPix] = color(R,G,B); 
     
  }
 } // end loop
 updatePixels(); 
} //end draw