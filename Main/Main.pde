ObjetoAnimado o1;
ObjetoIlustrado o2;

boolean keyBool;

void setup() 
{
    keyBool = false;
    blendMode(BLEND);
    noStroke();

    o1 = criarObjeto(OBJETO_ANIMADO, 67, 75, 20, 60, 0);
    o1.adicionaAnimacao("DIREITA", "platformCharWalk_DIR_", 2);
    o1.adicionaAnimacao("ESQUERDA", "platformCharWalk_ESQ_", 2);
    o1.adicionaAnimacao("IDLE", "platformChar_IDLE_", 1);
    
    o2 = criarObjeto(OBJETO_ILUSTRADO, 67, 67, 80, 80, 1);
    o2.defineImagem("platformChar_IDLE_00.png");
    o2.buscaCorpoRigido().defineAtivo(true);

    frameRate(10);
    defineEmDesenvolvimento(true);
    //tocarAudioContinuo("shake.wav");
}
void draw()
{
    background(127, 199, 229);

    if (!keyPressed)
    {
        o1.imprime("IDLE");
    } 
    else
    {
        if (key == CODED)
        {
            if (keyCode == UP)
            {
                o1.decrementaY(15);
            }
            if (keyCode == DOWN)
            {
                o1.incrementaY(15);
            }
            if (keyCode == LEFT)
            {
                o1.decrementaX(15);
                o1.imprime("ESQUERDA");
            }
            if (keyCode == RIGHT)
            {
                o1.incrementaX(15);
                o1.imprime("DIREITA");
            }
            if (keyCode == SHIFT)
            {
                o1.incrementaZ(15);
            }
            if (keyCode == CONTROL)
            {
                o1.gira();
            }
        }
    }

    o1.imprime();
    o2.imprime();

    if (estaColidindo(o1, o2))
    {
        text("Não colidiu! ", 30, 200);
    } else
    {
        text("Colidiu! ", 30, 200);
        tocarAudio("mario.wav");
    }
    
    if(o2.verificaBordas())
    {
      o2.buscaCorpoRigido().buscaVelocidade().y *= -1; 
    }

}


void keyReleased()
{
    if (key == ' ')
    {
        o1.decrementaZ(3);
    }
}
