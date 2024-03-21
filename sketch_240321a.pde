PImage img; // 用于存储地图图片
float angleX = 0;
float angleY = 0;
float lastMouseX;
float lastMouseY;
boolean dragging = false;

void setup() {
  size(640, 360, P3D); // 设置窗口大小和使用3D渲染
  img = loadImage("usa.greyed.png"); // 加载你的美国地图图片
}

void draw() {
  background(255); // 设置背景色
  if (dragging) {
    // 更新旋转角度基于鼠标当前位置与上一个位置的差
    angleY += (mouseX - lastMouseX) * 0.0005;
    angleX += (mouseY - lastMouseY) * 0.001;
  }
  
  
  translate(width / 2, height / 2); // 移动坐标原点到窗口中心
  rotateX(angleX); // 绕X轴旋转
  rotateY(angleY); // 绕Y轴旋转
  

  int depth = 50; 
  for (int z = 0; z <= depth; z += 1) { // 通过在不同的Z深度绘制图片来创建立体效果
    pushMatrix(); // 保存当前的变换矩阵
    translate(0, 0, z - depth / 2); // 在Z轴上移动图片，以创建立体效果
    imageMode(CENTER); // 设置图片绘制模式，使其基于中心点绘制
    image(img, 0, 0); // 绘制图片
    popMatrix(); // 恢复之前保存的变换矩阵
  }
  
  lastMouseX = mouseX;
  lastMouseY = mouseY;
}
void mousePressed() {
  // 当鼠标被按下时，启动拖动状态
  dragging = true;
}

void mouseReleased() {
  // 当鼠标释放时，停止拖动状态
  dragging = false;
}
