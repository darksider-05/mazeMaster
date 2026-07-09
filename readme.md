# MazeMaster

MazeMaster is a maze game built with a **Python backend** and a **Flutter frontend**. The backend contains the game engine and maze generation logic, while the frontend provides a graphical interface that communicates with the game through WebSockets.


feel free to check out the background of the app [here](https://darksider-05.github.io/mazeMaster/)

## Features

* Procedurally generated mazes.
* Recursive backtracking maze generation.
* Interactive Flutter user interface.
* Real-time communication between frontend and backend using WebSockets.
* Player movement with collision detection.
* Hint system.
* Dynamic maze updates during gameplay.
* Win and game-over detection.
* Modular architecture separating game logic, rendering, networking, and UI.

## Tech Stack

### Backend

* Python 3
* asyncio
* WebSockets
* Colorama

### Frontend

* Flutter
* Provider
* web_socket_channel

## Architecture

The project is divided into two independent applications:

* **Python Backend**

  * Generates and manages the maze.
  * Processes player movement.
  * Detects game events.
  * Hosts a WebSocket server for communication.

* **Flutter Frontend**

  * Displays the maze and game state.
  * Sends player input.
  * Receives live updates from the backend through WebSockets.
  * Manages UI state using the Provider package.

## Running the Project

### First

```bash
pip install colorama websockets
```

### Then,

```text
Download and run the releases in the repository
```

The frontend connects to the backend automatically over:

```text
ws://127.0.0.1:8765
```

Make sure the backend is running before launching the Flutter application.

## Gameplay

1. Start the backend.
2. Launch the Flutter application.
3. A maze is generated.
4. Navigate from the start to the goal while avoiding dead ends.
5. Use hints when needed.
6. Reach the exit to win.

## Algorithms

### Maze Generation

The maze is generated using a recursive depth-first search (recursive backtracking) algorithm. This guarantees a connected maze with a unique path between any two cells.

### Game Engine

The backend uses Python's `asyncio` event loop to process gameplay and synchronize state updates with connected clients in real time.

## License

This project was created for educational purposes.
