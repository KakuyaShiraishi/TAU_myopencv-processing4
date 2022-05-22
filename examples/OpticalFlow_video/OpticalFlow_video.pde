import gab.opencv.*;
import processing.video.*;
import java.util.Vector;

OpenCV opencv;
//Movie video;
Capture video;
PGraphics2D pg_cam;

void setup() {
  size(1280, 480, P2D);
  frameRate(60);
  //  video = new Movie(this, "sample1.mov");
  //  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 320, 240);
  video = new Capture(this, 320, 240);
  video.start();
  //  video.loop();
  //  video.play();
  pg_cam = (PGraphics2D) createGraphics(320, 240, P2D);
  pg_cam.noSmooth();
}

void draw() {
  if (video.available() == true) {
    video.read();
    pg_cam.beginDraw();
    pg_cam.image(video, 0, 0);
    pg_cam.endDraw();
  }
  background(0);
  opencv.loadImage(pg_cam);
  opencv.calculateOpticalFlow();
  scale(2);
  image(video, 0, 0);
  translate(video.width, 0);
  stroke(255, 200, 0);
  strokeWeight(0.5);
  opencv.drawOpticalFlow();

  PVector aveFlow = opencv.getAverageFlow();
  int flowScale = 20;

  stroke(255);
  strokeWeight(2);
  line(video.width/2, video.height/2, video.width/2 + aveFlow.x*flowScale, video.height/2 + aveFlow.y*flowScale);
}

class Particle {
  
}
