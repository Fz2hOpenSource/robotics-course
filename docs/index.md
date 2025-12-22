# Welcome to Fz2h's Robotics Course Website

This is a comprehensive engineering guide on Robot Operating System (ROS) + Visual Perception.

This course primarily explains how relatively novel algorithms are currently deployed on robots, aiming to provide assistance in course project design, graduation projects, research, and robotics introduction.

Regarding self-learning materials, although GPT/vibe-coding has greatly lowered the barrier to self-learning, for students with zero foundation, if they lack even the basic knowledge to ask questions and have insufficient ability to distinguish truth from falsehood in knowledge, this will lead to poor self-learning outcomes. Additionally, the lack of practical engineering goals makes it easy for people to give up learning and feel very lost during the learning process. Therefore, we design the course content with the goal of developing a relatively complete robotics project.

In principle, we don't reinvent the wheel and won't repeat tutorials that already exist. Instead, we'll provide links to relatively good tutorials.
For example, there are currently many online ROS tutorials, so our tutorial won't cover too many ROS details, but will mention relatively key knowledge points and the overall engineering logic. Of course, this also depends on the response.

Video hands-on content will be updated on the bilibili channel:

[Fz2h](https://space.bilibili.com/671663023){ .md-button .md-button--primary }

## Project1: Object Detection + ROS + Frontier Exploration

Currently, the first project we want to build is:
Deploying object detection algorithms and frontier exploration algorithms on a single robot based on the ROS framework.

### Basic Content
- [Python Environment Setup 10 minutes](Preliminary/Environment_setup.zh.md)
- [Linux Quick Start](Preliminary/Linux.zh.md)

### Intermediate Content
- [ROS Module](ros/index.zh.md)
- [Perception Module](perception/index.zh.md)

## Current Course Roadmap
```mermaid
flowchart TB
  %% =========================
  %% Overall: Top-to-bottom learning path
  %% =========================

  A([Start]) --> P0
  P0[Preliminary / Basic Preparation] --> P1[Environment Setup]
  P0 --> P2[Linux Basics]

  %% ---------- Parallel Area: ROS and Perception two columns ----------
  P2 --> PAR{{Enter Parallel Learning Phase}}
  PAR --> ROS0
  PAR --> PER0

  subgraph COLS[Core Modules (Parallel)]
    direction LR

    %% ===== Left Column: ROS =====
    subgraph ROS[ROS Module]
      direction TB
      ROS0[ROS / Index] --> ROS1[Installation]
      ROS1 --> ROS2[Setup Robot Env]
      ROS2 --> ROS3[ROS Communication Demo]
      ROS3 --> ROSP[ROS Perception Node]
      ROSP --> ROSX[ROS: More Practices]
    end

    %% ===== Right Column: Perception =====
    subgraph PER[Perception Module]
      direction TB
      PER0[Perception / Index] --> PER1[YOLO<br/>Object Detection]
      PER1 --> PER2[Training<br/>Training Process]
      PER2 --> PER_END[[Perception Module Complete]]
    end
  end

  %% ---------- Cross-column pointer: After Perception completes -> ROS Perception Node ----------
  PER_END -->|Integrate into ROS| ROSP

  %% =========================
  %% Side notes/explanations: Using "comment nodes" placed on the side
  %% =========================
  noteP0["📌 Suggestion: In Preliminary, first set up<br/>Python/Conda/PyTorch"]:::note
  P0 -.-> noteP0

  noteCols["🟦 Parallel relationship: ROS and Perception<br/>can be advanced simultaneously; integrate at the end"]:::note
  PAR -.-> noteCols

  %% =========================
  %% Styles (Optional)
  %% =========================
  classDef note fill:#fff,stroke:#999,stroke-dasharray: 4 3,color:#333;
```

## Course Update Log
- 2025-12-20: Built visual perception node
- 2025-12-18: Linux quick start
- 2025-12-17: Environment setup: Python
- 2025-12-16: Initialized ROS tutorial
