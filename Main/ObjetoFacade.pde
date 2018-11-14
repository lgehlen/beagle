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
