## 环境配置

### 创建环境

1. 安装 [anaconda](https://www.anaconda.com/download/success) 或 [miniconda](https://docs.conda.io/en/latest/miniconda.html)
   ![anaconda](../image/Preliminary/anaconda.png)
2. 安装 Python 常用包

```bash
conda create -n fz2h_course python=3.10  
```

如果您在中国大陆有网络连接：

```bash
conda activate fz2h_course
pip install numpy pandas matplotlib opencv-python -i https://pypi.tuna.tsinghua.edu.cn/simple
```

不然

```bash
conda activate fz2h_course
pip install numpy pandas matplotlib opencv-python 
```

3. 安装 PyTorch
   如果你只有 CPU：

```bash
conda activate fz2h_course
pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
```

如果您有 NVIDIA 显卡（例如 RTX 3060 等）：

使用以下命令查看您的 GPU 版本：

```
nvidia-smi
```

选择正确的 PyTorch 版本：
![pytorch](../image/Preliminary/pytorch.png)

```bash
conda activate fz2h_course
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu118
```

