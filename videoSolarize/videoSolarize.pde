  
import processing.video.*;

Capture cam;
//PImage puppy; 
int R, G, B, A;
int threshold; 

void setup() {
  size(1080, 800);
  //puppy = loadImage("image/puppy.jpg");

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("no video");
    exit();
  } else {
    println("video");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  //image(puppy, 0, 0); 
  image(cam, 0, 0);
  loadPixels();                               // load the pixels array of the window 
 
 threshold = mouseX/10; 
  for (int x= 0; x< width; x++) {                   
    for (int y= 0; y< height; y++) {  
     
      if (red(pixels[x+y*width]) > threshold){
      pixels[x+y*width]= color(255, 0, 0);  
      } // end loop 
      
      if (green(pixels[x+y*width]) > threshold){
      pixels[x+y*width]= color(0, 255, 0);  
      } // end loop 
      
      if (blue(pixels[x+y*width]) > threshold){
      pixels[x+y*width]= color(0, 0, 255);  
      } // end loop 
    }
  }
   ////
   
   for (int x= 0; x< width; x++) {                   
    for (int y= 0; y< height; y++) {  
 
      if (red(pixels[x+y*width]) == 255){ 
      pixels[x+y*width]= color(random(40,255), random(0, 100), 0, .1);  
      } // end loop 
      
      if (green(pixels[x+y*width]) == 255){
      pixels[x+y*width]= color(0, random(10,255), 0, .4);  
      } // end loop 
      
      if (blue(pixels[x+y*width]) == 255){
      pixels[x+y*width]= color(0, 0, random(240, 255), .7);  
      } // end loop 
   
   
  }
 }// //end loop
  updatePixels();   
} //end draw loop


//void getCol(int col){
//    int myColor = col;
//    R = (red(thisPixel));  
//    G
//    B
//}

//void PxPGetPixel(int x, int y, int[] pixelArray, int pixelsWidth) {
//  int thisPixel=pixelArray[x+y*pixelsWidth];     // getting the colors as an int from the pixels[]
//  A = (thisPixel >> 24) & 0xFF;                  // we need to shift and mask to get each component alone
//  R = (thisPixel >> 16) & 0xFF;                  // this is faster than calling red(), green() , blue()
//  G = (thisPixel >> 8) & 0xFF;   
//  B = thisPixel & 0xFF;
//}


////our function for setting color components RGB into the pixels[] , we need to efine the XY of where
//// to set the pixel, the RGB values we want and the pixels[] array we want to use and it's width

//void PxPSetPixel(int x, int y, int r, int g, int b, int a, int[] pixelArray, int pixelsWidth) {
//  a =(a << 24);                       
//  r = r << 16;                       // We are packing all 4 composents into one int
//  g = g << 8;                        // so we need to shift them to their places
//  color argb = a | r | g | b;        // binary "or" operation adds them all into one int
//  pixelArray[x+y*pixelsWidth]= argb;    // finaly we set the int with te colors into the pixels[]
//}