class ObjetoIlustrado extends Objeto
{
    private PImage imagem;

    ObjetoIlustrado (int id, int alturaObjeto, int larguraObjeto)
    {
        super(id, alturaObjeto, larguraObjeto);
    }

    ObjetoIlustrado (int id, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
    {
        super(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY);
    }

    ObjetoIlustrado (int id, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
    {
        super(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY, coordenadaZ);
    }

    //@Overrride
    @ Override public void defineImpressao()
    {
        super.defineImpressao();
        imageMode(CENTER);
        image(this.imagem, 0, 0, super.tamanho.y, super.tamanho.x);
    }

    public PImage buscaImagem()
    {
        return this.imagem;
    }

    public void defineImagem(String imagemURL)
    {
        this.imagem = loadImage(imagemURL);
    }

}
