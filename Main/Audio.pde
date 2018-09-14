import processing.sound.*;

class Audio
{
	private int id;
    private String nome;
	private SoundFile arquivo;

	Audio(PApplet klass, int id, String arquivo)
	{
        this.id = id;
		this.nome = arquivo;
		this.arquivo = new SoundFile(klass, arquivo);
	}

	public int buscaId()
	{
		return this.id;
	}

    public String buscaNome()
    {
        return this.nome;
    }

	public SoundFile buscaArquivo()
	{
		return this.arquivo;
	}
}
