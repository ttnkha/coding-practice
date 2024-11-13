/**
 * Calculates the number of squares a queen can attack in a given direction
 * before hitting the boundary of the chessboard or an obstacle.
 *
 * @param boardSize - The size of the board (n x n).
 * @param queenPosition - The current position of the queen [row, col].
 * @param direction - The direction to check for attacks [row change, col change].
 * @param obstacles - A list of obstacle positions on the board.
 *
 * @returns The number of squares the queen can attack in the given direction.
 */
function countAttackedSquaresInDirection(
  boardSize: number,
  queenPosition: number[],
  obstacles: number[][],
  direction: number[]
): number {
  let attackCount = 0;
  let i = 1;

  // Check each square in the given direction
  while (i <= boardSize) {
    const nextSquare = [queenPosition[0] + direction[0] * i, queenPosition[1] + direction[1] * i];

    // If the next square is out of bounds or occupied by an obstacle, stop the loop
    if (
      nextSquare[0] <= 0 ||
      nextSquare[0] > boardSize ||
      nextSquare[1] <= 0 ||
      nextSquare[1] > boardSize ||
      obstacles.some((obstacle) => obstacle[0] === nextSquare[0] && obstacle[1] === nextSquare[1])
    ) {
      return attackCount;
    }

    // The queen can attack this square, so increment the count
    attackCount++;
    i++;
  }

  return attackCount;
}

/**
 * Calculates the total number of squares a queen can attack on an n x n chessboard,
 * considering obstacles in its path. The queen moves in all 8 possible directions
 * (vertically, horizontally, and diagonally).
 *
 * @param boardSize - The size of the board (n x n).
 * @param obstacleCount - The number of obstacles on the board.
 * @param queenRow - The row position of the queen (1-indexed).
 * @param queenCol - The column position of the queen (1-indexed).
 * @param obstacles - A 2D array representing the positions of obstacles.
 *
 * @returns The total number of squares the queen can attack.
 */
function queensAttack(
  boardSize: number,
  obstacleCount: number,
  queenRow: number,
  queenCol: number,
  obstacles: number[][]
): number {
  // Define the 8 possible directions the queen can move: diagonals, vertical, and horizontal
  const queenDirections = [
    [1, -1], // Diagonal down-left
    [1, 0], // Vertical down
    [1, 1], // Diagonal down-right
    [0, -1], // Horizontal left
    [0, 1], // Horizontal right
    [-1, -1], // Diagonal up-left
    [-1, 0], // Vertical up
    [-1, 1], // Diagonal up-right
  ];

  // Calculate the total number of squares the queen can attack in all directions
  const totalAttacks = queenDirections.reduce(
    (attackSum, direction) =>
      attackSum +
      countAttackedSquaresInDirection(boardSize, [queenRow, queenCol], obstacles, direction),
    0
  );

  return totalAttacks;
}
