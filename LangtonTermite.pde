//OPTIONS
int delay = 0; //ms between each tick
boolean randDir = false; //should ants have random direction?

int[][] cells; //the actual cell, and the holding cell
int cellSize = 5; //size of each square in pixels
int numSquaresPerRow, numSquaresPerColumn;

int steps = 0;

int lastRecordedTime = 0;
boolean pause = true;

color white = color(255, 255, 255);
color empty = color(0);
color antColor = color(255, 0, 0);

ArrayList<Termite> termites = new ArrayList<Termite>();

PFont f, fsmall;

String termiteSeed = "";
int numStates;
color[] colors;
int tempColor;

void setup() {
  size(1800, 900);

  f = createFont("Arial", 30, true);
  fsmall = createFont("Arial", 20, true);
  textAlign(TOP);            

  numSquaresPerRow = height/cellSize;
  numSquaresPerColumn = width/cellSize;
  cells = new int[numSquaresPerRow][numSquaresPerColumn];

  fill(empty);
  stroke(empty);
  rect(0, 0, width, height);
  clearGrid();

  termiteSeed = javax.swing.JOptionPane.showInputDialog("Input termite movement pattern");
  numStates = termiteSeed.length();
  colors = new color[numStates];
  colors[0] = empty;
  for (int c = 1; c < numStates; c++) {
    colors[c] = color(int(random(256)), int(random(256)), int(random(256)));
  }
}

void draw() { 
  if (!pause) {
    if (millis()-lastRecordedTime>delay) { //delays between iterations so that one can see the individual generations
      iteration();
      lastRecordedTime = millis();
    }
  } else {
    redrawGrid();

    for (Termite t : termites) {
      drawTermite(t);
    }

    fill(white);
    textFont(f);
    text("Paused", 15, 30);
    text("Step: " + steps, 15, 60);
    text("Termite movement pattern: " + termiteSeed, 15, 90);
    textFont(fsmall);
    text("Reset [R]", 15, 120);
    text("Pause/unpause [SPACE]", 15, 140);
    text("Spawn ant [Mouse]", 15, 160);
  }
}

void mouseClicked() {
  int mouseRow = int(map(mouseY, 0, height, 0, numSquaresPerRow));
  int mouseCol = int(map(mouseX, 0, width, 0, numSquaresPerColumn)); 

  termites.add(new Termite(mouseRow, mouseCol, randDir? int(random(4))*90 : 0, numSquaresPerRow, numSquaresPerColumn, termiteSeed));
  drawTermite(termites.get(termites.size()-1));
}

void iteration() {

  for (Termite t : termites) {
    tempColor = cells[t.r][t.c];

    //color the cell from which the ant has left
    cells[t.r][t.c]++;

    if (cells[t.r][t.c] == numStates)
      cells[t.r][t.c] = 0;

    fill(colors[cells[t.r][t.c]]);
    rect(t.c*cellSize, t.r*cellSize, cellSize, cellSize);

    t.move(tempColor);
    drawTermite(t);
  }

  steps++;
}

void drawTermite(Termite t) {
  fill(antColor);
  rect(t.c*cellSize, t.r*cellSize, cellSize, cellSize);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    clearGrid();
    termites.clear();

    fill(empty);
    stroke(empty);
    rect(0, 0, width, height);

    steps = 0;
  }

  if (key == ' ') {
    pause = !pause;

    if (!pause) {     //redraw to erase "paused" text
      redrawGrid();
      for (Termite t : termites) {
        drawTermite(t);
      }
    }
  }
}

void redrawGrid() {
  fill(empty);
  rect(0, 0, width, height);
  fill(white);
  for (int r=0; r<numSquaresPerRow; r++) {
    for (int c=0; c<numSquaresPerColumn; c++) {
      if (cells[r][c]>0) {
        fill(colors[cells[r][c]]);
        rect(c*cellSize, r*cellSize, cellSize, cellSize);
      }
    }
  }
}

void clearGrid() {
  for (int r=0; r<numSquaresPerRow; r++) 
    for (int c=0; c<numSquaresPerColumn; c++) 
      cells[r][c] = 0;
}