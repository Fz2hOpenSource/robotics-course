# 坐标变换

## 概述

坐标变换是机器人学的基础，使我们能够在不同参考坐标系中表示位置和姿态。

## 旋转表示方法

### 旋转矩阵 (3x3)

正交矩阵 $R$，满足 $R^T R = I$ 且 $\det(R) = 1$

特性：
- 9个参数，6个约束 → 3个自由度
- 合成直观
- 传输时占用内存大

### 欧拉角

绕主轴的顺序旋转。

**ZYZ约定：**
$$R = R_z(\alpha) R_y(\beta) R_z(\gamma)$$

常见问题：$\beta = \pm 90°$ 时出现万向节锁

### 轴角（指数坐标）

$$R = e^{[\omega]_\times \theta}$$

其中 $[\omega]_\times$ 是 $\omega$ 的反对称矩阵。

### 四元数

4参数表示：$q = [w, x, y, z]$ 或 $q = [cos(\theta/2), \sin(\theta/2)\omega]$

优势：
- 无万向节锁
- 插值高效（Slerp）
- 存储空间小

## 齐次变换

结合旋转和平移：

$$T = \begin{bmatrix} R & d \\ 0 & 1 \end{bmatrix}$$

其中 $R$ 是3x3旋转矩阵，$d$ 是3x1平移向量。

## 常用运算

### 变换合成
$$T_{AC} = T_{AB} \cdot T_{BC}$$

### 逆变换
$$T^{-1} = \begin{bmatrix} R^T & -R^T d \\ 0 & 1 \end{bmatrix}$$

### 向量变换
$$v_A = R_{AB} \cdot v_B$$

---

*[← 返回目录](index.md)*
