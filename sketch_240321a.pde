PImage img; // 用于存储地图图片
float angleX, angleY; // 当前旋转角度
float initialAngleX = PI/3; // 初始倾斜角度X，约10度
float initialAngleY = 0; // 初始倾斜角度Y，约10度
float lastMouseX, lastMouseY;
boolean dragging = false;
final float MAX_ANGLE = PI / 4; // 最大旋转角度，PI / 4等于45度

void setup() {
  size(640, 360, P3D); // 设置窗口大小和使用3D渲染
  img = loadImage("usa.greyed.png"); // 加载你的美国地图图片
  angleX = initialAngleX;
  angleY = initialAngleY;
}

void draw() {
  background(255); // 设置背景色
  if (dragging) {
    // 更新旋转角度基于鼠标当前位置与上一个位置的差
    angleY += (mouseX - lastMouseX) * 0.005;
    angleX += (mouseY - lastMouseY) * 0.005;
    // 限制旋转角度在-45到45度之间
    angleX = constrain(angleX, -MAX_ANGLE, MAX_ANGLE);
    angleY = constrain(angleY, -MAX_ANGLE, MAX_ANGLE);
  }  else {
    // 当不拖动时，慢慢回到初始倾斜角度
    if (angleX != initialAngleX) {
      angleX += (initialAngleX - angleX) * 0.1;
    }
    if (angleY != initialAngleY) {
      angleY += (initialAngleY - angleY) * 0.1;
    }
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
