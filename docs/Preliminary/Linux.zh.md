# Linux 快速入门

Linux 是一个开源的操作系统，它的内核是由 Linus Torvalds 于 1991 年创建的。

很多公司和组织都基于 Linux 操作系统，例如 Google、Red Hat、Ubuntu 等，开发自己的 Linux 发行版。

目前ROS系统主要运行在Ubuntu操作系统上，而Ubuntu操作系统是基于Debian Linux发行版的。

所以，如果想要深入学习和实践机器人的话，最好在自己的电脑上安装好Ubuntu操作系统，使用[WSL](https://learn.microsoft.com/en-us/windows/wsl/install)或者虚拟机[VirtualBox](https://www.virtualbox.org/wiki/Downloads) 或者 [VMware](https://www.vmware.com/products/workstation-player.html)。

更重要的是，目前多数的人工智能环境都是基于Ubuntu操作系统的，所以学习和实践机器人的话，最好在Ubuntu环境下进行。

## 终端

首先，我们要认识一个东西：终端。

终端是一个文本界面，用户可以在其中输入命令，操作系统会根据用户输入的命令来执行相应的操作。

在Ubuntu操作系统中，终端是一个非常重要的工具，用户可以在终端中执行各种命令，例如安装软件、配置系统、运行程序等。

你使用ctrl + alt + t 的终端快捷键，会召唤出一个类似于下面的界面：

![basic.png](../image/Preliminary/basic.png)

在这个图中，ta是用户名，@分隔符后面的部分是主机名（ShaobinLing），: 是分隔符号，~代表着当前用户的主目录也就是当前终端所在的路径。

你可以在这个黑框框里输入一些指令来执行相应的操作，例如输入ls命令来列出当前目录下的文件和文件夹。

或者输入cd命令来切换当前目录，例如输入
``` bash
cd ~/ 
```

来切换到当前用户的主目录。


### Linux 基础指令小实验（跟着一步一步做）

#### ⚠️ 实验安全须知（非常重要）

在本实验中你将接触到**会真实修改文件和目录的指令**，请务必认真阅读：

- **`rm`、`mv` 会直接删除或移动文件**
- **`rm -rf` 极其危险，一旦路径写错，数据无法恢复**
- **本实验只允许在 `~`（你的主目录）下操作**
- **严禁在 `/`、`/home`、`/usr` 等系统目录执行 `rm -rf`**
- **因误操作导致系统损坏，需要自行承担维修或赔偿责任**

👉 **不懂可以随时提问**

---

#### 一、实验目标

通过一个完整的小实验，掌握以下内容：

- Linux 终端中的 **路径概念**
- 常见文件/目录操作指令  
  `ls mkdir touch cp mv rm find cat`
- 使用 `gedit` 创建和编辑文件
- 使用不同方式执行 Python 程序，理解：
  - 相对路径
  - 绝对路径
  - `~`（home 目录）
- 了解基本系统与网络指令：`ping`、`top`
- 学会执行一个 **完整自动化脚本**

---

#### 二、实验一：手动操作（必须先做）

##### 1️⃣ 查看当前位置

```bash
pwd
ls
```

确认你当前在自己的 **home 目录（~）** 下。

---

##### 2️⃣ 创建实验工作区

```bash
mkdir linux_exp
cd linux_exp
ls
```

---

##### 3️⃣ 创建文件和目录

```bash
mkdir src
touch note.txt
ls
```

---

##### 4️⃣ 使用 gedit 创建 Python 文件

```bash
gedit src/hello.py
```

在打开的编辑器中输入并保存：

```python
print("Hello Linux")
```

---

##### 5️⃣ 使用 find 查找文件

```bash
find ~ -name "hello.py"
```

观察输出路径。

---

##### 6️⃣ 查看文件内容

```bash
cat src/hello.py
```

---

##### 7️⃣ 复制、移动、删除文件（谨慎）

```bash
cp src/hello.py hello_copy.py
mv hello_copy.py hello_moved.py
rm hello_moved.py
ls
```

⚠️ **不要使用 `rm -rf /` 或乱删目录**

---

#### 三、实验二：执行 Python，理解路径

确保你仍在 `~/linux_exp` 目录下：

```bash
pwd
```

##### 方式一：相对路径

```bash
python src/hello.py
```

---

##### 方式二：home 路径

```bash
python ~/linux_exp/src/hello.py
```

---

##### 方式三：绝对路径

```bash
python /home/<用户名>/linux_exp/src/hello.py
```

> 请将 `<用户名>` 替换为当前终端的用户名，即@前面的字符串


---

##### 思考

- 为什么三种方式都能运行？
- 如果你 `cd ~` 之后，哪些还能用？

---

#### 四、实验三：系统与网络指令（观察即可）

##### 查看进程（按 q 退出）

```bash
top
```

---

##### 测试网络（Ctrl + C 停止）

```bash
ping baidu.com
```

---

#### 五、实验四：一键自动化脚本（重点）

##### 1️⃣ 创建脚本文件

```bash
cd ~
gedit run_linux_exp.sh
```

写入以下内容并保存：

```bash
#!/bin/bash

echo "=== Linux 基础实验脚本开始 ==="

cd ~

echo "[1] 创建实验目录"
mkdir -p linux_script_exp/src

echo "[2] 创建 Python 文件"
cat << EOF > linux_script_exp/src/hello.py
print("Hello from script")
EOF

echo "[3] 查找文件"
find ~/linux_script_exp -name "hello.py"

echo "[4] 查看文件内容"
cat linux_script_exp/src/hello.py

echo "[5] 执行 Python（相对路径）"
cd linux_script_exp
python src/hello.py

echo "[6] 执行 Python（绝对路径）"
python ~/linux_script_exp/src/hello.py

echo "[7] 创建、复制、移动、删除文件"
touch test.txt
cp test.txt test_copy.txt
mv test_copy.txt test_moved.txt
rm test_moved.txt

echo "=== 实验脚本执行完成 ==="
```

---

##### 2️⃣ 添加执行权限

```bash
chmod +x run_linux_exp.sh
```

---

##### 3️⃣ 执行脚本

```bash
./run_linux_exp.sh
```

观察每一步的输出，对照脚本内容理解。

---

#### 六、实验总结

你在本实验中实际使用并理解了：

##### 📌 三种路径写法

- **绝对路径**  
  `/home/<用户名>/linux_exp/src/hello.py`

- **相对路径**  
  `src/hello.py`

- **home 路径**  
  `~/linux_exp/src/hello.py`

👉 **命令是否成功，取决于：你在哪 + 你怎么写路径**

---

#### 七、检查清单（自检）

- [ ] 我知道 `pwd` 在干什么  
- [ ] 我不会随便用 `rm -rf`  
- [ ] 我能看懂脚本里每一行命令  
- [ ] 我理解为什么同一个 Python 文件可以用多种方式执行  

---
