class Animacao 
{
    private PImage[] images;
    private String id;
    private int imageCount;
    private int frame;

    public Animacao(String id, String imagePrefix, int count) 
    {
        this.id = id;
        this.imageCount = count;
        images = new PImage[this.imageCount];

        for (int i = 0; i < imageCount; i++) 
        {
            String filename = imagePrefix + nf(i, 2) + ".png";
            images[i] = loadImage(filename);
        }
    }

    public Animacao(String id, String imagePrefix, int count, String extensao) 
    {
        this.id = id;
        this.imageCount = count;
        images = new PImage[this.imageCount];

        for (int i = 0; i < imageCount; i++) 
        {
            String filename = imagePrefix + nf(i, 2) + "." + extensao;
            images[i] = loadImage(filename);
        }
    }

    public void display(float x, float y) 
    {
        this.frame = (this.frame+1) % imageCount;
        image(this.images[this.frame], x, y);
    }

    public int getWidth() 
    {
        return this.images[0].width;
    }

    public String getId()
    {
        return this.id;
    }
}
