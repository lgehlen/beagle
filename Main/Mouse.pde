class Mouse
{
  public PVector seguirMouse(PVector coordenada, float velocidade)
  {
    float targetX = mouseX;
    float targetY = mouseY;
    if (mousePressed) {
      if (targetX > coordenada.x && coordenada.x < width - 12 || targetX < coordenada.x && coordenada.x > 12) {
        coordenada.x += (targetX - coordenada.x) * velocidade;
      }
      if (targetY < coordenada.y && coordenada.y > 12 || targetY > coordenada.y && coordenada.y < height - 12) {
        coordenada.y += (targetY - coordenada.y) * velocidade;
      }
    }
    return coordenada;
  } 
    
  float rotacionarParaMouse(PVector coordenada, float angulo) {
    angulo = atan2(coordenada.x-mouseX, coordenada.y-mouseY);
    return -angulo;
  }
}
