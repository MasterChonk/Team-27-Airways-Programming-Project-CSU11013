// Junyi Xia
// Method for drawing both maps
void DrawMaps() {
  lights();
  translate(width/2, height/2);
  rotateY(angleY);
  rotateX(angleX);
  if (dragging) {
    angleY += (mouseX - lastMouseX) * 0.005;
    angleX -= (mouseY - lastMouseY) * 0.005;
    angleX = constrain(angleX, -MAX_ANGLE, MAX_ANGLE);
    angleY = constrain(angleY, -MAX_ANGLE, MAX_ANGLE);
  } else {
    if (angleX != initialAngleX) {
      angleX += (initialAngleX - angleX) * 0.1;
    }
    if (angleY != initialAngleY) {
      angleY += (initialAngleY - angleY) * 0.1;
    }
  }
  lastMouseX = mouseX;
  lastMouseY = mouseY;
}

// Method for when mouse if released on both maps so that they reset 
void mouseReleased() {
  dragging = false;
}
