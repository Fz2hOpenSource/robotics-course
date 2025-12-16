# Path Planning Algorithms

Path planning is the computational problem of finding a sequence of valid configurations that moves the robot from the source to destination.

## Common Algorithms

### Graph Search
- **Dijkstra**: Guarantees shortest path.
- **A***: Heuristic search, faster than Dijkstra.

### Sampling Based
- **RRT (Rapidly-exploring Random Tree)**
- **RRT***: Asymptotically optimal version of RRT.

## Implementation Example

```cpp
// Simple A* pseudo-code structure
struct Node {
    int x, y;
    float g, h, f;
    Node* parent;
};
```
