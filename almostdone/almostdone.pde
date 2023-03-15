float [] a, b, v;
void setup() {
  size(1000, 800);
  a = new float[6];
  b = new float[6];
  for (int i=0; i<6; i++) {
    a[i] = random(100, 900);
    b[i] = 160;
  }
  v = new float[6];
  v[0] = 1;
  v[1] = 2;
  v[2] = 2;
  v[3] = 1;
  v[4] = 1;
  v[5] = 2;
}
int count = 0;
void draw() {
  background(120);
  for (int i=0; i<6; i++) {
    if(count<400){
      fill(0);
      choi(mouseX,500);  // suh
      b[0] += v[0];
      b[1] += v[1];
      kumamon(a[0], b[0]);
      kumamon(a[1], b[1]);
      if (b[i]<100) v[i] = -v[i];  
      // if (b[i]< 0) v[i] = -v[i];  // suh
      }
        else if (count>=400 && count<800) {
        fill(0);
        choi(mouseX,500);  // suh
        b[0] += v[0];
        b[1] += v[1];
        b[2] += v[2];
        b[3] += v[3];
        kumamon(a[0], b[0]);
        kumamon(a[1], b[1]);
        simson(2, a[2], b[2]);
        simson(2, a[3], b[3]);
        if (b[i]<100) v[i] = -v[i]; 
        }
          else if (count>=800 && count<1200) {
          fill(0);
          choi(mouseX,500);  // suh
          b[0] += v[0];
          b[1] += v[1];
          b[2] += v[2];
          b[3] += v[3];
          b[4] += v[4];
          b[5] += v[5];
          kumamon(a[0], b[0]);
          kumamon(a[1], b[1]);
          simson(2, a[2], b[2]);
          simson(2, a[3], b[3]);
          hobbang(a[4], b[4], 45);
          hobbang(a[5], b[5], 45);
          if (b[i]<100) v[i] = -v[i]; 
          }
            else if (count>=1200){
              fill(0);
              choi(mouseX,300);
              b[0] += v[0];
              b[1] += v[1];
              b[2] += v[2];
              b[3] += v[3];
              b[4] += v[4];
              b[5] += v[5];
              kumamon(a[0], b[0]);
              kumamon(a[1], b[1]);
              simson(2, a[2], b[2]);
              simson(2, a[3], b[3]);
              hobbang(a[4], b[4], 45);
              hobbang(a[5], b[5], 45);
              if (b[i]<100) v[i] = -v[i]; 
            }
  }
  collide();     // suh
  count++;
}
void collide() {
  for (int i=0; i<6; i++) {
    if (sqrt((mouseX-a[i])*(mouseX-a[i]))<=300 && b[i] > float(620)) v[i] = -v[i];
    else if (sqrt((mouseX-a[i])*(mouseX-a[i]))>300 && b[i] > float(720)){
      fill(250);
      textSize(90);
      text(int(count)+"points",40,120);
      stop();   
    }
    //d=5일 때, 720
  }
}
