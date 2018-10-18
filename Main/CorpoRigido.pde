class CorpoRigido
{
    PVector gravidade;
    
    PVector velocidade;
    
    PVector aceleracao;
    
    PVector forca;
    
    float velocidadeMaxima;
    
    float massa;
    
    boolean ativo;
    
    CorpoRigido()
    {
        //Mock
        velocidadeMaxima = 100;
        massa = 0.1;
        gravidade = new PVector (0, 0.1);
        velocidade = new PVector(0, 0);
        forca = new PVector(0, 0.4);
        velocidade.limit(velocidadeMaxima);
        aceleracao = forca;
    }
    
    public PVector atualizar()
    {
      velocidade.add(aceleracao);
      velocidade.limit(velocidadeMaxima);
      aceleracao.mult(0);
      return velocidade;
    }
    
    public void aplicarGravidade()
    {
      this.aplicarForca(gravidade);
    }
    
    public void aplicarForca(PVector force){
     PVector f = PVector.div(force, massa);
     aceleracao.add(f);
    }
    
    // GETTER'S AND SETTER'S ==========================================================
    
    public PVector buscaGravidade()
    {
        return this.gravidade;
    }

    public void defineGravidade(PVector gravidade)
    {
        this.gravidade = gravidade;
    }
    
        public PVector buscaVelocidade()
    {
        return this.velocidade;
    }

    public void defineVelocidade(PVector velocidade)
    {
        this.velocidade = velocidade;
    }
    
    public PVector buscaAceleracao()
    {
        return this.aceleracao;
    }

    public void defineAceleracao(PVector aceleracao)
    {
        this.aceleracao = aceleracao;
    }
        
    public PVector buscaForca()
    {
        return this.forca;
    }

    public void defineForca(PVector forca)
    {
        this.forca = forca;
    }
    
    public float buscaVelocidadeMaxima()
    {
        return this.velocidadeMaxima;
    }

    public void defineVelocidadeMaxima(float velocidadeMaxima)
    {
        this.velocidadeMaxima = velocidadeMaxima;
    }
    
    public float buscaMassa()
    {
        return this.massa;
    }

    public void defineMassa(float massa)
    {
        this.massa = massa;
    }
    
    public boolean buscaAtivo()
    {
        return this.ativo;
    }

    public void defineAtivo(boolean ativo)
    {
        this.ativo = ativo;
    }
}
