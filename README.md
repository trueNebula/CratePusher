# Crate Pusher

Short 2D platformer game made for the Game Development and Design Patterns courses in Y3 at UBB.

Made using the Godot, art by [ansimuz](https://ansimuz.itch.io/sunny-land-pixel-game-art).

## Features
- Keyboard & Mouse gameplay
- 2 Levels and an End Screen
- Global Score
- Animations and Physics

## Design Patterns
- Creational: Singleton
    - Used for the Score feature (player_variables.gd)
- Structural: Composite, Bridge
    - Composite is used internally in the engine, Bridge is used as part of multiple components (State Machine, Player, Objects)
- Behavioral: State
    - Used for the State Machine controlling Player movement
