# Drake Simulation

## Overview

Drake excels at manipulation simulation with contact-rich dynamics.

## Setup

```python
import pydrake.all as pydrake

builder = pydrake.diagramBuilder()
plant = builder.AddSystem(pydrake.multibody.Plant(0.001))
scene_graph = builder.AddSystem(pydrake.geometry.SceneGraph())
```

## Adding Objects

```python
parser = pydrake.multibody.parsing.Parser(plant)
parser.AddModelFromFile("model.sdf")
plant.Finalize()
```

## Contact Modeling

```python
ContactVisualizer.AddToBuilder(builder, plant, scene_graph)
```

## Key Features

- Accurate contact physics
- Trajectory optimization
- Sensor simulation

---

*[← Back to Index](index.md)*
