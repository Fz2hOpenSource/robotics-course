# DH参数

## 概述

Denavit-Hartenberg (DH) 约定提供了一种系统的方法为机器人连杆分配坐标系。

## 标准DH参数

每个关节四个参数：

| 参数 | 描述 | 轴 |
|-----------|-------------|------|
| $\theta_i$ | 关节角度 | Z (旋转关节) |
| $d_i$ | 连杆偏移 | Z |
| $a_i$ | 连杆长度 | X |
| $\alpha_i$ | 连杆扭角 | X |

## 变换矩阵

$$_{i-1}^{i}T = R_z(\theta_i) \cdot T_z(d_i) \cdot T_x(a_i) \cdot R_x(\alpha_i)$$

$$= \begin{bmatrix} \cos\theta_i & -\sin\theta_i\cos\alpha_i & \sin\theta_i\sin\alpha_i & a_i\cos\theta_i \\ \sin\theta_i & \cos\theta_i\cos\alpha_i & -\cos\theta_i\sin\alpha_i & a_i\sin\theta_i \\ 0 & \sin\alpha_i & \cos\alpha_i & d_i \\ 0 & 0 & 0 & 1 \end{bmatrix}$$

## 建模步骤

1. 从基座到末端执行器标记关节1到n
2. Z轴与关节轴对齐
3. 选择基座坐标系原点为关节1原点
4. 对每个连杆：
   - $a_i$：从 $Z_i$ 到 $Z_{i+1}$ 沿 $X_i$ 的距离
   - $\alpha_i$：从 $Z_i$ 到 $Z_{i+1}$ 绕 $X_i$ 的角度
   - $d_i$：从 $X_{i-1}$ 到 $X_i$ 沿 $Z_i$ 的距离
   - $\theta_i$：从 $X_{i-1}$ 到 $X_i$ 绕 $Z_i$ 的角度

## 改进DH参数

另一种约定，将坐标系$i$放在关节$i$处（变换前）：

$$_{i}^{i-1}T = R_x(\alpha_{i-1}) \cdot T_x(a_{i-1}) \cdot R_z(\theta_i) \cdot T_z(d_i)$$

## 最佳实践

- 保持约定选择的一致性
- 记录你使用的约定
- 用已知构型验证

---

*[← 返回目录](index.md)*
