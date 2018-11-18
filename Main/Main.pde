static int colunas = 10;
static float procentagem = 0.8;

ArrayList<ObjetoIlustrado> shootList;
ArrayList<ObjetoIlustrado> explosoes;
ArrayList<ObjetoIlustrado> asteroides;

ObjetoAnimado ship;
ObjetoIlustrado fundo;
ObjetoIlustrado asteroide;  

PFont fonte;

int xExplosao;
int yExplosao;
int alturaExplosao;
int larguraExplosao;

int vidas;
int pontos;

boolean iniciado;
boolean finalizado;

void setup() 
{
    size(1020, 800);

    textSize(24);

    fonte = createFont("Kenney Blocks.ttf", 24);

    textFont(fonte);

    vidas = 10;
    pontos = 0;

    shootList = new ArrayList();
    asteroides = new ArrayList();
    explosoes = new ArrayList();

    iniciado = false;
    finalizado = false;

    ship = criarObjeto(OBJETO_ANIMADO, 110, 75, width/2, height/2, 0);

    adicionaAnimacao("PLAYERSHIP", "playerShip", 1, ship);
    tocarAudioContinuo("Sci-fi Pulse Loop.wav");

    fundo = criarObjeto(OBJETO_ILUSTRADO, 1020, 800, width/2, height/2, -1);    
    adicionaImagem("back.png", fundo);

    imprime(fundo);
}

void draw()
{
    clear();
    imprime(fundo);

    if(!finalizado)
    {
        if (!iniciado)
        {
            textSize(42);
            textAlign(CENTER, BOTTOM);
            text("CHUVA DE METEOROS\nUM JOGO BEAGLE", width/2, height/2, 1);
            
            textSize(24);
            textAlign(CENTER, BOTTOM);
            text("(PRESSIONE [ENTER] PARA COMEÇAR)", width/2, height/2+100, 1);
        } else
        {
            contaPontos();
            jogo();
        }
    }        
    if(vidas==0)
    {
        finalizado = true;
        clear();
        imprime(fundo);
        
        textSize(42);
        textAlign(CENTER, BOTTOM);
        text("GAME OVER!\nOBRIGADO POR JOGAR!", width/2, height/2, 1);
        textSize(32);
        delay(500);
        text("PONTUAÇÃO: " + pontos, width/2, height/2+100, 1);
    }     
}

void jogo()
{
    rotacionarParaMouse(ship);

    imprime("PLAYERSHIP", ship);
    
    imprimirPontos();
    imprimirVida();

    segueMouse(0.05, ship);

    if (!shootList.isEmpty())
    {
        for (int i = shootList.size() - 1; i >= 0; i--)
        {
            ObjetoIlustrado o = shootList.get(i);
            imprime(o);

            for (int j = 0; j < asteroides.size(); j++)
            {
                if (estaColidindo(o, asteroides.get(j)))
                {
                    tocarAudio("laser9.mp3");

                    shootList.remove(i);

                    explode(asteroides.get(j), true);
                    asteroides.remove(j);
                    
                    pontos += 500;
                }
            }

            o.buscaCoordenada().x += (o.buscaPosicionamento().x - o.buscaCoordenada().x+100) * 0.05;
            o.buscaCoordenada().y += (o.buscaPosicionamento().y - o.buscaCoordenada().y+100) * 0.05;

            if (o.buscaTempo() <= 0)
            {
                shootList.remove(i);
            }
        }
    }

    for (int i = 0; i < asteroides.size(); i++)
    {
        asteroide = asteroides.get(i);

        if (asteroide.buscaY() > 800)
        {
            asteroides.remove(i);
        } else
        {
            move(asteroide, INCREMENTA, LINHA, 3);
            imprime(asteroide);

            if (estaColidindo(ship, asteroide))
            {           
                tocarAudio("spaceTrash4.mp3");

                explode(asteroide, false);

                asteroides.remove(i);
                
                vidas -= 1;
            }
        }
    }

    for (int i = 0; i < colunas; i++)
    {
        if (random(100) <= procentagem)
        {                            
            int tipo = int(random(1, 4));

            if (tipo == 1)
            {
                asteroide = criarObjeto(OBJETO_ILUSTRADO, 98, 98, (98*i)+98, 0, 0);
                adicionaImagem("meteorBrown_big00.png", asteroide);
            } else if (tipo == 2) 
            {
                asteroide = criarObjeto(OBJETO_ILUSTRADO, 43, 43, (98*i)+98, 0, 0);                
                adicionaImagem("meteorBrown_med00.png", asteroide);
            } else
            {
                asteroide = criarObjeto(OBJETO_ILUSTRADO, 18, 18, (98*i)+98, 0, 0);
                adicionaImagem("meteorBrown_tiny00.png", asteroide);
            }
            asteroides.add(asteroide);
        }
    }

    imprimirExplosoes();
}

