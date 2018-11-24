final ObjetoService objetoService = new ObjetoServiceImpl();

public void defineEmDesenvolvimento(boolean emDesenvolvimento)
{
	objetoService.defineEmDesenvolvimento(emDesenvolvimento);
}

public <T extends Objeto> T criarObjeto(Class<?> classe, int alturaObjeto, int larguraObjeto)
{
	return objetoService.criarObjeto(classe, alturaObjeto, larguraObjeto);
}

public <T extends Objeto> T criarObjeto(Class<?> classe, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
{
	return objetoService.criarObjeto(classe, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY);
}

public <T extends Objeto> T criarObjeto(Class<?> classe, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
{
	return objetoService.criarObjeto(classe, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY, coordenadaZ);
}

public boolean estaColidindo(Objeto objeto1, Objeto objeto2)
{
	return objetoService.estaColidindo(objeto1, objeto2);
}

public void imprime(Objeto objeto)
{
	objetoService.imprime(objeto);
}

public void imprime(String idAnimacao, ObjetoAnimado objeto)
{
	objetoService.imprime(idAnimacao, objeto);
}

public void colisaoImpressao(Objeto objeto)
{
	objetoService.colisaoImpressao(objeto);
}

public void reacaoFisica(Objeto objeto)
{
	objetoService.reacaoFisica(objeto);
}

public void segueMouse(float velocidade, Objeto objeto)
{
	objetoService.segueMouse(velocidade, objeto);
}

public void rotacionarParaMouse(Objeto objeto)
{
	objetoService.rotacionarParaMouse(objeto);
}

public void gira(Objeto objeto)
{
	objetoService.gira(objeto);
}

public void adicionaImagem(String prefixoImgem, ObjetoIlustrado objeto)
{
	objetoService.adicionaImagem(prefixoImgem, objeto);
}

public void adicionaAnimacao(String idAnimacao, String prefixoImgem, int quantidadeSprites, ObjetoAnimado objeto)
{
	objetoService.adicionaAnimacao(idAnimacao, prefixoImgem, quantidadeSprites, objeto);
}

public void adicionaAnimacao(String idAnimacao, String prefixoImgem, int quantidadeSprites, String extensao, ObjetoAnimado objeto)
{
	objetoService.adicionaAnimacao(idAnimacao, prefixoImgem, quantidadeSprites, extensao, objeto);
}

public int buscaIndiceAnimacaoPorId(String idAnimacao, ObjetoAnimado objeto)
{
	return objetoService.buscaIndiceAnimacaoPorId(idAnimacao, objeto);
}

public void move(Objeto objeto, int sinal, int vetor)
{
	objetoService.move(objeto, sinal, vetor);
}

public void move(Objeto objeto, int sinal, int vetor, int valor)
{
	objetoService.move(objeto, sinal, vetor, valor);
}

public void removerObjeto(Objeto objeto)
{
	objetoService.removerObjeto(objeto);
}
