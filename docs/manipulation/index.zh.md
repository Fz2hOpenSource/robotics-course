# 机器人操作 (MIT课程)

本模块涵盖MIT 6.8210机器人操作课程，由Russ Tedrake教授。

## 课程概览

- **授课教师**: Russ Tedrake (MIT CSAIL)
- **来源**: [manipulation.csail.mit.edu](https://manipulation.csail.mit.edu/)
- **框架**: Drake
- **重点**: 机器人操作的感知、规划与控制

## 涵盖主题

### 基础
- [引言](introduction.md) - 课程概述与动机
- [机器人硬件](hardware.md) - 机械臂、夹爪、传感器
- [基础拾取放置](pick_place.md) - 操作运动学

### 感知
- [位姿估计](pose_estimation.md) - 几何位姿估计
- [料箱抓取](bin_picking.md) - 杂乱场景中的抓取
- [深度感知](deep_perception.md) - 基于CNN的感知

### 规划
- [运动规划](motion_planning.md) - 轨迹优化、RRT、GCS
- [任务规划](task_planning.md) - 状态机、行为树

### 控制
- [轨迹跟踪](control.md) - 位置控制和力控制
- [混合控制](hybrid_control.md) - 位置/力混合策略

### 学习
- [强化学习](rl_manipulation.md) - 操作任务的强化学习

## 前置知识

- 线性代数
- 控制理论基础
- Python编程
- （推荐）[机器人学基础](../robotics_basics/index.md)

## 软件安装

本课程使用 **Drake** 机器人框架。参见[安装指南](installation.md)进行设置。

## 课程项目

1. 基础拾取放置流水线
2. 基于视觉的料箱抓取
3. 基于学习的抓取

---

*[← 返回首页](../index.md)*
