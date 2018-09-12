class ObjetoAnimado extends Objeto
{
    private ArrayList<Animacao> animacoes;

    ObjetoAnimado (int id, int alturaObjeto, int larguraObjeto)
    {
        super(id, alturaObjeto, larguraObjeto);
    }

    ObjetoAnimado (int id, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
    {
        super(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY);
    }

    ObjetoAnimado (int id, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
    {
        super(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY, coordenadaZ);
    }

    @ Override public void iniciaPVectors()
    {
        super.iniciaPVectors();
        animacoes = new ArrayList<Animacao>();
    }

    public void imprime(String idAnimacao)
    {
        hint(ENABLE_DEPTH_SORT);
        pushMatrix();
            defineImpressao();
            defineImpressao(idAnimacao);
        popMatrix();
    }

    public void defineImpressao(String idAnimacao)
    {
        imageMode(CENTER);
        this.animacoes.get(buscaIndiceAnimacaoPorId(idAnimacao)).display(0, 0);
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

}
