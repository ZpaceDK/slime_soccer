class slime {
  PVector x, v;
  float r;
  float eyesize;
  boolean jump, moveLeft, moveRight;

  slime() {
    r = 100;
    x = new PVector(100, 100);
    v = new PVector(0, 0);
    jump = false;
    moveLeft = false;
    moveRight = false;
    
    eyesize = 16;
  }

  void render() {
    noStroke();
    fill(0, 255, 0);
    ellipse(x.x, x.y, 2*r, 2*r);
    fill(255);
    rect(x.x-r, x.y, 2*r, r);
    
    // Eyes:
    fill(250);
    ellipse(x.x+r/1.8, x.y-r/1.6, eyesize*2, eyesize*2);
    fill(10);
    ellipse(x.x+r/1.8, x.y-r/1.6, eyesize, eyesize);
  }

  void update() {
    v.y += g;
    
    if (moveLeft) {
      v.x += -8;
    }
    if (moveRight) {
      v.x += 8;
    }
    if (jump && x.y == height) {
      v.y = -10;
      jump = false;
    }

    x.add(v);

    if ( x.y > height) {
      x.y = height;
      v.y = 0;
    }

    v.x = 0;
  }
}
