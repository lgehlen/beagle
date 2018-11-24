interface ObjetoService
{
	public void defineEmDesenvolvimento(boolean emDesenvolvimento);

	public <T extends Objeto> T criarObjeto(Class<?> klass, int alturaObjeto, int larguraObjeto);

	public <T extends Objeto> T criarObjeto(Class<?> klass, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY);

	public <T extends Objeto> T criarObjeto(Class<?> klass, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ);

	public boolean estaColidindo(Objeto objeto1, Objeto objeto2);

	public void imprime(Objeto objeto);

	public void imprime(String idAnimacao, ObjetoAnimado objeto);

	public void colisaoImpressao(Objeto objeto);

	public void reacaoFisica(Objeto objeto);

	public void segueMouse(float velocidade, Objeto objeto);

	public void rotacionarParaMouse(Objeto objeto);

	public void gira(Objeto objeto);

	public void adicionaImagem(String prefixoImgem, ObjetoIlustrado objeto);

	public void adicionaAnimacao(String idAnimacao, String prefixoImgem, int quantidadeSprites, ObjetoAnimado objeto);

	public void adicionaAnimacao(String idAnimacao, String prefixoImgem, int quantidadeSprites, String extensao, ObjetoAnimado objeto);

	public int buscaIndiceAnimacaoPorId(String idAnimacao, ObjetoAnimado objeto);

	public void move(Objeto objeto, int sinal, int vetor);

	public void move(Objeto objeto, int sinal, int vetor, int valor);

	public void removerObjeto(Objeto objeto);

} 
