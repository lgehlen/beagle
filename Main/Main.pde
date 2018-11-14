
ObjetoAnimado ship;
ArrayList<ObjetoIlustrado> shootList;
int vidas;
int pontos;

void setup() 
{
  size(1020, 800);
  vidas = 3;
  pontos = 0;
  shootList = new ArrayList();
  ship = criarObjeto(OBJETO_ANIMADO, 110, 75, 25, 70, 0);
  adicionaAnimacao("PLAYERSHIP", "playerShip", 1, ship);
  defineEmDesenvolvimento(true);
  tocarAudioContinuo("shake.wav");
}
void draw()
{
  background(10, 10, 10);

  rotacionarParaMouse(ship);
  imprime("PLAYERSHIP", ship);
  segueMouse(0.05, ship);
  
  if(!shootList.isEmpty())
  for(int i = shootList.size() - 1; i >= 0; i--)
  {
    ObjetoIlustrado o = shootList.get(i);
    imprime(o);
    o.buscaCoordenada().x += (o.buscaPosicionamento().x - o.buscaCoordenada().x+100) * 0.05;
    o.buscaCoordenada().y += (o.buscaPosicionamento().y - o.buscaCoordenada().y+100) * 0.05;
    if(o.buscaTempo() <= 0)
    {
       shootList.remove(i);
    } 
  }

/*
  if (estaColidindo(o1, o2))
  {
    text("Colidiu! ", 30, 200);
  } else
  {
    text("Não colidiu! ", 30, 200);
  }  
  */
}

void keyPressed(){
  if(key == ' '){
    ObjetoIlustrado shoot = criarObjeto(OBJETO_ILUSTRADO, 13, 17, int(ship.buscaCoordenada().x), int(ship.buscaCoordenada().y), 0);
    shoot.defineImagem("laser.png");
    rotacionarParaMouse(shoot);
    shoot.definePosicionamento(new PVector(mouseX,mouseY));
    shoot.defineTempo(20);
    rotacionarParaMouse(shoot);
    shootList.add(shoot);
    tocarAudio("mario.wav");
    pararAudio("shake.wav");
    tocarAudioContinuo("shake.wav");
  } 
}
