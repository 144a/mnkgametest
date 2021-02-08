void setup() {
  // Random 2x2 board
  // println("Player: " + boardState("0110", 2, 2, 2));
  
  // Tic Tac Toe Board
  // println("Player: " + boardState("001012102", 3, 3, 3));
  
  // Connect Four Board
  println("Player: " + boardState("102210120112021111101221120221222012212102", 7, 6, 4));
  
}

int findWinner(int[][] iboard, int y, int x, int type, int[] dir) {
  // If the value is out of bounds
  if(x + dir[1] == -1 || y + dir[0] == -1 || y + dir[0] == iboard.length || x + dir[1] == iboard[0].length) {
    return 0;
  }
  
  // If there is a block in the specified direction, update coordinate and continue search
  if(iboard[y + dir[0]][x + dir[1]] == type) {
    return 1 + findWinner(iboard, y + dir[0], x + dir[1], type, dir);
  } 
  
  // Otherwise, return 0 and stop search
  return 0;
}

int boardState(String iboard, int m, int n, int k) {
  int[][] board = new int[n][m];
  
  // Convert a given board state into an equivalent array
  for(int i = 0; i < iboard.length(); i++) {
    board[(int)(i / m)][i % m] = "012".indexOf(iboard.substring(i,i+1));
  }
  
  // Displays Array (Not Necessary for function)
  for(int[] yval:board) {
    for(int xval:yval) {
      print(xval + " ");
    }
    println();
  }
  
  // Set up direction value set
  int[][] directions = new int[][]{{-1,-1},{-1,0},{-1,1},{0,-1},{0,1},{1,-1},{1,0},{1,1}};
  
  // Evaluate the board
  for(int i = 0; i < board.length; i++) {
    for(int j = 0; j < board[0].length; j++) {
      // If the position is non-zero (there exists a peice here), run recursive function
      if(board[i][j] != 0) {
        // Check in all directions
        for(int p = 0; p < 8; p++) {
          int ret = findWinner(board, i, j, board[i][j], directions[p]);
          // Check to see if the length of group is sufficient for 
          if(ret >= k-1) {
            return board[i][j];
          }
        }
      }      
    }
  } 
  
  // If there is not match found for the k value, it will return 0 for "no winner"
  return 0;
}
