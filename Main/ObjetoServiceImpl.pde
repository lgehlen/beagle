class ObjetoServiceImpl implements ObjetoService
{

	private ObjetoDao objetoDao;

	public ObjetoServiceImpl()
	{
		defineObjetoDao(new ObjetoDaoImpl());
	}

	public void defineEmDesenvolvimento(boolean emDesenvolvimento)
	{
		for (Objeto obj : buscaObjetoDao().buscaListaObjetosBeagle())
		{
			obj.defineEmDesenvolvimento(emDesenvolvimento);
		}
	}

	public <T extends Objeto> T criarObjeto(Class<?> classe, int alturaObjeto, int larguraObjeto)
	{
		return buscaObjetoDao().criarObjeto(classe, alturaObjeto, larguraObjeto);
	}

	public <T extends Objeto> T criarObjeto(Class<?> classe, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
	{
		return buscaObjetoDao().criarObjeto(classe, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY);
	}

	public <T extends Objeto> T criarObjeto(Class<?> classe, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
	{
		return buscaObjetoDao().criarObjeto(classe, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY, coordenadaZ);
	}

	public boolean estaColidindo(Objeto objeto1, Objeto objeto2)
	{
		return !objeto1.caixaDeColisao.verificaSeSeparado(objeto1.caixaDeColisao,objeto2.caixaDeColisao);
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

	public void reacaoFisica(Objeto objeto)
	{
		objeto.reacaoFisica();
	}

	public void segueMouse(float velocidade, Objeto objeto)
	{
		objeto.segueMouse(velocidade);
	}

	public void rotacionarParaMouse(Objeto objeto)
	{
		objeto.rotacionarParaMouse();
	}

	public void gira(Objeto objeto)
	{
		objeto.gira();
	}

	public void adicionaImagem(String prefixoImgem, ObjetoIlustrado objeto)
	{
		objeto.defineImagem(prefixoImgem);
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

	public ObjetoDao buscaObjetoDao()
	{
		return this.objetoDao;
	}

	public void defineObjetoDao(ObjetoDao objetoDao)
	{
		this.objetoDao = objetoDao;
	}

	public void move(Objeto objeto, int sinal, int vetor)
	{
		move(objeto, sinal, vetor, 1);
	}

	public void move(Objeto objeto, int sinal, int vetor, int valor)
	{
		if(sinal == INCREMENTA)
		{
			if(vetor == COLUNA)
			{
				objeto.incrementaX(valor);
			}
			else if (vetor == LINHA) 
			{
				objeto.incrementaY(valor);
			}
			else
			{
				objeto.incrementaZ(valor);
			}
		}
		else 
		{
			if(vetor == COLUNA)
			{
				objeto.decrementaX(valor);
			}
			else if (vetor == LINHA) 
			{
				objeto.decrementaY(valor);
			}
			else
			{
				objeto.decrementaZ(valor);
			}
		}
	}

	public void removerObjeto(Objeto objeto)
	{
		if(objeto != null)
		{
            objeto.defineEmDesenvolvimento(false);
			objetoDao.removerObjeto(objeto.buscaId());
            objeto = null;
            System.gc();
		}
	}

}
