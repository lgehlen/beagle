class CorpoRigido
{
    private PVector gravidade;
    
    private PVector velocidade;
    
    private PVector aceleracao;
        
    private PVector forca;
    
    private float atrito;
    
    private float velocidadeMaxima;
    
    private float massa;
    
    private float angulo;
    
    private float forcaProjetil;
    
    private boolean ativo;
    
    private boolean forcaAtiva;
    
    private boolean gravidadeAtiva;
    
    private boolean colisao;
    
    CorpoRigido()
    {
        //Mock
        velocidadeMaxima = 100;
        massa = 0.1;
        gravidade = new PVector (0, 0.1);
        velocidade = new PVector(0, 0);
        forca = new PVector(0, 0);
        atrito = 0.5;
        velocidade.limit(velocidadeMaxima);
        aceleracao = forca;
    }
    
    public PVector atualizar()
    {
      if(atrito != 0 && colisao)
      velocidade.mult(atrito);
      velocidade.add(aceleracao);
      velocidade.limit(velocidadeMaxima);
      aceleracao.mult(0);
      return velocidade;
    }
    
    public void iniciarProjetil(float angulo, float forca)
    {
      this.forcaAtiva = true;
      this.angulo = angulo;
      this.forcaProjetil = forca;
    }
    
    public void aplicarForca(PVector force){
     PVector f = PVector.div(force, massa);
     aceleracao.add(f);
    }
    
    public void aplicarGravidade()
    {
      if(gravidadeAtiva)
        this.aplicarForca(gravidade);
    }
     
    public void aplicarProjetil()
    {
      PVector balistica = new PVector(0, 0);
      if(this.forcaAtiva)
      {
        this.forcaProjetil = this.forcaProjetil/1.3;
        float mx = this.forcaProjetil*cos(this.angulo);
        float my = -this.forcaProjetil*sin(this.angulo);
        balistica = new PVector(mx, my);
        if (balistica.mag()>=this.velocidadeMaxima)
          balistica.setMag(this.velocidadeMaxima);
        if(round(forcaProjetil) <= 0)
          this.forcaAtiva = false;
      }
      this.aplicarForca(balistica);
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
    
    public float buscaAtrito()
    {
        return this.atrito;
    }

    public void defineAtrito(float atrito)
    {
        this.atrito = atrito;
    }
    
    public boolean buscaAtivo()
    {
        return this.ativo;
    }

    public void defineAtivo(boolean ativo)
    {
        this.ativo = ativo;
    }
    
    public boolean buscaForcaAtiva()
    {
        return this.forcaAtiva;
    }

    public void defineForcaAtiva(boolean forcaAtiva)
    {
        this.forcaAtiva = forcaAtiva;
    }
    
    public boolean buscaGravidadeAtiva()
    {
        return this.forcaAtiva;
    }

    public void defineGravidadeAtiva(boolean gravidadeAtiva)
    {
        this.gravidadeAtiva = gravidadeAtiva;
    }
    
    public boolean buscaColisao()
    {
        return this.colisao;
    }

    public void defineColisao(boolean colisao)
    {
        this.colisao = colisao;
    }
    
}
