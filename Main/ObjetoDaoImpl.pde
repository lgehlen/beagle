class ObjetoDaoImpl implements ObjetoDao
{
	public ArrayList<Objeto> listaObjetosBeagle = new ArrayList<Objeto>();

	private int id = 0;

	private void adicionarObjeto(Objeto objeto)
	{
		id++;
		listaObjetosBeagle.add(objeto);
	}

	public <T extends Objeto> T criarObjeto(Class<?> klass, int alturaObjeto, int larguraObjeto)
	{	
		Objeto objeto = null;
		
		if(klass.equals(Objeto.class))
		{
			objeto = new Objeto(id, alturaObjeto, larguraObjeto);
		}
		else if(klass.equals(ObjetoIlustrado.class))
		{
			objeto = new ObjetoIlustrado(id, alturaObjeto, larguraObjeto);
		}
		else if(klass.equals(ObjetoAnimado.class))
		{
			objeto = new ObjetoAnimado(id, alturaObjeto, larguraObjeto);
		}	
		
		if(objeto != null)
		{
			adicionarObjeto(objeto);
		}	
		return (T) objeto;
	}

	public <T extends Objeto> T criarObjeto(Class<?> klass, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
	{	
		Objeto objeto = null;
		
		if(klass.equals(Objeto.class))
		{
			objeto = new Objeto(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY);
		}
		else if(klass.equals(ObjetoIlustrado.class))
		{
			objeto = new ObjetoIlustrado(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY);
		}
		else if(klass.equals(ObjetoAnimado.class))
		{
			objeto = new ObjetoAnimado(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY);
		}
		
		if(objeto != null)
		{
			adicionarObjeto(objeto);
		}

		return (T) objeto;
	}

	public <T extends Objeto> T criarObjeto(Class<?> klass, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
	{	
		Objeto objeto = null;
		
		if(klass.equals(Objeto.class))
		{
			objeto = new Objeto(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY, coordenadaZ);
		}
		else if(klass.equals(ObjetoIlustrado.class))
		{
			objeto = new ObjetoIlustrado(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY, coordenadaZ);
		}
		else if(klass.equals(ObjetoAnimado.class))
		{
			objeto = new ObjetoAnimado(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY, coordenadaZ);
		}
		
		if(objeto != null)
		{
			adicionarObjeto(objeto);
		}

		return (T) objeto;
	}

	public void removerObjeto(int id)
	{
        int count = 0;
        
        for(Objeto o : listaObjetosBeagle)
		{
            if(o.buscaId() == id)
            {
			    buscaListaObjetosBeagle().remove(count);
                break;
            }
            count++;
		}
	}

	public ArrayList<Objeto> buscaListaObjetosBeagle()
	{
		return listaObjetosBeagle;
	}
}
