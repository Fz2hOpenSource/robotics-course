# 基础拾取放置

## 拾取放置流水线

1. **感知** 物体姿态
2. **规划** 接近轨迹
3. **执行** 抓取
4. **移动** 到目标位置
5. **释放** 物体

## 空间代数

### 旋转表示
- 欧拉角
- 四元数
- 轴角

### 齐次变换
$$T = \begin{bmatrix} R & p \\ 0 & 1 \end{bmatrix}$$

## 正向运动学

使用Drake的MultibodyPlant：

```python
plant = builder.AddSystem(MultibodyPlant(time_step))
parser = Parser(plant)
parser.AddModelFromFile("robot.sdf")
plant.Finalize()

context = plant.CreateDefaultContext()
X_WB = plant.CalcForwardKinematics(context)
```

## 逆运动学

### 使用Drake的数值IK

```python
def solve_ik(plant, context, X_WG):
    ik = InverseKinematics(plant, context)
    ik.AddOrientationConstraint(...)
    ik.AddPositionConstraint(...)
    result = Solve(ik.prog())
    return result.GetSolution()
```

## 抓取选择

- 预定义抓取姿态
- 抓取质量指标
- 抓取规划算法

---

*[← 返回目录](index.md)*
