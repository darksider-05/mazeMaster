# Maze Game

A maze game built with a **Python backend** and a **Flutter frontend**. The project combines procedural maze generation with real-time gameplay, with the backend serving as the game's core engine.

## Features

* Procedurally generated mazes using a recursive backtracking algorithm.
* Real-time game loop with asynchronous updates.
* Collision detection and movement handling.
* Win and loss state detection.
* Hint system.
* Dynamic maze modification during gameplay to increase difficulty.
* Modular Python architecture separating game engine, world generation, player logic, movement, rendering, and game-state checking.

## Project Structure

```
backend/
├── engine.py      # Main game loop
├── world.py       # Maze generation and world logic
├── mover.py       # Player movement
├── player.py      # Player state
├── checker.py     # Win/loss conditions
├── printer.py     # Console rendering
└── test.py
```

## Technologies

* **Backend:** Python 3
* **Frontend:** Flutter

## How the Backend Works

1. A maze is generated based on the requested size.
2. The game engine starts an asynchronous update loop.
3. Player input updates the player's position.
4. Collision and game-state checks are performed every frame.
5. The maze is rendered in the console while the game is running.
6. The game ends when the player reaches the goal or loses.

## Running the Backend

From the `backend` directory:

```bash
python engine.py
```

You will be prompted to enter the maze size before the game starts.

## Algorithms

### Maze Generation

The maze is generated using a depth-first recursive backtracking algorithm, producing a fully connected maze with a unique path between any two cells.

### Dynamic Blocking

During gameplay, sections of the maze may be blocked while preserving a valid route to the goal, creating a more challenging and adaptive experience.

## Project Status

* ✅ Backend complete
* 🔄 Flutter interface being integrated

## Future Improvements

* Complete Flutter user interface.
* Connect the Flutter frontend directly to the Python game engine.
* Improve graphics, animations, and user experience.
* Additional gameplay options and customization.

## License

This project was created for educational purposes.
