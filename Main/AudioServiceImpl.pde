class AudioServiceImpl implements AudioService 
{
	private AudioDao audioDao;

	private String arquivoDeAudio;

	private PApplet classe;

	public AudioServiceImpl()
	{
		defineAudioDao(new AudioDaoImpl());
	}

	public void tocarAudio(String arquivoDeAudio, PApplet classe)
	{
	    this.arquivoDeAudio = arquivoDeAudio;
	    this.classe = classe;
	    
	    delay(50);
	    manterAudio(this.arquivoDeAudio).buscaArquivo().play();
	}

	public void tocarAudioContinuo(String arquivoDeAudio, PApplet classe)
	{
		this.arquivoDeAudio = arquivoDeAudio;
		this.classe = classe;

		delay(50);
	    manterAudio(this.arquivoDeAudio).buscaArquivo().loop();
	}

	public void pararAudio(String arquivoDeAudio)
	{
	    Audio audio = buscarAudioPorNome(arquivoDeAudio);

	    if(audio != null)
	    {
	        buscarAudioPorId(audio.buscaId()).buscaArquivo().stop();
	    }    
	}

	private Audio adicionarAudio(String arquivoDeAudio)
	{
		return buscaAudioDao().adicionarAudio(arquivoDeAudio, this.classe);
	}

	private Audio buscarAudioPorNome(String nome)
	{
	    return buscaAudioDao().buscarAudioPorNome(nome);
	}

	private Audio manterAudio(String arquivoDeAudio)
	{
	    Audio audio = buscarAudioPorNome(arquivoDeAudio);

	    if(audio != null)
	    {
	        return buscarAudioPorId(audio.buscaId());
	    }

	    return adicionarAudio(arquivoDeAudio);
	}

    private Audio buscarAudioPorId(int id)
    {
        return buscaAudioDao().buscarAudioPorId(id);
    }

	public AudioDao buscaAudioDao()
	{
		return this.audioDao;
	}

	public void defineAudioDao(AudioDao audioDao)
	{
		this.audioDao = audioDao;
	}
	
}
