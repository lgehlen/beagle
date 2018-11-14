interface AudioDao 
{
	public Audio adicionarAudio(String arquivoDeAudio, PApplet classe);

	public Audio buscarAudioPorNome(String nome);

	public Audio buscarAudioPorId(int id);
}
