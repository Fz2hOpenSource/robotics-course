# Fz2hOpenSource Robotics Course

[在线文档 Website](https://Fz2hOpenSource.github.io/robotics-course/) | [Bilibili 频道](https://space.bilibili.com/671663023)

这是一个关于机器人操作系统（ROS）、YOLO目标检测和路径规划算法的综合指南。本项目主要面向课程项目设计和毕业设计，旨在为初学者提供从基础理论到实践应用的完整学习路径。

我们的目标是实现"上手就能跑"，通过清晰的文档和可运行的 Demo，帮助大家理解复杂的算法原理。

目前正在努力完成ROS部分的内容，每日更新。

## 📚 主要内容

本项目目前包含以下核心模块：

- **ROS (Robot Operating System)**
  - 机器人编程基础
  - 核心概念：节点、话题、服务等
  - 环境搭建与配置

- **YOLO (You Only Look Once)**
  - 实时目标检测技术详解
  - 模型训练流程
  - 实际部署应用

- **路径规划 (Path Planning)**
  - 自主导航核心算法
  - 常用算法解析（如 A*、RRT 等）

## 🚀 快速开始

本项目使用 [MkDocs](https://www.mkdocs.org/) 构建文档网站。如果你想在本地运行或贡献内容，请按照以下步骤操作：

### 1. 克隆仓库

```bash
git clone https://github.com/Fz2hOpenSource/robotics-course.git
cd robotics-course
```

### 2. 安装依赖

建议使用 Python 虚拟环境来管理依赖：

```bash
# 创建并激活虚拟环境 (可选)
python -m venv venv
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate   # Windows

# 安装项目依赖
pip install -r requirements.txt
```

### 3. 本地预览

启动本地开发服务器：

```bash
mkdocs serve
```

启动后，在浏览器访问 [http://127.0.0.1:8000](http://127.0.0.1:8000) 即可实时预览文档更改。

## 🤝 贡献指南

欢迎提交 Issue 反馈问题或提交 Pull Request 贡献内容。让我们一起完善这个学习平台！

---

*本项目由 Fz2h 维护，更多视频教程请关注 Bilibili 频道 [Fz2h](https://space.bilibili.com/671663023)*