void explode(Objeto o, boolean positivo)
{
    xExplosao = o.buscaX();
    yExplosao = o.buscaY();
    alturaExplosao = o.buscaAltura();
    larguraExplosao = o.buscaAltura();

    if (positivo)
    {
        thread("explodirPositivoThread");
    } else
    {
        thread("explodirNegativoThread");
    }
}

void explodirPositivoThread()
{
    ObjetoIlustrado explosao = criarObjeto(OBJETO_ILUSTRADO, alturaExplosao, larguraExplosao, xExplosao, yExplosao, 1);

    for (int i = 0; i<3; i++)
    {
        String nomeExplosao = "flash0" + int(random(0, 9)) + ".png";
        adicionaImagem(nomeExplosao, explosao);        
        explosoes.add(explosao);        
        delay(150);
    }
    explosao.defineZ(-2);
    explosoes.remove(explosao);
}

void explodirNegativoThread()
{
    ObjetoIlustrado explosao = criarObjeto(OBJETO_ILUSTRADO, alturaExplosao, larguraExplosao, xExplosao, yExplosao, 1);

    for (int i = 0; i<3; i++)
    {
        String nomeExplosao = "explosion0" + int(random(0, 9)) + ".png";
        adicionaImagem(nomeExplosao, explosao);        
        explosoes.add(explosao);        
        delay(150);
    }
    explosao.defineZ(-2);
    explosoes.remove(explosao);
}

void imprimirExplosoes()
{
    for (int i = 0; i<explosoes.size(); i++)
    {
        imprime(explosoes.get(i));
    }
}

void imprimirPontos()
{
    textSize(24);
    textAlign(LEFT, BOTTOM);
    text("PONTOS: " + pontos, 8, 35, 1);
}

void imprimirVida()
{
    textSize(24);
    textAlign(LEFT, BOTTOM);
    
    if(vidas > 0)
    {
        String porcentagemVida = "";
        for(int i = 1; i<=10; i++)
        {
            if (i <= vidas )
            {
                porcentagemVida += "=";
            }
            else
            {
                porcentagemVida += "-";
            }
        }
        text("VIDA: " + vidas*10 + "% ["+ porcentagemVida +"]", 630, 40, 1);
    }
    
}

void contaPontos()
{
    if(pontos == 0)
    {
        thread("contaPontosPorTempo");
    }
}

void contaPontosPorTempo()
{
    while(!finalizado)
    {
        delay(500);
        pontos+=5;
    }
}

void keyPressed() {

    if (key == ' ') {
        ObjetoIlustrado shoot = criarObjeto(OBJETO_ILUSTRADO, 13, 17, int(ship.buscaCoordenada().x), int(ship.buscaCoordenada().y), 0);
        shoot.defineImagem("laser.png");
        rotacionarParaMouse(shoot);

        shoot.definePosicionamento(new PVector(mouseX, mouseY));
        shoot.defineTempo(5);

        segueMouse(1, shoot);

        shootList.add(shoot);

        tocarAudio("laser7.mp3");
    }

    if (key == ENTER | key == RETURN)
    {
        print("FOI");
        iniciado = true;
    }
}
