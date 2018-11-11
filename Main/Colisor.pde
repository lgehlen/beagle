private final int SQUARE = 4;

class Colisor
{
  
   private int numSides;
  
   private float angle;

   PVector[] vecs, pontosColisao;

   float minProj;

   float maxProj;

   float[] x, y;
   
   Colisor(PVector coordenada, PVector tamanho)
   {
    numSides = SQUARE;
     
    x = new float[numSides];
    y = new float[numSides];

    vecs = new PVector[numSides];
    pontosColisao = new PVector[numSides];

    for (int i = 0; i < vecs.length; i++) {
      vecs[i] = new PVector();
      pontosColisao[i] = new PVector();
    }

    definePontos(coordenada, tamanho);
   }
   
   public void imprime()
   {
    stroke(color(255,20,203));
    noFill();
    beginShape();
      for (int i = 0; i < x.length; i++) {
        vertex(x[i], y[i]);
      }
    endShape(CLOSE);
   }
   
   
   public float buscaAngulo()
   {
    return this.angle;
   }

   public void defineAngulo(float angulo)
   {
    this.angle = angulo;
   }
   
   void defineMinMax(PVector axis) {
      minProj = vecs[0].dot(axis);
      maxProj = minProj;
      for (int i = 1; i < vecs.length; i++) {
        float currentProj = vecs[i].dot(axis);
        if (currentProj < minProj) {
          minProj = currentProj;
        }
        if (currentProj > maxProj) {
          maxProj = currentProj;
        }
      }
    }
  
    public void atualizaVecs()
    {
      for (int i = 0; i < x.length; i++) {
        vecs[i].x = x[i];
        vecs[i].y = y[i];
      }
    }
    
    public boolean verificaSeSeparado(Colisor s1, Colisor s2, boolean isSeparated) {
        for (int i = 0; i < s1.numSides; i++) {
          s1.defineMinMax(s1.pontosColisao[i]);
          s2.defineMinMax(s1.pontosColisao[i]);
          isSeparated = s2.maxProj < s1.minProj || s1.maxProj < s2.minProj;
          if (isSeparated) {
            return true;
          }
        }
        for (int i = 0; i < s2.numSides; i++) {
          s1.defineMinMax(s2.pontosColisao[i]);
          s2.defineMinMax(s2.pontosColisao[i]);
          isSeparated = s2.maxProj < s1.minProj || s1.maxProj < s2.minProj;
          if (isSeparated) {
            return true;
          }
        }
      return false;
      }
    
    public void definePontos(PVector coordenada, PVector tamanho) {
      for (int i = 0; i < x.length; i++) {
        float currentAngle = i * TWO_PI / numSides;
        x[i] = coordenada.x+tamanho.x/2*cos(currentAngle + PI/numSides + angle);
        y[i] = coordenada.y+tamanho.y/1.5*sin(currentAngle + PI/numSides + angle);
      }
    
      for (int i = 0; i < x.length-1; i++) {
        pontosColisao[i+1] = new PVector(-y[i+1] + y[i], x[i+1] - x[i]);
      }
    }
    
    boolean verificaChao(PVector coordenada, PVector tamanho) {
      if (coordenada.y > height - tamanho.y/2) {
        coordenada.y = height - tamanho.y/2;
        return true;
      } else if(coordenada.y < tamanho.y/2){
        coordenada.y = tamanho.y/2;
        return true;
      }
      return false;
   }
   
   boolean verificaParede(PVector coordenada, PVector tamanho) {
       if (coordenada.x > width - tamanho.x/2) {
        coordenada.x = width - tamanho.x/2;
        return true;
      } else if(coordenada.x < tamanho.x/2){
         coordenada.x = tamanho.x/2;
         return true;
      }
      return false;
   }
}
