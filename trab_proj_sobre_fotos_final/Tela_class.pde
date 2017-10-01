class Tela
{
  float x1, y1, x2, y2, x3, y3, x4, y4;
  boolean strk=false;
  boolean filme=true;
  boolean tela_at=false;
  PImage clipe;
  String nomeC;

  Tela() {
  }

  Tela(float xi1, float yi1, float xi2, float yi2, float xi3, float yi3, float xi4, float yi4, PImage clipeI, String nomeCI) {
    x1=xi1;
    y1=yi1;
    x2=xi2;
    y2=yi2;
    x3=xi3;
    y3=yi3;
    x4=xi4;
    y4=yi4;
    clipe = clipeI;
    nomeC = nomeCI;
  }

  void desenha() {
    if (strk) {
      cursor();
      if (tela_at) {
        fill(255, 204, 0);
        stroke(255, 204, 0);
      }
      else {
        fill(0, 255, 0);
        stroke(0, 255, 0);
      }
      text("1", x1-12, y1, 0);
      text("2", x2, y2, 0);
      text("3", x3, y3+12, 0);
      text("4", x4-12, y4+12, 0);
      text(nomeC,x4+5,y4+12,0);
    }
    else {
      noStroke();
      noFill();
      noCursor();
    }
    beginShape();
    if (filme) {
      texture(clipe);
    }
    else {
      texture(img);
    }
    textureMode(NORMAL);
    vertex(x1, y1, 0, 0, 0);
    vertex(x2, y2, 0, 1, 0);
    vertex(x3, y3, 0, 1, 1);
    vertex(x4, y4, 0, 0, 1);
    endShape(CLOSE);
  }

  void recebeValor(char numeroId) {
    switch(numeroId) {
    case '1':
      x1=mouseX;
      y1=mouseY;
      break;

    case '2':
      x2=mouseX;
      y2=mouseY;
      break;

    case '3':
      x3=mouseX;
      y3=mouseY;
      break;

    case '4':
      x4=mouseX;
      y4=mouseY;
      break;
    }
  }

  void korner() {
    strk= !strk;
  }

  void muda_cor(boolean t) {
    tela_at= t;
  }

  void saveConfigs(String cI) {
    configuracoes = createWriter("data/configs"+cI+".txt");

    configuracoes.println(x1 + "\t" + y1);
    configuracoes.println(x2 + "\t" + y2);
    configuracoes.println(x3 + "\t" + y3);
    configuracoes.println(x4 + "\t" + y4);
    configuracoes.flush();
    configuracoes.close();
  }

  void loadConfigs(String cI) {
    String[] lines;
    String[] pos;

    lines = loadStrings("data/configs"+cI+".txt");

    pos = split(lines[0], '\t');
    x1 = int(pos[0]);
    y1 = int(pos[1]);

    pos = split(lines[1], '\t');
    x2 = int(pos[0]);
    y2 = int(pos[1]);

    pos = split(lines[2], '\t');
    x3 = int(pos[0]);
    y3 = int(pos[1]);

    pos = split(lines[3], '\t');
    x4 = int(pos[0]);
    y4 = int(pos[1]);
  }
}

