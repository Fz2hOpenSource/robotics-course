# 欢迎来到 Fz2h 的机器人课程网页


这是一个关于机器人操作系统（ROS）+ 视觉感知 的综合工程指南。

该课程主要讲解目前相对比较新颖的算法是如何部署到机器人上，希望能在课程项目设计、毕业设计、科研、机器人入门上提供一些帮助。

在自学材料方面，当前GPT/vibe-coding虽然大大降低了自学的门槛，但对于0基础的同学来说，如果连提问的基础知识都没有，判别知识真伪的能力也不足，将导致自学的效果不佳。同时缺乏实际的工程目标更是让人容易放弃学习以及在学习的过程中感觉非常迷茫。所以我们以开发一个比较完整的机器人项目为目的设计课程内容。

原则上，我们不重复造轮子，不会重复讲解已经存在的教程。相反，我们会提供相应的比较好的教程链接。 
例如，目前线上的ROS教程很多，所以我们的教程并不会涉及太多的ROS细节，但是会提及到比较关键的知识点和整体的工程逻辑。当然，这个也是看反响情况的。


视频实操内容会更新在bilibili频道:

[Fz2h](https://space.bilibili.com/671663023){ .md-button .md-button--primary }


## Project1: Object Detection + ROS + Frontier Exploration

目前我们第一个想要构建的项目是
基于ROS框架将目标识别算法以及前沿点探索算法部署到单台机器人上。

### 基础内容
- [Python环境配置 10分钟](Preliminary/Environment_setup.zh.md)
- [Linux快速入门](Preliminary/Linux.zh.md)

### 初级内容
- [ROS模块](ros/index.zh.md)
- [感知模块](perception/index.zh.md)


## 当前课程路线图
```mermaid
flowchart TB
  %% =========================
  %% 总体：从上到下的学习路径
  %% =========================

  A([Start / 开始]) --> P0
  P0[Preliminary / 基础准备] --> P1[Environment Setup<br/>环境配置]
  P0 --> P2[Linux 基础]

  %% ---------- 并行区域：ROS 与 Perception 两列 ----------
  P2 --> PAR{{进入并行学习阶段}}
  PAR --> ROS0
  PAR --> PER0

  subgraph COLS[Core Modules / 核心模块（并行）]
    direction LR

    %% ===== 左列：ROS =====
    subgraph ROS[ROS 模块]
      direction TB
      ROS0[ROS / Index] --> ROS1[Installation<br/>安装]
      ROS1 --> ROS2[Setup Robot Env<br/>机器人环境配置]
      ROS2 --> ROS3[ROS Communication Demo<br/>通信示例]
      ROS3 --> ROSP[ROS Perception Node<br/>ROS 感知节点]
      ROSP --> ROSX[ROS: More Practices<br/>更多练习]
    end

    %% ===== 右列：Perception =====
    subgraph PER[Perception 模块]
      direction TB
      PER0[Perception / Index] --> PER1[YOLO<br/>目标检测]
      PER1 --> PER2[Training<br/>训练流程]
      PER2 --> PER_END[[Perception 模块完成]]
    end
  end

  %% ---------- 跨列指向：Perception 完成后 -> ROS 感知节点 ----------
  PER_END -->|集成到 ROS| ROSP

  %% =========================
  %% 旁注/说明：用“注释节点”放在旁边
  %% =========================
  noteP0["📌 建议：Preliminary 先把<br/>Python/Conda/PyTorch 搭起来"]:::note
  P0 -.-> noteP0

  noteCols["🟦 并行关系：ROS 与 Perception<br/>可以同时推进；最后做集成"]:::note
  PAR -.-> noteCols

  %% =========================
  %% 样式（可选）
  %% =========================
  classDef note fill:#fff,stroke:#999,stroke-dasharray: 4 3,color:#333;
```



## 课程更新日志
- 2025-12-20：构建视觉感知节点
- 2025-12-18：Linux快速入门
- 2025-12-17：搭建环境：Python
- 2025-12-16：初始化 ROS 教程



```mermaid
graph TB
  subgraph AgentLoop["每个 agent 的 step() 一次闭环"]
    A0["从共享 Memory 构造 HTN state<br/>Memory.get_pyhop_state()"] --> A1["取当前 high-level task<br/>task_queue[0]"]
    A1 --> A2["拼出 full_task<br/>(task_name, agent_id, ...)"]
    A2 --> A3["pyhop.pyhop(state, [full_task])<br/>产出 plan(actions)"]
    A3 --> A4{"HTN 方法可用?"}
    A4 -->|是| A5["按 methods 分解<br/>matp_domain.py 注册的方法"]
    A4 -->|否| A6["触发 LLM 分解<br/>askChatGPT()"]
    A6 --> A7["LLM 输出子任务/算子序列<br/>可读写 llm_cache.json"]
    A7 --> A3
    A5 --> A3
    A3 --> A8{"plan 为空?"}
    A8 -->|是| A9["认为该 task 已完成<br/>task_queue.pop(0)<br/>递归处理下一个 task"]
    A8 -->|否| A10["只返回第一个原子动作<br/>first_action = plan[0]"]
    A10 --> B0["Runner 执行 action"]
    B0 --> B1["Backend 返回 success,new_state"]
    B1 --> B2["共享 Memory.update(new_state)"]
    B2 --> A0
  end
```