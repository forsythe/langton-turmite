class Termite {
  public int r, c, angle; //angle in degrees
  int max_rows, max_cols;
  String moves;

  Termite(int r_rhs, int c_rhs, int angle_rhs, int num_rows, int num_cols, String moves_rhs) {
    r = r_rhs;
    c = c_rhs;
    angle = angle_rhs;
    max_rows = num_rows;
    max_cols = num_cols;
    moves = moves_rhs;
  }

  void move(int cur_cell) {

    angle += moves.charAt(cur_cell) == 'L' ? 90: -90;

    if (angle < 0)
      angle += 360;

    if (angle >= 360)
      angle -= 360;

    switch(angle) {
    case 0:
      c++;
      break;
    case 90:
      r--;
      break;
    case 180:
      c--;
      break;
    case 270:
      r++;
      break;
    }

    if (r < 0) 
      r = max_rows-1;
    if (c < 0) 
      c = max_cols-1;
    if (r >= max_rows)
      r %= max_rows;
    if (c >= max_cols)
      c %= max_cols;
  }
}