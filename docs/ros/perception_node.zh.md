# YOLO 感知节点部署与话题通信

## 1. 课程目标

- 理解 **YOLO 感知模型如何嵌入 ROS 系统**
- 学会将 **YOLO 推理封装为 ROS 节点**
- 使用 ROS Topic 实现：
  - 图像订阅（输入）
  - 目标检测结果发布（输出）
- 为后续 **感知 → 决策 → 控制** 打下基础

---

## 2. 系统架构说明

本教程采用如下 ROS 通信结构：

``` mermaid
flowchart LR
    Camera[Camera Node]
    Yolo[YOLO Node<br/>(Detection)]
    Other[Other ROS Node<br/>(Visualization / Decision)]

    Camera -- "/image_raw" --> Yolo
    Yolo -- "/yolo/detections" --> Other
```

YOLO 节点职责：
- 订阅相机图像话题
- 运行 YOLO 模型推理
- 发布检测结果（类别 / 置信度 / 框）

---

## 3. 环境准备

### 3.1 ROS 环境

- ROS Noetic
- 已完成前述 ROS 通信教程

### 3.2 Python 与 YOLO 环境

沿用你已有的环境：

```bash
conda activate fz2h_course
pip install ultralytics opencv-python
```

额外依赖（ROS 图像转换）：

```bash
sudo apt install ros-noetic-cv-bridge ros-noetic-image-transport
```

---

## 4. 创建 YOLO ROS 包

在工作空间中创建新包：

```bash
cd ~/catkin_ws/src
catkin_create_pkg yolo_ros_demo rospy std_msgs sensor_msgs cv_bridge
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```

---

## 5. YOLO ROS 节点实现

### 5.1 节点功能说明

YOLO ROS 节点需要完成：

1. 订阅 `/image_raw`（`sensor_msgs/Image`）
2. 使用 `cv_bridge` 转换为 OpenCV 图像
3. 调用 YOLO 模型推理
4. 输出检测结果（日志 or Topic）

---

### 5.2 创建 YOLO 节点文件

```bash
cd ~/catkin_ws/src/yolo_ros_demo
touch yolo_node.py
chmod +x yolo_node.py
```

---

### 5.3 YOLO 节点代码

```python
#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
from ultralytics import YOLO

class YoloNode:
    def __init__(self):
        rospy.init_node("yolo_node")

        # 加载 YOLO 模型
        model_path = rospy.get_param("~model_path", "yolo11s.pt")
        self.model = YOLO(model_path)

        self.bridge = CvBridge()

        # 订阅相机图像
        self.image_sub = rospy.Subscriber(
            "/image_raw", Image, self.image_callback, queue_size=1
        )

        rospy.loginfo("YOLO ROS Node Started")

    def image_callback(self, msg):
        # ROS Image → OpenCV
        cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding="bgr8")

        # YOLO 推理
        results = self.model(cv_image)

        # 处理检测结果
        for result in results:
            boxes = result.boxes
            for box in boxes:
                cls_id = int(box.cls[0])
                conf = float(box.conf[0])
                rospy.loginfo("Detected class %d with confidence %.2f", cls_id, conf)

        # 可视化（调试用）
        annotated = results[0].plot()
        cv2.imshow("YOLO Detection", annotated)
        cv2.waitKey(1)

if __name__ == "__main__":
    try:
        YoloNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
```

---

## 6. 编译与运行

### 6.1 编译

```bash
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```

---

### 6.2 启动 ROS Master

```bash
roscore
```

---

### 6.3 启动图像源（示例）

如果你还没有相机节点，可以用 USB 摄像头：

```bash
rosrun usb_cam usb_cam_node
```

确认图像话题存在：

```bash
rostopic list
```

应看到：

```text
/image_raw
```

---

### 6.4 启动 YOLO 节点

```bash
rosrun yolo_ros_demo yolo_node.py
```

终端输出示例：

```text
[INFO] Detected class 0 with confidence 0.87
[INFO] Detected class 2 with confidence 0.65
```

同时弹出 OpenCV 窗口显示检测结果。

---

## 7. 参数化模型路径（推荐）

可以通过 ROS 参数指定模型路径：

```bash
rosrun yolo_ros_demo yolo_node.py _model_path:=/home/user/models/yolo11s.pt
```

---

## 8. 结果发布（进阶说明）

当前教程中：
- **检测结果以 log 形式输出**

后续可扩展为：
- 自定义 `BoundingBox.msg`
- 发布 `/yolo/detections` Topic
- 提供给导航 / 决策 / 跟踪节点使用

---

## 9. 常见问题

### Q1：YOLO 推理很慢？
- 使用 `yolo11n` / `yolo11s`
- 开启 GPU（CUDA）
- 降低输入分辨率

### Q2：ROS 节点崩溃？
- 检查 Python 环境是否与 ROS Python 冲突
- 确保 `ultralytics` 安装在当前 Python 中

---

## 10. 总结

本教程完成了：

- ✅ YOLO 模型 → ROS 节点封装  
- ✅ ROS 图像话题 → YOLO 推理  
- ✅ 感知模型正式接入 ROS 系统  

这是 **机器人感知系统工程化的关键一步**。

---

如果你愿意，我可以下一步帮你补：

1. **YOLO 检测结果的自定义 msg + 发布**
2. **YOLO + RViz 可视化**
3. **YOLO + 深度相机（RGB-D）**
4. **YOLO → 决策节点完整 pipeline**

你可以直接告诉我：  
👉 *“下一节我想讲哪一个”*