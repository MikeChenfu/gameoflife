# Conway's GameOfLife
The purpose of this work is to simulate game of life. The universe of the Game of Life is a 2-D grid in which each cell has two possible states, alive (1) or dead (0). Every cell interacts with its eight neighbors, which are the cells that are horizontally, vertically, or diagonally adjacent. 

#Game Rules
1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overcrowding.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

#Compile and test the code 

```sh
make
./gol		    # Uses default size 
./gol <m>		# Uses m for both the width and the height 
./gol <m> <n>	# Uses m and n for width and height
```
