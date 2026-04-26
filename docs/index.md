# Welcome to Fz2h's Robotics Course Website

This is a comprehensive engineering guide on Robot Operating System (ROS) + Visual Perception.

This course primarily explains how relatively novel algorithms are currently deployed on robots, aiming to provide assistance in course project design, graduation projects, research, and robotics introduction.

Regarding self-learning materials, although GPT/vibe-coding has greatly lowered the barrier to self-learning, for students with zero foundation, if they lack even the basic knowledge to ask questions and have insufficient ability to distinguish truth from falsehood in knowledge, this will lead to poor self-learning outcomes. Additionally, the lack of practical engineering goals makes it easy for people to give up learning and feel very lost during the learning process. Therefore, we design the course content with the goal of developing a relatively complete robotics project.

In principle, we don't reinvent the wheel and won't repeat tutorials that already exist. Instead, we'll provide links to relatively good tutorials.
For example, there are currently many online ROS tutorials, so our tutorial won't cover too many ROS details, but will mention relatively key knowledge points and the overall engineering logic. Of course, this also depends on the response.

Video hands-on content will be updated on the bilibili channel:

[Fz2h](https://space.bilibili.com/671663023){ .md-button .md-button--primary }

## Project Overview

The current project is to deploy object detection algorithms and frontier exploration algorithms on a single robot based on the ROS framework.

## Course Modules

### [Robotics Basics](robotics_basics/index.md)
Mathematical foundations of robotics, covering forward/inverse kinematics, dynamics, coordinate transformations, and DH parameters.

### [ROS Robot Operating System](ros/index.md)
ROS communication mechanisms, robot environment configuration, and perception node development.

### [Perception Module](perception/index.md)
YOLO object detection, model training, and visual perception systems.

### [Simulation Environment](simulation/index.md)
Simulation frameworks including Gazebo, Drake, MuJoCo, and PyBullet.

### [Robotic Manipulation (MIT 6.8210)](manipulation/index.md)
MIT Professor Russ Tedrake's manipulation course covering perception, planning, control, and reinforcement learning.

### [Planning Module](planning/index.md)
Task planning, temporal logic, reactive behaviors, and learning-enhanced planning.

### [Reinforcement Learning](learning/index.md)
RL fundamentals, value functions, policy gradients, and model predictive control.

### [Deployment](deployment/index.md)
Deploying from simulation to real robots, hardware integration, system architecture, and safety considerations.

## Course Roadmap

### Preliminary
- [Python Environment Setup](Preliminary/Environment_setup.md) - Quick 10-minute setup
- [Linux Quick Start](Preliminary/Linux.md) - Essential Linux skills

### Parallel Learning Path

```mermaid
flowchart TB
  %% =========================
  %% Overall: Top-to-bottom learning path
  %% =========================

  A([Start]) --> P0
  P0[Preliminary] --> P1[Environment Setup]
  P0 --> P2[Linux Basics]
  P0 --> P3[Robotics Basics]

  %% ---------- Parallel stage ----------
  P3 --> PAR{{Enter Parallel Learning Stage}}
  P2 --> PAR
  PAR --> ROS0
  PAR --> PER0
  PAR --> SIM0
  PAR --> PLAN0
  PAR --> LEARN0

  subgraph COLS[Core Modules / Parallel]
    direction LR

    %% ===== ROS =====
    subgraph ROS[ROS Module]
      direction TB
      ROS0[ROS Index] --> ROS1[Installation]
      ROS1 --> ROS2[Robot Environment Setup]
      ROS2 --> ROS3[ROS Communication Demo]
      ROS3 --> ROSP[ROS Perception Node]
      ROSP --> ROSX[More Practices]
    end

    %% ===== Perception =====
    subgraph PER[Perception]
      direction TB
      PER0[Perception Index] --> PER1[YOLO Object Detection]
      PER1 --> PER2[Training Pipeline]
      PER2 --> PER_END[[Perception Done]]
    end

    %% ===== Simulation =====
    subgraph SIM[Simulation]
      direction TB
      SIM0[Simulation Index] --> SIM1[Gazebo ROS-native]
      SIM1 --> SIM2[Drake Advanced]
      SIM2 --> SIM3[MuJoCo Physics]
      SIM3 --> SIM4[PyBullet Prototyping]
      SIM4 --> SIM_END[[Simulation Done]]
    end

    %% ===== Planning =====
    subgraph PLAN[Planning]
      direction TB
      PLAN0[Planning Index] --> PLAN1[Planning Problem]
      PLAN1 --> PLAN2[Deliberative]
      PLAN2 --> PLAN3[Temporal]
      PLAN3 --> PLAN4[Reactive]
      PLAN4 --> PLAN5[Learning-based]
      PLAN5 --> PLAN_END[[Planning Done]]
    end

    %% ===== Learning =====
    subgraph LEARN[Learning]
      direction TB
      LEARN0[Learning Index] --> LEARN1[Fundamentals]
      LEARN1 --> LEARN2[Value-Based]
      LEARN2 --> LEARN3[Policy Gradient]
      LEARN3 --> LEARN4[Model-Based]
      LEARN4 --> LEARN5[Robot Apps]
      LEARN5 --> LEARN_END[[Learning Done]]
    end
  end

  %% ---------- Cross-links ----------
  PER_END -.->|Integrate| ROSP
  SIM_END -.->|Validate| PLAN1
  LEARN_END -.->|Enhance| PLAN5
  PLAN_END -.->|Input| MANI0

  %% ---------- Manipulation Summary ----------
  subgraph MANI[Manipulation (MIT 6.8210)]
    direction TB
    MANI0[Manipulation Index] --> MANI1[Pick & Place]
    MANI1 --> MANI2[Pose Estimation]
    MANI2 --> MANI3[Motion Planning]
    MANI3 --> MANI4[Control]
    MANI4 --> MANI5[Deep Perception]
    MANI5 --> MANI6[RL Manipulation]
    MANI6 --> MANI_END[[Manipulation Done]]
  end

  %% ---------- Deployment ----------
  MANI_END --> DEP0[Deployment]
  DEP0 --> DEP1[Sim-to-Real]
  DEP1 --> DEP2[Hardware Integration]
  DEP2 --> DEP3[Architecture]
  DEP3 --> DEP4[Safety]
  DEP4 --> FINAL[[Project Complete]]

  %% =========================
  %% Styles
  %% =========================
  classDef note fill:#fff,stroke:#999,stroke-dasharray: 4 3,color:#333;
  classDef milestone fill:#4CAF50,stroke:#333,color:#fff;
```

## Course Update Log

- 2026-04-26: Updated Reinforcement Learning module
- 2026-04-26: Updated Robotic Manipulation module (MIT 6.8210)
- 2026-04-26: Added Planning module (task planning, temporal logic)
- 2026-04-26: Updated Simulation module (Gazebo, Drake, MuJoCo, PyBullet)
- 2026-04-26: Updated Deployment module (Sim-to-Real, hardware integration)
- 2025-12-20: Built visual perception node
- 2025-12-18: Linux quick start
- 2025-12-17: Environment setup: Python
- 2025-12-16: Initialized ROS tutorial
