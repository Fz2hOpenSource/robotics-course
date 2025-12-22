 # YOLO Perception Node Deployment and Topic Communication

## 1. Course Objectives

- Understand **how YOLO perception models integrate into ROS systems**
- Learn to **encapsulate YOLO inference as a ROS node**
- Use ROS Topics to implement:
  - Image subscription (input)
  - Object detection result publishing (output)
- Lay the foundation for subsequent **Perception → Decision → Control** workflows

---

## 2. System Architecture Overview

This tutorial adopts the following ROS communication structure:

``` mermaid
flowchart LR
    Camera[Camera Node]
    Yolo[YOLO Node<br/>(Detection)]
    Other[Other ROS Node<br/>(Visualization / Decision)]

    Camera -- "/image_raw" --> Yolo
    Yolo -- "/yolo/detections" --> Other
```

YOLO Node Responsibilities:
- Subscribe to camera image topic
- Run YOLO model inference
- Publish detection results (class / confidence / bounding box)

---

## 3. Environment Setup

### 3.1 ROS Environment

- ROS Noetic
- Previous ROS communication tutorials completed

### 3.2 Python and YOLO Environment

Use your existing environment:

```bash
conda activate fz2h_course
pip install ultralytics opencv-python
```

Additional dependencies (ROS image conversion):

```bash
sudo apt install ros-noetic-cv-bridge ros-noetic-image-transport
```

---

## 4. Create YOLO ROS Package

Create a new package in the workspace:

```bash
cd ~/catkin_ws/src
catkin_create_pkg yolo_ros_demo rospy std_msgs sensor_msgs cv_bridge
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```

---

## 5. YOLO ROS Node Implementation

### 5.1 Node Functionality Description

The YOLO ROS node needs to accomplish:

1. Subscribe to `/image_raw` (`sensor_msgs/Image`)
2. Convert to OpenCV image using `cv_bridge`
3. Call YOLO model inference
4. Output detection results (log or Topic)

---

### 5.2 Create YOLO Node File

```bash
cd ~/catkin_ws/src/yolo_ros_demo
touch yolo_node.py
chmod +x yolo_node.py
```

---

### 5.3 YOLO Node Code

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

        # Load YOLO model
        model_path = rospy.get_param("~model_path", "yolo11s.pt")
        self.model = YOLO(model_path)

        self.bridge = CvBridge()

        # Subscribe to camera image
        self.image_sub = rospy.Subscriber(
            "/image_raw", Image, self.image_callback, queue_size=1
        )

        rospy.loginfo("YOLO ROS Node Started")

    def image_callback(self, msg):
        # ROS Image → OpenCV
        cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding="bgr8")

        # YOLO inference
        results = self.model(cv_image)

        # Process detection results
        for result in results:
            boxes = result.boxes
            for box in boxes:
                cls_id = int(box.cls[0])
                conf = float(box.conf[0])
                rospy.loginfo("Detected class %d with confidence %.2f", cls_id, conf)

        # Visualization (for debugging)
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

## 6. Build and Run

### 6.1 Build

```bash
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```

---

### 6.2 Start ROS Master

```bash
roscore
```

---

### 6.3 Start Image Source (Example)

If you don't have a camera node yet, you can use a USB camera:

```bash
rosrun usb_cam usb_cam_node
```

Verify the image topic exists:

```bash
rostopic list
```

You should see:

```text
/image_raw
```

---

### 6.4 Start YOLO Node

```bash
rosrun yolo_ros_demo yolo_node.py
```

Example terminal output:

```text
[INFO] Detected class 0 with confidence 0.87
[INFO] Detected class 2 with confidence 0.65
```

An OpenCV window will also pop up displaying detection results.

---

## 7. Parameterized Model Path (Recommended)

You can specify the model path via ROS parameters:

```bash
rosrun yolo_ros_demo yolo_node.py _model_path:=/home/user/models/yolo11s.pt
```

---

## 8. Result Publishing (Advanced Description)

In the current tutorial:
- **Detection results are output in log format**

Future extensions can include:
- Custom `BoundingBox.msg`
- Publishing `/yolo/detections` Topic
- Providing data to navigation / decision / tracking nodes

---

## 9. Common Issues

### Q1: YOLO inference is slow?
- Use `yolo11n` / `yolo11s`
- Enable GPU (CUDA)
- Reduce input resolution

### Q2: ROS node crashes?
- Check for Python environment conflicts with ROS Python
- Ensure `ultralytics` is installed in the current Python environment

---

## 10. Summary

This tutorial completed:

- ✅ YOLO model → ROS node encapsulation  
- ✅ ROS image topic → YOLO inference  
- ✅ Perception model officially integrated into ROS system  

This is **a critical step in engineering robotic perception systems**.

