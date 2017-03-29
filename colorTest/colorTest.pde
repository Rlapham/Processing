PImage ourImage; 

void setup(){
  size(1000,800);
  ourImage = loadImage("cb0912d6f80078594c34d3d47ed49f3f.jpg");
  ourImage.resize(width, height);  
}

void draw(){
 ourImage.loadPixels();
 loadPixels(); 
 
 for (int x = 0; x < width; x++){
  for (int y = 0; y <height; y++){ 
     int ourPix = x + y * width;   
     color ourColor = ourImage.pixels[ourPix]; 
     
     float R = red(ourColor); 
     float G = green(ourColor);
     float B = blue(ourColor); 
     
     pixels[ourPix] = color(R,G,B); 
     
  }
 } // end loop
 updatePixels(); 
} //end draw