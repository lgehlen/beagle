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

public Objeto criarObjeto(int alturaObjeto, int larguraObjeto)
{
    Objeto objeto = new Objeto(id, alturaObjeto, larguraObjeto);
    adicionarObjeto(objeto);
    return objeto;
}

public Objeto criarObjeto(int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
{
    Objeto objeto = new Objeto(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY);
    adicionarObjeto(objeto);
    return objeto;
}

public Objeto criarObjeto(int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
{
    Objeto objeto = new Objeto(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY, coordenadaZ);
    adicionarObjeto(objeto);
    return objeto;
}

public ObjetoIlustrado criarObjetoIlustrado(int alturaObjeto, int larguraObjeto)
{
    Objeto objeto = new ObjetoIlustrado(id, alturaObjeto, larguraObjeto);
    adicionarObjeto(objeto);
    return (ObjetoIlustrado) objeto;
}

public ObjetoIlustrado criarObjetoIlustrado(int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
{
    Objeto objeto = new ObjetoIlustrado(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY);
    adicionarObjeto(objeto);
    return (ObjetoIlustrado) objeto;
}

public ObjetoIlustrado criarObjetoIlustrado(int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
{
    Objeto objeto = new ObjetoIlustrado(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY, coordenadaZ);
    adicionarObjeto(objeto);
    return (ObjetoIlustrado) objeto;
}

public ObjetoAnimado criarObjetoAnimado(int alturaObjeto, int larguraObjeto)
{
    Objeto objeto = new ObjetoAnimado(id, alturaObjeto, larguraObjeto);
    adicionarObjeto(objeto);
    return (ObjetoAnimado) objeto;
}

public ObjetoAnimado criarObjetoAnimado(int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
{
    Objeto objeto = new ObjetoAnimado(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY);
    adicionarObjeto(objeto);
    return (ObjetoAnimado) objeto;
}

public ObjetoAnimado criarObjetoAnimado(int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
{
    Objeto objeto = new ObjetoAnimado(id, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY, coordenadaZ);
    adicionarObjeto(objeto);
    return (ObjetoAnimado) objeto;
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
