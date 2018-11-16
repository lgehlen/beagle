public static final Class<?> OBJETO = Objeto.class;
public static final Class<?> OBJETO_ANIMADO = ObjetoAnimado.class;
public static final Class<?> OBJETO_ILUSTRADO = ObjetoIlustrado.class;

public static final int LINHA = 1;
public static final int COLUNA = 2;
public static final int PROFUNDIDADE = 3;

public static final int INCREMENTA = 1;
public static final int DECREMENTA = 2;

/* A biblioteca necessita do renderizador P3D para imprimir as imagens */

@ Override void size(int width, int height)
{
	super.size(width, height, P3D);
}

@ Override void size(int width, int height, String renderer){
    super.size(width, height, P3D);
    noSmooth();
}
