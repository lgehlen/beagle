public static final Class<?> OBJETO = Objeto.class;
public static final Class<?> OBJETO_ANIMADO = ObjetoAnimado.class;
public static final Class<?> OBJETO_ILUSTRADO = ObjetoIlustrado.class;

public ArrayList<Objeto> objetos = new ArrayList<Objeto>();
public static int id = 0;
public boolean colisao;

void settings()
{
    size(800, 600, P3D);

    noSmooth();
}

public void adicionarObjeto(Objeto objeto)
{
    id++;
    objetos.add(objeto);
}

<T extends Objeto> T criarObjeto(Class<?> klass, int alturaObjeto, int larguraObjeto)
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

<T extends Objeto> T criarObjeto(Class<?> klass, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
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

<T extends Objeto> T criarObjeto(Class<?> klass, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
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

public void defineEmDesenvolvimento(boolean emDesenvolvimento)
{
    for (Objeto ob1 : objetos)
    {
        ob1.defineEmDesenvolvimento(emDesenvolvimento);
    }
}

public boolean estaColidindo(Objeto objeto1, Objeto objeto2)
{
    return objeto1.caixaDeColisao.verificaSeSeparado(objeto1.caixaDeColisao,objeto2.caixaDeColisao,colisao);
}

public ArrayList<Objeto> getObjetos()
{
    return this.objetos;
}
