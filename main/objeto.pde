
class Objeto
{
    private int id;

    private PImage imagem;

    private PVector tamanho;

    private PVector coordenada;

    private ArrayList<Animacao> animacoes;
    
    private Collider caixaDeColisao;
    
    private float angulo;

    Objeto (int id, String imagemURL, int alturaObjeto, int larguraObjeto)
    {
        defineId(id);
        iniciaPVectors();
        defineImagem(imagemURL);
        defineTamanho(alturaObjeto, larguraObjeto);
        animacoes = new ArrayList<Animacao>();
    }

    Objeto (int id, String imagemURL, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
    {
        this(id, imagemURL, alturaObjeto, larguraObjeto);
        defineCoordenada(coordenadaX, coordenadaY);
        defineCaixaDeColisao();
    }

    Objeto (int id, String imagemURL, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
    {
        this(id, imagemURL, alturaObjeto, larguraObjeto);
        defineCoordenada(coordenadaX, coordenadaY, coordenadaZ);
        defineCaixaDeColisao();
    }

    protected void iniciaPVectors()
    {
        defineTamanho(new PVector());
        defineCoordenada(new PVector());
    }

    public void imprime()
    {
        hint(ENABLE_DEPTH_SORT);
        pushMatrix();
        //Ainda a fazer controle de uso do collider
        this.caixaDeColisao.atualizaVecs();
        this.caixaDeColisao.imprime();
        translate(this.coordenada.x, this.coordenada.y, this.coordenada.z);
        rotate(this.angulo);
        imageMode(CENTER);
        image(this.imagem, 0, 0, this.tamanho.y, this.tamanho.x);
        popMatrix();
    }

    public void imprimeAnimacao(String idAnimacao)
    {
        hint(ENABLE_DEPTH_SORT);
        pushMatrix();
        //Ainda a fazer controle de uso do collider
        this.caixaDeColisao.atualizaVecs();
        this.caixaDeColisao.imprime();
        translate(this.coordenada.x, this.coordenada.y, this.coordenada.z);
        rotate(this.angulo);
        imageMode(CENTER);
        this.animacoes.get(buscaIndiceAnimacaoPorId(idAnimacao)).display(0, 0);
        popMatrix();
    }

    public void adicionaAnimacao(String idAnimacao, String prefixoImgem, int quantidadeSprites)
    {
        animacoes.add(new Animacao(idAnimacao, prefixoImgem, quantidadeSprites));
    }

    public void adicionaAnimacao(String idAnimacao, String prefixoImgem, int quantidadeSprites, String extensao)
    {
        animacoes.add(new Animacao(idAnimacao, prefixoImgem, quantidadeSprites, extensao));
    }

    public int buscaIndiceAnimacaoPorId(String idAnimacao)
    {
        int contAnimacao = 0;

        for (Animacao a : animacoes)
        {
            if (!a.getId().equals(idAnimacao))
                contAnimacao++;
            else
                return contAnimacao;
        }

        return 0;
    }

    // MOVIMENTO ======================================================================
    
    // Função temporaria para teste de colisao - ainda por fazer getters e setters do angulo
    void gira()
    {
      this.angulo += .1;
      this.caixaDeColisao.defineAngulo(this.angulo);
      this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void incrementaX()
    {
        this.coordenada.x += 1;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void incrementaX(int n)
    {
        this.coordenada.x += n;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void incrementaY()
    {
        this.coordenada.y += 1;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void incrementaY(int n)
    {
        this.coordenada.y += n;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void incrementaZ()
    {
        this.coordenada.z += 1;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void incrementaZ(int n)
    {
        this.coordenada.z += n;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void decrementaX()
    {
        this.coordenada.x -= 1;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void decrementaX(int n)
    {
        this.coordenada.x -= n;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void decrementaY()
    {
        this.coordenada.y -= 1;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void decrementaY(int n)
    {
        this.coordenada.y -= n;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void decrementaZ()
    {
        this.coordenada.z -= 1;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }

    void decrementaZ(int n)
    {
        this.coordenada.z -= n;
        this.caixaDeColisao.setPoints(this.coordenada, this.tamanho);
    }    

    // GETTER'S AND SETTER'S ==========================================================

    public int buscaId()
    {
        return this.id;
    }

    public void defineId(int id)
    {
        this.id = id;
    }	

    public PImage buscaImagem()
    {
        return this.imagem;
    }

    public void defineImagem(String imagemURL)
    {
        this.imagem = loadImage(imagemURL);
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
    
    public void defineCaixaDeColisao()
    {
      this.caixaDeColisao = new Collider(this.coordenada, this.tamanho);
      this.angulo = this.caixaDeColisao.buscaAngulo();
    } 
}
