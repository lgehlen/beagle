class AudioDaoImpl implements AudioDao
{
	private ArrayList<Audio> listaAudiosBeagle;

	private int idAudio = 0;

	public AudioDaoImpl()
	{
		listaAudiosBeagle = new ArrayList<Audio>();
	}

	public Audio adicionarAudio(String arquivoDeAudio, PApplet classe)
	{
		Audio audio = new Audio(classe, idAudio, arquivoDeAudio);
	    
	    listaAudiosBeagle.add(audio);
		idAudio++;

		return audio;
	}

	public Audio buscarAudioPorNome(String nome)
	{
		for(Audio audio : listaAudiosBeagle)
	    {
	        if(audio.buscaNome().equals(nome))
	        {
	            return audio;
	        }
	    }
	    return null;
	
	}

	public Audio buscarAudioPorId(int id)
	{
		return listaAudiosBeagle.get(id);
	}
}
