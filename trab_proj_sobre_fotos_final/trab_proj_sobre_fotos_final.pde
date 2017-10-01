import processing.video.*;

PrintWriter configuracoes;

PImage img;
ArrayList<Movie> movies;
ArrayList<Tela> telas;

int tela_ativa = 0;
float l, c;

void setup() {
  size(displayWidth, displayHeight, P3D);

  img = loadImage("telaBranca.png");

  movies = new ArrayList<Movie>();
  movies.add(new Movie(this, "eca_1.mov"));//0
  movies.add(new Movie(this, "eca_2.mov"));//1
  movies.add(new Movie(this, "eca_3.mov"));//2
  movies.add(new Movie(this, "liberdade_2.mov"));//3
  movies.add(new Movie(this, "liberdade_3.mov"));//4
  movies.add(new Movie(this, "liberdade_4.mov"));//5
  movies.add(new Movie(this, "mobilidade_1.mov"));//6
  movies.add(new Movie(this, "mobilidade_2.mov"));//7
  movies.add(new Movie(this, "mobilidade_3.mov"));//8
  movies.add(new Movie(this, "moradia_1.mov"));//9
  movies.add(new Movie(this, "moradia_2.mov"));//10
  movies.add(new Movie(this, "moradia_3.mov"));//11

  telas = new ArrayList<Tela>();
  //telas.add(new Tela());
  telas.add(new Tela(60, 60, 150, 60, 150, 120, 60, 120, movies.get(0), "eca_1"));
  telas.add(new Tela(210, 210, 300, 210, 300, 270, 210, 270, movies.get(1), "eca_2"));
  telas.add(new Tela(410, 110, 500, 110, 500, 170, 410, 170, movies.get(2), "eca_3"));
  telas.add(new Tela(60, 60, 150, 60, 150, 120, 60, 120, movies.get(3), "liberdade_2"));
  telas.add(new Tela(210, 210, 300, 210, 300, 270, 210, 270, movies.get(4), "liberdade_3"));
  telas.add(new Tela(410, 110, 500, 110, 500, 170, 410, 170, movies.get(5), "liberdade_4"));
  telas.add(new Tela(60, 60, 150, 60, 150, 120, 60, 120, movies.get(6), "mobilidade_1"));
  telas.add(new Tela(210, 210, 300, 210, 300, 270, 210, 270, movies.get(7), "mobilidade_2"));
  telas.add(new Tela(410, 110, 500, 110, 500, 170, 410, 170, movies.get(8), "mobilidade_3"));
  telas.add(new Tela(60, 60, 150, 60, 150, 120, 60, 120, movies.get(9), "moradia_1"));
  telas.add(new Tela(210, 210, 300, 210, 300, 270, 210, 270, movies.get(10), "moradia_2"));
  telas.add(new Tela(410, 110, 500, 110, 500, 170, 410, 170, movies.get(11), "moradia_3"));
  
  telas.add(new Tela(0, 0, 50, 0, 50, 70, 0, 70, img, "placa_1"));
  telas.add(new Tela(0, 0, 50, 0, 50, 70, 0, 70, img, "placa_2"));
  telas.add(new Tela(0, 0, 50, 0, 50, 70, 0, 70, img, "placa_3"));
  telas.add(new Tela(0, 0, 50, 0, 50, 70, 0, 70, img, "placa_4"));

  textMode(SHAPE);
  textSize(12);
  smooth();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  background(0);
    translate(c, l);
    
  for (int i = telas.size()-1; i >= 0; i--) {
    Tela tela = telas.get(i);
    tela.desenha();
  }
}

void keyPressed() {
  Tela tela = telas.get(tela_ativa);
  tela.muda_cor(true);

  switch(key) {
  case '1':
    tela.recebeValor('1');

    break;

  case '2':
    tela.recebeValor('2');

    break;

  case '3':
    tela.recebeValor('3');

    break;

  case '4':
    tela.recebeValor('4');

    break;

  case 'k':
    for (int i = telas.size()-1; i >= 0; i--) {
      tela = telas.get(i);
      tela.korner();
    }
    break;

  case 'v':
    for (int i = movies.size()-1; i >= 0; i--) {
      Movie movie = movies.get(i);
      movie.jump(0);
      movie.play();
    }
    break;

  case 't':
    tela.muda_cor(false);
    if (tela_ativa<telas.size()-1) {
      tela_ativa++;
      println(tela_ativa);
    }
    break;

  case 'y':
    tela.muda_cor(false);
    if (tela_ativa>0) {
      tela_ativa--;
      println(tela_ativa);
    }
    break;

  case 's':
    for (int s = telas.size()-1; s >= 0; s--) {
    tela = telas.get(s);
    tela.saveConfigs(str(s));
    }
    break;

  case 'l':
    for (int l = telas.size()-1; l >= 0; l--) {
    tela = telas.get(l);
    tela.loadConfigs(str(l));
    }
    break;
    
    
    
    
    /*
  case 'm':
     selectInput("Escolha o clipe:", "fileSelected");
     break;
     
     case 't':
     filme = !filme;
     break;*/
  }
  
   if (key == CODED) {
    switch(keyCode) {
    case UP:
      l=l-1;
      break;
    case DOWN:
      l=l+1;
      break;
    case LEFT:
      c=c-1;
      break;
    case RIGHT:
      c=c+1;
      break;
    }
  }

}

/*void fileSelected(File selection){
 String sel = selection.getAbsolutePath();
 myMovie = new Movie(this, sel);
 }*/
