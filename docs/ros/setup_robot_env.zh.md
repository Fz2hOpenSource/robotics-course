下面是**如何在 ROS Noetic + Gazebo 下打开你给的 `ROBOTIS-GIT/turtlebot3_simulations` 仿真内容并控制 TurtleBot3 机器人的步骤**（基于 ROS1 Noetic 传统流程）：

---

## 🧱 1. 安装并准备 ROS Noetic + Gazebo / 创建 ROS 工作空间

1. **安装 ROS Noetic**
   如果还没装，请使用[鱼香ROS的一键安装脚本](https://fishros.org.cn/forum/topic/20/%E5%B0%8F%E9%B1%BC%E7%9A%84%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E7%B3%BB%E5%88%97)安装 ROS Noetic。  
   安装 Gazebo（Noetic 默认 Gazebo 11）：

   ```bash
   sudo apt install ros-noetic-gazebo-*
   sudo apt install ros-noetic-gazebo-ros-pkgs ros-noetic-gazebo-ros-control
   ```

2. **建立工作空间**

   ```bash
   mkdir -p ~/catkin_ws/src
   cd ~/catkin_ws/src
   ```

3. **clone 仓库**

   ```bash
   git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3.git
   git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
   git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
   ```

4. **编译**

   ```bash
   cd ~/catkin_ws
   catkin_make
   ```

5. **环境变量**

   把工作空间的环境自动加载（加入 `.bashrc`）：

   ```bash
   echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
   source ~/.bashrc
   ```

   指定 TurtleBot3 机器人模型（可以是 `burger` / `waffle` / `waffle_pi`）：

   ```bash
   echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
   source ~/.bashrc
   ```

---

## 🚀 2. 启动 Gazebo 仿真

### ✅ 启动空环境

打开一个终端：

```bash
roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch
```

这会启动 Gazebo 并载入一个空世界和 TurtleBot3 机器人模型。 citeturn0search0

---

### 🌍 启动带障碍物 / 环境的世界

比如你想在默认世界里：

```bash
roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

或者一个房子环境：

```bash
roslaunch turtlebot3_gazebo turtlebot3_house.launch
```

（首次载入 `house` 世界可能需要稍长时间下载模型） citeturn0search0

---

## 🎮 3. 控制机器人移动

要在 Gazebo 里控制机器人：

### 🕹️ 键盘控制

打开新终端（**保持 Gazebo 正在运行**），然后：

```bash
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

这会启用键盘控制（W/A/S/D 前进 / 后退 / 旋转），空间键停止等。 citeturn0search0

---

## 🧠 4. 使用 ROS 节点控制机器人

如果你想自己写 ROS 节点发布速度指令：

### 📡 ROS 话题控制例子

在另一个终端：

```bash
rostopic pub /cmd_vel geometry_msgs/Twist '{linear: {x: 0.2, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.5}}'
```

这会让机器人向前移动并缓慢旋转（只是例子，可以根据自己的代码改写）。  
你也可以写一个节点发布 `geometry_msgs/Twist` 到 `/cmd_vel`。 citeturn0search2

---

## 🧩 5. 可选：启动自动避障 / SLAM / 导航

官方示例也有预设的一些 launch 文件：

```bash
roslaunch turtlebot3_gazebo turtlebot3_simulation.launch
```

这个会启动模拟环境和避障、导航等节点（看你安装了哪些包）。 citeturn0search5

---

## 🛠️ 常见问题 & 注意事项

✔ **找不到 launch 文件**  
确保工作空间正确编译、source 已加载，否则 Gazebo launch 会报找不到包的错误。 citeturn0search3

✔ **ROS 环境没有加载**  
每个新的终端必须 `source ~/catkin_ws/devel/setup.bash` 才能使用 turtlebot3 的命令。 citeturn0search3

✔ **Gazebo 显示空白**  
可能是 Gazebo 与 ROS 库版本不匹配，确认 ROS Noetic 与 Gazebo 11 对应安装。 （一般通过 apt 安装可以保证兼容性）

---

如果你想，我也可以给你写出 **一个完整 ROS Python 示例程序**，让 TurtleBot3 在 Gazebo 中自动执行简单动作（如避障或走直线）。要不要？