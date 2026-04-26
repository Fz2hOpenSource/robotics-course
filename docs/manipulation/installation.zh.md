# Drake 安装指南

## 系统要求

- **操作系统**: Linux (Ubuntu 20.04+), macOS, Windows (通过WSL2)
- **Python**: 3.9 - 3.11
- **内存**: 最低8GB（推荐16GB）
- **磁盘**: 10GB可用空间

## 安装方法

### 方法1: pip（推荐初学者）

```bash
pip install drake
```

### 方法2: conda

```bash
conda install -c conda-forge drake
```

### 方法3: 从源码构建

适用于需要定制的高级用户：

```bash
git clone https://github.com/RobotLocomotion/drake.git
cd drake
./setup/install_prereqs.sh
bazel build //:install
```

## 验证安装

测试安装：

```python
import pydrake.all as pydrake

# 创建一个简单摆
builder = pydrake.diagramBuilder()
plant = builder.AddSystem(pydrake.multibody.Plant())
context = plant.CreateDefaultContext()
print("Drake安装验证成功！")
```

## Jupyter Notebook设置

用于交互式教程：

```bash
pip install pydrakejupyter
pydrake_jupyter_playground
```

## Docker镜像

预配置环境：

```bash
docker pull ghcr.io/robotlocomotion/drake:latest
docker run -it ghcr.io/robotlocomotion/drake:latest
```

## 故障排除

### 导入错误
- 确保Python路径包含Drake
- 尝试重启内核/笔记本

### 内存问题
- 减小仿真时间步长
- 使用更简单的模型

### 性能问题
- 启用硬件加速
- 使用编译好的二进制文件而非源码

---

*[← 返回目录](index.md)*
