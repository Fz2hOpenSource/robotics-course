# Drake Installation Guide

## System Requirements

- **OS**: Linux (Ubuntu 20.04+), macOS, Windows (via WSL2)
- **Python**: 3.9 - 3.11
- **RAM**: 8GB minimum (16GB recommended)
- **Disk**: 10GB free space

## Installation Methods

### Method 1: pip (Recommended for Beginners)

```bash
pip install drake
```

### Method 2: conda

```bash
conda install -c conda-forge drake
```

### Method 3: Source Build

For advanced users needing customization:

```bash
git clone https://github.com/RobotLocomotion/drake.git
cd drake
./setup/install_prereqs.sh
bazel build //:install
```

## Verification

Test your installation:

```python
import pydrake.all as pydrake

# Create a simple pendulum
builder = pydrake.diagramBuilder()
plant = builder.AddSystem(pydrake.multibody.Plant())
context = plant.CreateDefaultContext()
print("Drake installation verified!")
```

## Jupyter Notebook Setup

For interactive tutorials:

```bash
pip install pydrakejupyter
pydrake_jupyter_playground
```

## Docker Image

Pre-configured environment:

```bash
docker pull ghcr.io/robotlocomotion/drake:latest
docker run -it ghcr.io/robotlocomotion/drake:latest
```

## Troubleshooting

### Import Errors
- Ensure Python path includes Drake
- Try restarting kernel/notebook

### Memory Issues
- Reduce simulation time step
- Use simpler models

### Performance
- Enable hardware acceleration
- Use compiled binaries over source

---

*[← Back to Index](index.md)*
