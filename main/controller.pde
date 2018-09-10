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

public Objeto criarObjeto(String imagemURL, int alturaObjeto, int larguraObjeto)
{
    Objeto objeto = new Objeto(id, imagemURL, alturaObjeto, larguraObjeto);

    adicionarObjeto(objeto);	

    return objeto;
}

public Objeto criarObjeto(String imagemURL, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY)
{
    Objeto objeto = new Objeto(id, imagemURL, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY);

    adicionarObjeto(objeto);	

    return objeto;
}

public Objeto criarObjeto(String imagemURL, int alturaObjeto, int larguraObjeto, int coordenadaX, int coordenadaY, int coordenadaZ)
{
    Objeto objeto = new Objeto(id, imagemURL, alturaObjeto, larguraObjeto, coordenadaX, coordenadaY, coordenadaZ);

    adicionarObjeto(objeto);	

    return objeto;
}

public boolean estaColidindo(Objeto objeto1)
{
    for (Objeto ob2 : objetos)
    {
      
    }

    return false;
}

public boolean estaColidindo(Objeto objeto1, Objeto objeto2)
{
    return objeto1.caixaDeColisao.checkIfSeparated(objeto1.caixaDeColisao,objeto2.caixaDeColisao,colisao);
}

public ArrayList<Objeto> getObjetos()
{
    return this.objetos;
}
