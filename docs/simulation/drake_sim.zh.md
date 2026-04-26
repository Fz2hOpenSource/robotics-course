# Drake仿真

## 概述

Drake擅长于接触丰富动力学的高级操作仿真。

## 设置

```python
import pydrake.all as pydrake

builder = pydrake.diagramBuilder()
plant = builder.AddSystem(pydrake.multibody.Plant(0.001))
scene_graph = builder.AddSystem(pydrake.geometry.SceneGraph())
```

## 添加物体

```python
parser = pydrake.multibody.parsing.Parser(plant)
parser.AddModelFromFile("model.sdf")
plant.Finalize()
```

## 接触建模

```python
ContactVisualizer.AddToBuilder(builder, plant, scene_graph)
```

## 关键特性

- 精确的接触物理
- 轨迹优化
- 传感器仿真

---

*[← 返回目录](index.md)*
