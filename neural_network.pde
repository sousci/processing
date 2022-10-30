import controlP5.*;
import java.util.*;

ControlP5 cp5;

int layer_N = 1; // 入力層・出力層以外のレイヤー数（隠れ層の数）を決める。0以上の数にする
int[] num_of_neuron = {3, 3, 2}; // 入力層・隠れ層・出力層のニューロンの数を設定する。配列の最初が入力層，最後が出力層とし，隠れ層の数に応じて配列の要素数を変更する。

int a, b, c;

List<String> testList = new ArrayList<String>();

int wid = 1200;
int hei = 900;

void setup() {
  println(num_of_neuron[0]);
  size(1200, 900);
  cp5 = new ControlP5(this); // コントローラを生成
  cp5.addSlider("a") // aの値を動かすスライダー
    .setPosition(20, 20)
    .setSize(300, 50)
    .setRange(1, 12)
    .setNumberOfTickMarks(12)
    .setValue(2)
    .setColorCaptionLabel(0)
    ;
  cp5.addSlider("b") // bの値を動かすスライダー
    .setPosition(370, 20)
    .setSize(300, 50)
    .setRange(1, 12)
    .setNumberOfTickMarks(12)
    .setValue(3)
    .setColorCaptionLabel(0)
    ;
  cp5.addSlider("c") // cの値を動かすスライダー
    .setPosition(720, 20)
    .setSize(300, 50)
    .setRange(1, 5)
    .setNumberOfTickMarks(5)
    .setValue(2)
    .setColorCaptionLabel(0)
    ;

}

void draw() {
  background(255);
  num_of_neuron[0] = a;
  num_of_neuron[1] = b;
  num_of_neuron[2] = c;
  //arrow(100, 200, 1000, 200, 0, 0, 0, 3); // x軸の矢印
  //arrow(200, 100, 200, 800, 0, 0, 0, 3); // y軸の矢印

  //100pixel line
  for (int i = 0; i <= max(wid, hei); i+=100) {
    strokeWeight(1);
    stroke(200);

    line(0, i, wid, i); //横線
    line(i, 0, i, hei); //縦線
  }

  for (int i = 0; i < (layer_N + 2); i++) {
    for (int j = 0; j < num_of_neuron[i]; j++) {
      stroke(0);
      strokeWeight(2); // 黒,2pt
      ellipse((wid/((layer_N+2)*2))+i*(wid/(layer_N+2)), (hei/(num_of_neuron[i]*2))+j*(hei/num_of_neuron[i]), 400/max(num_of_neuron), 400/max(num_of_neuron));
    }
  }
}


// 矢印用関数
void arrow(int x1, int y1, int x2, int y2, int Color1, int Color2, int Color3, int lineWidth) {
  int arrowLength = 10;
  float arrowAngle = 0.5;
  float angle = atan2(y2-y1, x2-x1);
  stroke(Color1, Color2, Color3);
  strokeWeight(lineWidth);
  line(x1, y1, x2, y2);
  pushMatrix();
  translate(x2, y2);
  rotate(angle);
  line(0, 0, -arrowLength*cos(arrowAngle), arrowLength*sin(arrowAngle));
  line(0, 0, -arrowLength*cos(arrowAngle), -arrowLength*sin(arrowAngle));
  popMatrix();
}
