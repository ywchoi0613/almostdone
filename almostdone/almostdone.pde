float [] a, b, v;
void setup() {
  size(1000, 800);
  a = new float[6];  //캐릭터들의 x좌표
  b = new float[6];  //캐릭터들의 y좌표
  for (int i=0; i<6; i++) {
    a[i] = random(100, 900);
    b[i] = 160;
  }
  v = new float[6];  //속도 v
  v[0] = 1;
  v[1] = 2;
  v[2] = 2;
  v[3] = 1;
  v[4] = 1;
  v[5] = 2;
}
int count = 0;  //타이머 역할
void draw() {
  background(120);  //배경 회색
  for (int i=0; i<6; i++) {
    if(count<400){  //1라운드: 쿠마몬 2개
      fill(0);
      choi(mouseX,500);  //bar
      b[0] += v[0];
      b[1] += v[1];
      kumamon(a[0], b[0]);
      kumamon(a[1], b[1]);
      if (b[i]<100) v[i] = -v[i];  //캐릭터가 윗천장에 닿았을 때 방향을 바꾸도록
      }
        else if (count>=400 && count<800) {  //2라운드: 쿠마몬 2개 + 심슨 2개
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
          else if (count>=800 && count<1200) {  //3라운드: 쿠마몬2개 + 심슨 2개 + 호빵맨 2개
          fill(0);
          choi(mouseX,500);
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
            else if (count>=1200){  //4라운드: 바 가로 길이가 500에서 300으로
              fill(255);  //바 길이가 바뀌었다는 것을 알리기 위해 색깔 흰색으로 바꿈
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
  collide();     //캐릭터가 바에 튕기도록
  count++;
}
void collide() {
  for (int i=0; i<6; i++) {
    if (sqrt((mouseX-a[i])*(mouseX-a[i]))<=300 && b[i] > float(620)) v[i] = -v[i];  //바의 x,y좌표와 캐릭터 x,y좌표 조건에 따라 튕기도록 설정
    else if (sqrt((mouseX-a[i])*(mouseX-a[i]))>300 && b[i] > float(720)){  //바와 캐릭터가 만나지 않을 경우
      fill(250);
      textSize(90);
      text(int(count)+"points",40,120);  //점수 표시
      stop();  //게임 오버
    }
    //d=5일 때, 720
  }
}
