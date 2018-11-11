class Objeto
{
    private int id;

    private PVector tamanho;

    private PVector coordenada;
    
    private float angulo;    

    private Colisor caixaDeColisao;

    private boolean desenvolvimento;

    private boolean colisao;
    
    private CorpoRigido corpoRigido;
    
    private Mouse mouse;
    
    private PVector posicionamento;
    
    private float tempo;
   
    Objeto (int id, int alturaObjeto, int larguraObjeto)
    {
        defineId(id);
        iniciaPVectors();
        defineTamanho(alturaObjeto, larguraObjeto);
        defineCoordenada(0, 0);
        defineTemColisao(true);
        defineCaixaDeColisao();
        defineCorpoRigido();
        defineMouse();
    }

    Objeto (int id, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
    {
        this(id, alturaObjeto, larguraObjeto);
        defineCoordenada(coordenadaX, coordenadaY);
        this.caixaDeColisao.atualizaVecs();
        defineCaixaDeColisao();
    }

    Objeto (int id, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
    {
        this(id, alturaObjeto, larguraObjeto);
        defineCoordenada(coordenadaX, coordenadaY, coordenadaZ);
        this.caixaDeColisao.atualizaVecs();
        defineCaixaDeColisao();
    }

    public void iniciaPVectors()
    {
        defineTamanho(new PVector());
        defineCoordenada(new PVector());
    }

    public void imprime()
    {
        this.tempo -= 1;
        println(tempo);
        hint(ENABLE_DEPTH_SORT);
        pushMatrix();
            defineImpressao();
        popMatrix();
    }

    public void defineImpressao()
    {
        colisaoImpressao();
        reacaoFisica();
        translate(this.coordenada.x, this.coordenada.y, this.coordenada.z);
        rotate(this.angulo);
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    public void colisaoImpressao()
    {
        if(this.colisao)
        {
            this.caixaDeColisao.atualizaVecs();

            if(this.desenvolvimento)
            {
                this.caixaDeColisao.imprime();
            }
        }
    }
    
    public void reacaoFisica()
    {
      if(this.corpoRigido.buscaAtivo())
      {
        corpoRigido.aplicarGravidade();
        
        if(corpoRigido.buscaForcaAtiva())
          corpoRigido.aplicarProjetil();
        
        coordenada.add(corpoRigido.atualizar());
      }
    }
    
    public void segueMouse(float velocidade)
    {
      defineCoordenada(this.buscaMouse().seguirMouse(this.buscaCoordenada(), velocidade));
    }

    public void rotacionarParaMouse()
    {
      this.angulo = this.buscaMouse().rotacionarParaMouse(this.buscaCoordenada(), this.angulo);
      this.caixaDeColisao.defineAngulo(this.angulo);
    }

    // MOVIMENTO ======================================================================
    
    // Função temporaria para teste de colisao - ainda por fazer getters e setters do angulo
    void gira()
    {
      this.angulo += .1;
      this.caixaDeColisao.defineAngulo(this.angulo);
      this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void incrementaX()
    {
        this.coordenada.x += 1;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void incrementaX(int n)
    {
        this.coordenada.x += n;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void incrementaY()
    {
        this.coordenada.y += 1;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void incrementaY(int n)
    {
        this.coordenada.y += n;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void incrementaZ()
    {
        this.coordenada.z += 1;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void incrementaZ(int n)
    {
        this.coordenada.z += n;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void decrementaX()
    {
        this.coordenada.x -= 1;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void decrementaX(int n)
    {
        this.coordenada.x -= n;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void decrementaY()
    {
        this.coordenada.y -= 1;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void decrementaY(int n)
    {
        this.coordenada.y -= n;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void decrementaZ()
    {
        this.coordenada.z -= 1;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }

    void decrementaZ(int n)
    {
        this.coordenada.z -= n;
        this.caixaDeColisao.definePontos(this.coordenada, this.tamanho);
    }    

    // GETTER'S AND SETTER'S ==========================================================
    
    public Mouse buscaMouse()
    {
        return this.mouse;
    }

    public void defineMouse(Mouse mouse)
    {
        this.mouse = mouse;
    }  

    public int buscaId()
    {
        return this.id;
    }

    public void defineId(int id)
    {
        this.id = id;
    }	
    
    public CorpoRigido buscaCorpoRigido()
    {
        return this.corpoRigido;
    }

    public void defineCorpoRigido(CorpoRigido corpoRigido)
    {
        this.corpoRigido = corpoRigido;
    }  

    public PVector buscaTamanho()
    {
        return this.tamanho;
    }

    public void defineTamanho(PVector tamanho)
    {
        this.tamanho = tamanho;
    }

    public void defineTamanho(int alturaObjeto, int larguraObjeto)
    {
        defineLargura(larguraObjeto);
        defineAltura(alturaObjeto);
    }

    public int buscaLargura()
    {
        return int(this.tamanho.x);
    }

    public void defineLargura(int largura)
    {
        this.tamanho.x = largura;
    }

    public int buscaAltura()
    {
        return int(this.tamanho.y);
    }

    public void defineAltura(int altura)
    {
        this.tamanho.y = altura;
    }

    public PVector buscaCoordenada()
    {
        return this.coordenada;
    }

    public void defineCoordenada(PVector coordenada)
    {
        this.coordenada = coordenada;
    }
    
    public PVector buscaPosicionamento()
    {
        return this.posicionamento;
    }

    public void definePosicionamento(PVector posicionamento)
    {
        this.posicionamento = posicionamento;
    }

    public void defineCoordenada(int x, int y)
    {
        defineX(x);
        defineY(y);
    }

    public void defineCoordenada(int x, int y, int z)
    {
        defineX(x);
        defineY(y);
        defineZ(z);
    }

    public int buscaX()
    {
        return int(this.coordenada.x);
    }

    public void defineX(int x)
    {
        this.coordenada.x = x;
    }

    public int buscaY()
    {
        return int(this.coordenada.y);
    }

    public void defineY(int y)
    {
        this.coordenada.y = y;
    }

    public int buscaZ()
    {
        return int(this.coordenada.z);
    }

    public void defineZ(int z)
    {
        this.coordenada.z = z;
    }
    
    public float buscaTempo()
    {
        return int(this.tempo);
    }

    public void defineTempo(float tempo)
    {
        this.tempo = tempo;
    }
   
    
    public void defineCaixaDeColisao()
    {
        this.caixaDeColisao = new Colisor(this.coordenada, this.tamanho);
        this.angulo = this.caixaDeColisao.buscaAngulo();
    } 

    public void defineEmDesenvolvimento(boolean desenvolvimento)
    {
        this.desenvolvimento = desenvolvimento;
    }

    public boolean emDesenvolvimento()
    {
        return this.desenvolvimento;
    }

    public void defineTemColisao(boolean colisao)
    {
        this.colisao = colisao;
    }

    public boolean temColisao()
    {
        return this.colisao;
    }
    
    public void defineCorpoRigido()
    {
      this.corpoRigido = new CorpoRigido();
    }
    
    public void defineMouse()
    {
      this.mouse = new Mouse();
    }
    
    public boolean verificaChao()
    {
      return this.caixaDeColisao.verificaChao(this.coordenada,this.tamanho);
    }
}
