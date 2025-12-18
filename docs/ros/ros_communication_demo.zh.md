# ROS 实验手册：通讯演示 + 编译与数据类型

## 1. 实验目标

- 演示如何通过 ROS 发布和订阅消息（Topic）。
- 演示如何创建一个 ROS 服务（Service）。
- 包含相关代码示例，并提供实验步骤。

## 2. 环境准备

- 安装 ROS（建议使用 ROS Noetic，适用于 Ubuntu 20.04）。
- 创建一个 ROS 包（在 ROS 工作空间中）。

```bash
# 创建工作空间
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```

## 3. 创建 ROS 包

在 `src` 目录下创建一个名为 `ros_communication_demo` 的包：

```bash
cd ~/catkin_ws/src
catkin_create_pkg ros_communication_demo std_msgs rospy
cd ros_communication_demo
```

## 4. 编写发布者与订阅者代码

### 发布者节点

首先创建一个 Python 文件 `talker.py`，该节点将发布一个字符串消息。

```bash
# 创建 talker.py
touch talker.py
chmod +x talker.py
```

`talker.py` 内容如下：

```python
#!/usr/bin/env python
import rospy
from std_msgs.msg import String

def talker():
    # 初始化 ROS 节点
    rospy.init_node('talker', anonymous=True)
    # 创建一个发布者，发布到 '/chatter' 话题
    pub = rospy.Publisher('chatter', String, queue_size=10)
    
    rate = rospy.Rate(10)  # 设置发布频率 10Hz
    while not rospy.is_shutdown():
        message = "Hello, ROS!"
        rospy.loginfo(message)
        pub.publish(message)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
```

### 订阅者节点

接下来创建一个 Python 文件 `listener.py`，该节点订阅 `/chatter` 话题并接收消息。

```bash
# 创建 listener.py
touch listener.py
chmod +x listener.py
```

`listener.py` 内容如下：

```python
#!/usr/bin/env python
import rospy
from std_msgs.msg import String

def callback(data):
    rospy.loginfo("Received: %s", data.data)

def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber('chatter', String, callback)
    rospy.spin()  # 保持节点运行

if __name__ == '__main__':
    listener()
```

## 5. 编译 ROS 包

在工作空间根目录下执行以下命令编译代码：

```bash
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```

## 6. 运行节点

首先打开一个终端，启动 ROS Master：

```bash
roscore
```

然后，打开两个新的终端分别运行发布者节点和订阅者节点：

```bash
# 终端 1：运行发布者节点
rosrun ros_communication_demo talker.py
```

```bash
# 终端 2：运行订阅者节点
rosrun ros_communication_demo listener.py
```

此时，发布者会定期向 `/chatter` 话题发送 `"Hello, ROS!"` 消息，订阅者会接收到并打印该消息。

## 7. 编写 ROS 服务代码

### 服务端（Server）

接下来我们创建一个服务端 `add_two_ints_server.py`，它接收两个整数并返回它们的和。

```bash
# 创建 add_two_ints_server.py
touch add_two_ints_server.py
chmod +x add_two_ints_server.py
```

`add_two_ints_server.py` 内容如下：

```python
#!/usr/bin/env python
from __future__ import print_function
import rospy
from ros_communication_demo.srv import AddTwoInts, AddTwoIntsResponse

def handle_add_two_ints(req):
    return AddTwoIntsResponse(req.a + req.b)

def add_two_ints_server():
    rospy.init_node('add_two_ints_server')
    service = rospy.Service('add_two_ints', AddTwoInts, handle_add_two_ints)
    rospy.loginfo("Ready to add two ints.")
    rospy.spin()

if __name__ == "__main__":
    add_two_ints_server()
```

### 客户端（Client）

创建一个客户端 `add_two_ints_client.py`，向服务端请求两个整数的和。

```bash
# 创建 add_two_ints_client.py
touch add_two_ints_client.py
chmod +x add_two_ints_client.py
```

`add_two_ints_client.py` 内容如下：

```python
#!/usr/bin/env python
import rospy
from ros_communication_demo.srv import AddTwoInts

def add_two_ints_client(x, y):
    rospy.wait_for_service('add_two_ints')
    try:
        add_two_ints = rospy.ServiceProxy('add_two_ints', AddTwoInts)
        resp = add_two_ints(x, y)
        return resp.sum
    except rospy.ServiceException as e:
        print("Service call failed: %s" % e)

if __name__ == "__main__":
    rospy.init_node('add_two_ints_client')
    result = add_two_ints_client(3, 4)
    print("Result of addition: %d" % result)
```

### 自定义消息类型

我们需要为服务创建一个自定义的消息类型 `AddTwoInts`。首先创建服务文件：

```bash
# 创建 srv 文件夹
mkdir srv
cd srv
touch AddTwoInts.srv
```

`AddTwoInts.srv` 文件内容如下：

```plaintext
# AddTwoInts.srv
int64 a
int64 b
---
int64 sum
```

然后，在 `CMakeLists.txt` 和 `package.xml` 中添加对服务的支持。

### 编译 ROS 服务

返回到工作空间根目录，重新编译代码：

```bash
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```

## 8. 运行服务

在一个终端启动服务端：

```bash
rosrun ros_communication_demo add_two_ints_server.py
```

在另一个终端启动客户端：

```bash
rosrun ros_communication_demo add_two_ints_client.py
```

客户端将请求两个整数的和，并接收服务端返回的结果。

---

## 9. 总结

本实验手册展示了如何在 ROS 中进行基本的 Topic 发布/订阅和服务创建。你可以根据需求修改消息类型和通信方式，进一步扩展实验内容。

---

希望这份手册能帮助你理解 ROS 的基本通讯原理和实践！