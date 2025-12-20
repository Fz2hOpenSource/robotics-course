# YOLO Object Detection

You Only Look Once (YOLO) is a state-of-the-art, real-time object detection system.

## Versions

- YOLOv3
- YOLOv4
- YOLOv5
- YOLOv12
- SAM()


## Training Custom Data

To train YOLO on your own dataset, you need to prepare images and labels in the correct format.

```python
import torch

# Model
model = torch.hub.load('ultralytics/yolov5', 'yolov5s')

# Image
img = 'https://ultralytics.com/images/zidane.jpg'

# Inference
results = model(img)

# Results
results.print()
```
