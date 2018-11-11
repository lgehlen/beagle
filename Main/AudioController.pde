public ArrayList<Audio> audios = new ArrayList<Audio>();

public static int idAudio = 0;

private String arquivoDeAudio;

void settings()
{
    size(1020, 800, P3D);
    noSmooth();
}

public void adicionarAudio(Audio audio)
{
    idAudio++;
    audios.add(audio);
}

public Audio buscarAudioPorNome(String nome)
{
    for(Audio audio : audios)
    {
        if(audio.buscaNome().equals(nome))
        {
            return audio;
        }
    }
    return null;
}

public Audio manterAudio(String arquivoDeAudio)
{
    Audio audio = buscarAudioPorNome(arquivoDeAudio);

    if(audio != null)
    {
        audio = audios.get(audio.buscaId());
    }
    else
    {
        audio = new Audio(this, idAudio, arquivoDeAudio);
        adicionarAudio(audio);
    }
    return audio;
}

public void tocarAudio(String arquivoDeAudio)
{
    this.arquivoDeAudio = arquivoDeAudio;
    thread("threadRodarAudio");
}

public void threadRodarAudio()
{
    delay(100);
    manterAudio(this.arquivoDeAudio).buscaArquivo().play();
}

public void tocarAudioContinuo(String arquivoDeAudio)
{
    manterAudio(arquivoDeAudio).buscaArquivo().loop();
}

public void pararAudio(String arquivoDeAudio)
{
    Audio audio = buscarAudioPorNome(arquivoDeAudio);

    if(audio != null)
    {
        audio = audios.get(audio.buscaId());
        audio.buscaArquivo().stop();
    }    
}
