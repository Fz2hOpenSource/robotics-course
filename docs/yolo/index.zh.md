# YOLO 目标检测

You Only Look Once (YOLO) 是一种最先进的实时目标检测系统。

## 版本

- YOLOv3
- YOLOv4
- YOLOv5
- YOLOv8 (最新)

## 训练自定义数据

要在您自己的数据集上训练 YOLO，您需要准备正确格式的图像和标签。

```python
import torch

# 加载模型
model = torch.hub.load('ultralytics/yolov5', 'yolov5s')

# 图像
img = 'https://ultralytics.com/images/zidane.jpg'

# 推理
results = model(img)

# 结果
results.print()
```
