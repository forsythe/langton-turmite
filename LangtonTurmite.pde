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

ArrayList<Turmite> turmites = new ArrayList<Turmite>();

PFont f, fsmall;

String turmiteSeed = "";
int numStates;
color[] colors;
int tempColor;

void setup() {
  size(1800, 900);
  frameRate(120);

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

  turmiteSeed = javax.swing.JOptionPane.showInputDialog("Input termite movement pattern");
  numStates = turmiteSeed.length();
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

    for (Turmite t : turmites) {
      drawTermite(t);
    }

    fill(white);
    textFont(f);
    text("Paused", 15, 30);
    text("Step: " + steps, 15, 60);
    text("Turmite movement pattern: " + turmiteSeed, 15, 90);
    textFont(fsmall);
    text("Reset [R]", 15, 120);
    text("Pause/unpause [SPACE]", 15, 140);
    text("Spawn termite [Mouse]", 15, 160);
  }
}

void mouseClicked() {
  int mouseRow = int(map(mouseY, 0, height, 0, numSquaresPerRow));
  int mouseCol = int(map(mouseX, 0, width, 0, numSquaresPerColumn)); 

  turmites.add(new Turmite(mouseRow, mouseCol, randDir? int(random(4))*90 : 0, numSquaresPerRow, numSquaresPerColumn, termiteSeed));
  drawTermite(turmites.get(turmites.size()-1));
}

void iteration() {

  for (Turmite t : turmites) {
    tempColor = cells[t.r][t.c];

    cells[t.r][t.c]++;

    if (cells[t.r][t.c] == numStates)
      cells[t.r][t.c] = 0;

    fill(colors[cells[t.r][t.c]]);
    rect(t.c*cellSize, t.r*cellSize, cellSize, cellSize);

    t.move(tempColor);
    drawTurmite(t);
  }

  steps++;
}

void drawTurmite(Turmite t) {
  fill(antColor);
  rect(t.c*cellSize, t.r*cellSize, cellSize, cellSize);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    clearGrid();
    turmites.clear();

    fill(empty);
    stroke(empty);
    rect(0, 0, width, height);

    steps = 0;
  }

  if (key == ' ') {
    pause = !pause;

    if (!pause) {     //redraw to erase "paused" text
      redrawGrid();
      for (Turmite t : turmites) {
        drawTurmite(t);
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