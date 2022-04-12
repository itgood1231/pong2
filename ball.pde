class Ball {
  float x = width/4;
  float y = height/2;
  float xsPeed;
  float ysPeed;
  float rad = 12;

  Ball() {
    reset();
  }
  void checkPaddleLeft(Paddle p) {
    if (y - rad < p.y + p.h/2 && y + rad > p.y - p.h/2 && x - rad < p.x + p.w/2) {
      if (x > p.x) {
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xsPeed = 5 * cos(angle);
        ysPeed = 5 * sin(angle);
        x = p.x + p.w/2 + rad;
        //xspeed *= -1;
      }
    }
  }

  void checkPaddleRight(Paddle P) {
    if (y - rad < P.y + P.h/2 && y + rad > P.y - P.h/2 && x + rad > P.x - P.w/2) {
      if (x < P.x) {
        //xsPeed *= -1;
        float diff = y - (P.y - P.h/2);
        float angle = map(diff, 0, P.h, radians(225), radians(135));
        xsPeed = 5 * cos(angle);
        ysPeed = 5 * sin(angle);
        x = P.x - P.w/2 - rad;
      }
    }
  }



  void update() {
    x = x + xsPeed;
    y = y + ysPeed;
  }

  void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    //angle = 0;
    xsPeed = 5 * cos(angle);
    ysPeed = 5 * sin(angle);

    if (random(1) < 0.5) {
      xsPeed *= -1;
    }
  }

 void edges() {
    if (y < 0 || y > height) {
      ysPeed *= -1;
    }

    if (x - rad > width) {

      leftscore++;
     reset();
    }

    if (x + rad < 0) {

      rightscore++;
     reset();
    }
  }

  void show() {
    fill(255);
    ellipse(x, y, rad*2, rad*2);
  }
}
