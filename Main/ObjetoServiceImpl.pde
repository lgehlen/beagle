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


	public ObjetoDao buscaObjetoDao()
	{
		return this.objetoDao;
	}

	public void defineObjetoDao(ObjetoDao objetoDao)
	{
		this.objetoDao = objetoDao;
	}
}
