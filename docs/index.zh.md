# 欢迎来到 Fz2h 的机器人课程网页

这是一个关于机器人操作系统（ROS）、YOLO目标检测和路径规划算法的综合指南。

课程主要面向课程项目设计、毕业设计为目标进行设计。
我希望既能涉及传统，也能涉及前沿。

GPT 或者 vibe-coding 虽然可以进行知识问答和生成代码，但是不可否认的是他生成的内容会出现事实错误。
对于0基础的同学来说，如果连提问的基础知识都没有，判别知识真伪的能力也不足，那也没办法进行知识问答和修改代码。

我们的目标是上手就能跑，看文章、demo就能理解算法。

视频实操内容会更新在bilibili频道[Fz2h](https://space.bilibili.com/671663023){ .md-button }

## 特色主题

- **ROS**：学习机器人编程的基础知识。
- **YOLO**：掌握实时目标检测技术。
- **路径规划**：探索自主导航算法。
- **更多**

[开始学习ROS](ros/index.md){ .md-button .md-button--primary }

## 环境配置


### 创建环境
1. 安装 [anaconda](https://www.anaconda.com/download/success) 或 [miniconda](https://docs.conda.io/en/latest/miniconda.html)
![anaconda](image/index/anaconda.png)

2. 安装 Python 常用包

``` bash
conda create -n fz2h_course python=3.10  
``` 

如果您在中国大陆有网络连接：
``` bash
conda activate fz2h_course
pip install numpy pandas matplotlib opencv-python -i https://pypi.tuna.tsinghua.edu.cn/simple
```

不然

``` bash
conda activate fz2h_course
pip install numpy pandas matplotlib opencv-python 
```
3. 安装 PyTorch  
如果你只有 CPU：

``` bash
conda activate fz2h_course
pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
```
如果您有 NVIDIA 显卡（例如 RTX 3060 等）：

使用以下命令查看您的 GPU 版本：
```
nvidia-smi
```

选择正确的 PyTorch 版本：
![pytorch](image/index/pytorch.png)
``` bash
conda activate fz2h_course
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu118
```

## 课程更新日志
- 2025-12-16：初始化 ROS 教程
- 2025-12-17：搭建环境：Python
