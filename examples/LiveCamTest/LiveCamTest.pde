import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture cam;
OpenCV opencv;

void setup() {
  size(640, 480, P2D);
  cam = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  cam.start();
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  opencv.loadImage(cam);

  image(cam, 0, 0);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    //beginShape();
    //texture(cam);
    //vertex(0, 0, faces[i].x, faces[i].y);
    //vertex(640, 0, faces[i].x+faces[i].width, faces[i].y);
    //vertex(640, 480, faces[i].x+faces[i].width, faces[i].y + faces[i].height);
    //vertex(0, 480, faces[i].x, faces[i].y + faces[i].height );
    //endShape();
  }
}
