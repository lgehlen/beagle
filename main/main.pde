Objeto o1, o2, o3;

boolean keyBool;

void setup() 
{
    keyBool = false;
    blendMode(BLEND);
    noStroke();
    o1 = criarObjeto("scott_DIR_01.png", 108, 140, 10, 60, 0);
    o1.adicionaAnimacao("DIREITA", "scott_DIR_", 8);
    o1.adicionaAnimacao("ESQUERDA", "scott_ESQ_", 8);
    o2 = criarObjeto("mario.png", 50, 50, 80, 80, 1);
    o3 = criarObjeto("mario.png", 50, 50, 100, 50, 4);
    frameRate(10);
}
void draw()
{
    background(166, 255, 0);

    if (!keyPressed)
    {
        o1.imprimeAnimacao("DIREITA");
    } else
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
                o1.imprimeAnimacao("ESQUERDA");
            }
            if (keyCode == RIGHT)
            {
                o1.incrementaX(15);
                o1.imprimeAnimacao("DIREITA");
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

    //o1.imprime();
    o2.imprime();
    //o3.imprime();
    /*teste de colisao*/
    if (estaColidindo(o1, o2))
    {
        text("Não colidiu! ", 30, 200);
    } else
    {
        text("Colidiu! ", 30, 200);
    }
    /*teste de colisao*/
}


void keyReleased()
{
    if (key == ' ')
    {
        o1.decrementaZ(3);
    }
}
