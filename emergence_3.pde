float xstart, xnoise, ystart, ynoise;
float xstartNoise, ystartNoise;
float rad = 150;
float lineLength = -200;
String radCheck="more";
String lineCheck="more";

void setup() {
  size(displayWidth, displayHeight, P3D);
  smooth();
  background(255);
  frameRate(10);

  xstartNoise = random(20);
  ystartNoise = random(20);
  xstart = random(10);
  ystart = random(10);
}

void draw () {
  background(255);
  if (rad<3000&&radCheck=="more") {
    rad+=17;
  } else {
    rad-=17;
    if (rad>2000) {
      radCheck="less";
    } else {
      radCheck="more";
    }
  }

  if (lineLength<500&&lineCheck=="more") {
    lineLength+=1;
  } else {
    lineLength-=1;
    if (lineLength>-100) {
      lineCheck="less";
    } else {
      lineCheck="more";
    }
  }

  println("rad:\t", + rad);
  println("lineLength:", + lineLength);

  xstartNoise+=0.1;
  ystartNoise+=0.1;
  xstart+=(noise(xstartNoise)*0.8);
  ystart+=(noise(ystartNoise)*0.1)-0.5;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.01;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=7) {
      xnoise += 0.01;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(rad));
  stroke(0, 88);
  line(0, 0, lineLength, 0);
  popMatrix();
}
