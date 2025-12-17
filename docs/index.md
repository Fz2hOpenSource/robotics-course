# Welcome to Robotics Learning Hub

This is a comprehensive guide to Robotics Operating System (ROS), YOLO Object Detection, and Path Planning algorithms.

We're currently developing ROS-related content and aim to publish daily updates. To stay informed about our latest releases, please subscribe to our Bilibili channel [Fz2h](https://space.bilibili.com/671663023){ .md-button }.

1. 

## Featured Topics

- **ROS**: Learn the fundamentals of robot programming.
- **YOLO**: Master real-time object detection.
- **Path Planning**: Explore algorithms for autonomous navigation.

[Get Started with ROS](ros/index.md){ .md-button .md-button--primary }



## Let's setup environment here 


### create env
1. install  [anaconda](https://www.anaconda.com/download/success) or [miniconda](https://docs.conda.io/en/latest/miniconda.html)
![anaconda](image/index/anaconda.png)

2. install python common packages

``` bash
conda create -n fz2h_course python=3.10  
``` 

``` bash
conda activate fz2h_course
numpy pandas matplotlib opencv-python 
```

3. install pytorch
If you only have cpu:

``` bash
conda activate fz2h_course
pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
```
If you have nvidia gpu (3060 etc):
use the command to check your gpu version:
```
nvidia-smi
```

Select the correct pytorch version:

![pytorch](image/index/pytorch.png)
``` bash
conda activate fz2h_course
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu118
```






## Course update log 
- 2025-12-16: initialize ros tutorial
- 2025-12-17: Setup environment：python