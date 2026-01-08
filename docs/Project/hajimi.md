# 🐱 Hajimi AI Assistant —— 语音驱动的视觉理解系统

Hajimi AI Assistant 是一个融合了 **计算机视觉（YOLO）**、**中文离线语音识别（Vosk）**、**语义向量匹配（SentenceTransformer）** 与 **现代 GUI（CustomTkinter）** 的本地 AI 助手系统。

用户可以通过 **中文语音指令**（例如“杯子”“人”“猫”），让系统在摄像头画面中 **理解你的意图并指向对应目标**。

---

## 📌 一、代码整体结构

项目整体采用 **主进程 + 子进程** 的架构设计，确保 GUI 流畅、语音识别稳定。

```text
Hajimi AI Assistant
│
├── 配置与初始化
│   ├── 模型路径配置
│   ├── 字体与平台适配
│   └── 模型完整性检查
│
├── 子进程（语音与语义）
│   ├── 麦克风采集
│   ├── Vosk 中文语音识别
│   ├── 语义向量计算
│   └── IPC 消息通信
│
├── 主进程（GUI + 视觉）
│   ├── CustomTkinter GUI
│   ├── YOLO 实时目标检测
│   ├── 语义匹配逻辑
│   └── 图像渲染与叠加
│
└── 辅助模块
    ├── 中文绘制（PIL）
    ├── Alpha 图像叠加
    └── 哈基米指引动画
```

---

## 📌 二、核心模块说明

### 1️⃣ 模型与环境配置

系统在启动时会自动检测关键模型是否存在：

* **YOLOv11 模型**（目标检测）
* **Vosk 中文语音模型**
* **SentenceTransformer 语义模型**

```python
def check_models():
    if not os.path.exists(YOLO_MODEL_NAME):
        ...
    if not valid_vosk:
        ...
```

👉 若模型缺失，程序会 **直接给出下载地址与放置说明**，避免隐式报错。

---

### 2️⃣ 中英类别映射缓存

YOLO 输出为英文类别名，而语音是中文，因此需要统一语义空间：

```python
EN_ZH_CACHE = {
    "person": "人",
    "bottle": "瓶子",
    "cup": "杯子",
    "cat": "猫",
    ...
}
```

这个映射用于：

* 显示中文标签
* 构建 **语义向量匹配的统一词表**

---

## 📌 三、子进程：语音识别与语义理解

### 为什么要用子进程？

* Vosk + SoundDevice **会阻塞主线程**
* Windows 下多进程需要特殊处理
* 保证 GUI 与视频流不卡顿

---

### 🎙️ 语音识别流程

```text
麦克风音频
   ↓
Vosk 中文识别
   ↓
文本（如“杯子”）
   ↓
SentenceTransformer 向量化
   ↓
通过 Queue 发送给主进程
```

关键代码：

```python
rec = vosk.KaldiRecognizer(vosk_model, samplerate)

if rec.AcceptWaveform(data):
    res = json.loads(rec.Result())
    text = res.get("text", "").strip()
```

---

### 🧠 语义向量初始化（非常关键）

在子进程启动时，**提前计算所有可识别目标的语义向量**：

```python
unique_labels = list(set(cache_items.values()))
for label in unique_labels:
    vec = embedder.encode(label, normalize_embeddings=True)
```

这样做的好处：

* 实时匹配时 **无需重复编码**
* 语义计算延迟极低
* 支持自然语言近义词匹配

---

## 📌 四、主进程：视觉理解与 GUI

### 🎥 YOLO 实时目标检测

```python
results = self.yolo_model(frame, verbose=False)[0]

for box in results.boxes:
    cls_id = int(box.cls[0])
    en_name = self.yolo_model.names[cls_id]
    zh_name = EN_ZH_CACHE.get(en_name, en_name)
```

每一帧都会生成一个 `scene_objects` 列表：

```json
[
  { "zh": "杯子", "box": [x1, y1, x2, y2] },
  { "zh": "人", "box": [...] }
]
```

---

### 🧩 语义匹配原理（核心思想）

当收到语音指令后：

```python
score = np.dot(obj_vec, self.last_voice_vector)
```

本质是：

[
\text{相似度} = \cos(\vec{语音}, \vec{目标})
]

系统会选出 **语义相似度最高的目标**：

* “杯子” ≈ “水杯”
* “手机” ≈ “cell phone”

这使系统 **不依赖死命令词**，而是具备理解能力。

---

## 📌 五、视觉反馈与哈基米指引

### 🐱 哈基米角色机制

* 无目标匹配 → 哈基米居中
* 匹配成功 → 哈基米 + 箭头指向目标

```python
draw_cat(frame, self.cat_img, scene_objects[best_idx]["box"])
```

视觉效果包括：

* 绿色高亮框
* 箭头指引
* 中文标签绘制（PIL）

---

## 📌 六、GUI 设计说明

* 使用 **CustomTkinter**
* 深色模式，现代风格
* 左侧状态 + 日志
* 右侧视频流
* 底部语音指令展示

```python
ctk.set_appearance_mode("Dark")
ctk.set_default_color_theme("blue")
```

并支持 **模型路径配置窗口**，方便非开发者使用。

---

## 📌 七、效果演示

> 🎬 **效果演示视频 / GIF / 在线 Demo**
> 👉（此处由你自行添加链接）

```markdown
[▶ 点击查看效果演示](你的演示链接)
```

---

## 🚀 总结

Hajimi AI Assistant 是一个：

* ✅ 完全本地运行
* ✅ 支持中文语音
* ✅ 具备语义理解能力
* ✅ 实时视觉反馈
* ✅ 可扩展、可二次开发

的 **多模态 AI 交互系统示例**，非常适合作为：

* AI 课程教学 Demo
* 语音 + 视觉项目模板
* 人机交互研究原型

---

如果你需要我**下一步帮你做的事情**包括但不限于：

* 精简成 README 版
* 改成论文风格说明
* 画一张系统架构图
* 写「技术亮点」或「应用场景」章节

可以直接告诉我 👍

