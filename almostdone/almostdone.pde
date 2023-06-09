float [] a, b, v;
import processing.sound.*;
SoundFile file;
SoundFile file2;
SoundFile file3;
void setup() {
  size(1000, 800);
  a = new float[6];  //캐릭터들의 x좌표
  b = new float[6];  //캐릭터들의 y좌표
  a[0] = 250;
  a[1] = 750;  //처음 등장하는 쿠마몬 2개의 위치를 최대한 벌리기 위해 x좌표를 직접 설정
  for (int i=2; i<6; i++) {  //나머지 x좌표 무작위 선정
    a[i] = random(100, 900);
  }
  for (int i=0; i<6; i++) {  //y좌표는 160으로 고정
    b[i] = 160;
  }
  v = new float[6];  //속도 v
  for ( int i=0; i<6; i++) {
    if(i%2==0) v[i] = 1;  //i가 짝수일 때 v=1
    else v[i] = 2;  //i가 홀수일 때 v=2
  file = new SoundFile(this,"background5min.mp3");
  file.play();
  }
}
int count = 0;  //시간이 지날수록 count가 커짐->타이머 역할
void draw() {
  background(120);  //배경 회색
  for (int i=0; i<6; i++) {
    fill(250);  //흰색
    textSize(40);  //글자크기
    text("Point: "+int(count),800,100);  //실시간 점수 표시
    if(count<400){  //1라운드: 쿠마몬 2개
      fill(0);  //검정
      textSize(40);  //글자크기
      text("Round 1",800,50);  //라운드 표시
      fill(0);  //검정색
      choi(mouseX,500);  //bar
      b[0] += v[0];
      b[1] += v[1];
      kumamon(a[0], b[0]);
      kumamon(a[1], b[1]);
      if (b[i]<100) v[i] = -v[i];  //캐릭터가 윗천장에 닿았을 때 방향을 바꾸도록
      collide();
      }
        else if (count>=400 && count<800) {  //2라운드: 쿠마몬 2개 + 심슨 2개
        fill(0);  //검정
        textSize(40);  //글자크기
        text("Round 2",800,50);  //라운드 표시
        fill(0);
        choi(mouseX,500);
        b[0] += v[0];
        b[1] += v[1];
        b[2] += v[2];
        b[3] += v[3];
        kumamon(a[0], b[0]);
        kumamon(a[1], b[1]);
        simson(2, a[2], b[2]);
        simson(2, a[3], b[3]);
        if (b[i]<100) v[i] = -v[i];
        collide();
        }
          else if (count>=800 && count<1200) {  //3라운드: 쿠마몬2개 + 심슨 2개 + 호빵맨 2개
          fill(0);  //검정
          textSize(40);  //글자크기
          text("Round 3",800,50);  //라운드 표시
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
          collide();
          }
            else if (count>=1200){  //4라운드: 바 가로 길이가 500에서 300으로
            fill(0);  //검정
            textSize(40);  //글자크기
            text("Round 4",800,50);  //라운드 표시
            fill(255);  //바 길이가 바뀌었다는 것을 알리기 위해 색깔 흰색으로 바꿈
            choi(mouseX,300);  //500->300
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
            collide2();
            }
  }
  count++;
}
void collide() {
  for (int i=0; i<6; i++) {
    if (sqrt((mouseX-a[i])*(mouseX-a[i]))<=300 && b[i] > float(620)) {
      v[i] = -v[i];  //바의 x,y좌표와 캐릭터 x,y좌표 조건에 따라 튕기도록 설정
      file3 = new SoundFile(this,"bounce.wav");
      file3.play();
    }
    else if (sqrt((mouseX-a[i])*(mouseX-a[i]))>300 && b[i] > float(730)){  //바와 캐릭터가 만나지 않을 경우
      fill(0,200,200);
      textSize(90);
      text("Result: "+int(count)+"points",40,100);  //최종 점수 표시
      stop();  //게임 오버
      file2 = new SoundFile(this,"gameover.wav");
      file2.play();
    }
    //d=5일 때, 730
  }
}
void collide2() {
  for (int i=0; i<6; i++) {
    if (sqrt((mouseX-a[i])*(mouseX-a[i]))<=150 && b[i] > float(620)) {
      v[i] = -v[i];  //바의 x,y좌표와 캐릭터 x,y좌표 조건에 따라 튕기도록 설정
      file3 = new SoundFile(this,"bounce.wav");
      file3.play();
    }
    else if (sqrt((mouseX-a[i])*(mouseX-a[i]))>150 && b[i] > float(730)){  //바와 캐릭터가 만나지 않을 경우
      fill(0,200,200);
      textSize(90);
      text("Result: "+int(count)+"points",40,100);  //최종 점수 표시
      stop();  //게임 오버
      file2 = new SoundFile(this,"gameover.wav");
      file2.play();
      }
    //d=5일 때, 730
    }
  }
