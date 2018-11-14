final AudioService audioService = new AudioServiceImpl();

public void tocarAudio(String arquivoDeAudio)
{
	audioService.tocarAudio(arquivoDeAudio, this);
}

public void tocarAudioContinuo(String arquivoDeAudio)
{
	audioService.tocarAudioContinuo(arquivoDeAudio, this);
}

public void pararAudio(String arquivoDeAudio)
{
	audioService.pararAudio(arquivoDeAudio);
}
