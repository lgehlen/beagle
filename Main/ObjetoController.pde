


private boolean colisao;


public boolean estaColidindo(Objeto objeto1, Objeto objeto2)
{
	return !objeto1.caixaDeColisao.verificaSeSeparado(objeto1.caixaDeColisao,objeto2.caixaDeColisao,colisao);
}

public void imprime(Objeto objeto)
{
	objeto.imprime();
}

public void imprime(String idAnimacao, ObjetoAnimado objeto)
{
	objeto.imprime(idAnimacao);
}

public void colisaoImpressao(Objeto objeto)
{
	objeto.colisaoImpressao();
}

private void reacaoFisica(Objeto objeto)
{
	objeto.reacaoFisica();
}

private void segueMouse(float velocidade, Objeto objeto)
{
	objeto.segueMouse(velocidade);
}

private void rotacionarParaMouse(Objeto objeto)
{
	objeto.rotacionarParaMouse();
}

public void gira(Objeto objeto)
{
	objeto.gira();
}

public void incrementaX(Objeto objeto)
{
	objeto.incrementaX();
}

public void incrementaX(int n, Objeto objeto)
{
	objeto.incrementaX(n);
}

public void incrementaY(Objeto objeto)
{
	objeto.incrementaY();
}

public void incrementaY(int n, Objeto objeto)
{
	objeto.incrementaY(n);
}

public void incrementaZ(Objeto objeto)
{
	objeto.incrementaZ();
}

public void incrementaZ(int n, Objeto objeto)
{
	objeto.incrementaZ(n);
}

public void decrementaX(Objeto objeto)
{
	objeto.decrementaX();
}

public void decrementaX(int n, Objeto objeto)
{
	objeto.decrementaX(n);
}

public void decrementaY(Objeto objeto)
{
	objeto.decrementaY();
}

public void decrementaY(int n, Objeto objeto)
{
	objeto.decrementaY(n);
}

public void decrementaZ(Objeto objeto)
{
	objeto.decrementaZ();
}

public void decrementaZ(int n, Objeto objeto)
{
	objeto.decrementaZ(n);
}  

public void adicionaAnimacao(String idAnimacao, String prefixoImgem, int quantidadeSprites, ObjetoAnimado objeto)
{
	objeto.adicionaAnimacao(idAnimacao, prefixoImgem, quantidadeSprites);
}

public void adicionaAnimacao(String idAnimacao, String prefixoImgem, int quantidadeSprites, String extensao, ObjetoAnimado objeto)
{
	objeto.adicionaAnimacao(idAnimacao, prefixoImgem, quantidadeSprites, extensao);
}

public int buscaIndiceAnimacaoPorId(String idAnimacao, ObjetoAnimado objeto)
{
	return objeto.buscaIndiceAnimacaoPorId(idAnimacao);
}
