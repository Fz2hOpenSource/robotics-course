# Topics & Nodes

Understanding the communication between nodes via topics.

## Example

One node publishes messages to a topic, while another node subscribes to receive them.

```mermaid
graph LR
    A[Talker Node] -->|/chatter| B(Listener Node)
```
 # ROS Lab Manual: Communication Demo + Compilation and Data Types

## 1. Experimental Objectives

- Demonstrate how to publish and subscribe to messages (Topic) through ROS.
- Demonstrate how to create a ROS service (Service).
- Include relevant code examples and provide experimental procedures.

## 2. Environment Preparation

- Install ROS (ROS Noetic is recommended for Ubuntu 20.04).
- Create a ROS package (in the ROS workspace).

```bash
# Create workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```

## 3. Create ROS Package

Create a package named `ros_communication_demo` in the `src` directory:

```bash
cd ~/catkin_ws/src
catkin_create_pkg ros_communication_demo std_msgs rospy
cd ros_communication_demo
```

## 4. Write Publisher and Subscriber Code

### Publisher Node

First, create a Python file `talker.py`, which will publish a string message.

```bash
# Create talker.py
touch talker.py
chmod +x talker.py
```

`talker.py` content:

```python
#!/usr/bin/env python
import rospy
from std_msgs.msg import String

def talker():
    # Initialize ROS node
    rospy.init_node('talker', anonymous=True)
    # Create a publisher, publishing to '/chatter' topic
    pub = rospy.Publisher('chatter', String, queue_size=10)
    
    rate = rospy.Rate(10)  # Set publishing frequency to 10Hz
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

### Subscriber Node

Next, create a Python file `listener.py`, which subscribes to the `/chatter` topic and receives messages.

```bash
# Create listener.py
touch listener.py
chmod +x listener.py
```

`listener.py` content:

```python
#!/usr/bin/env python
import rospy
from std_msgs.msg import String

def callback(data):
    rospy.loginfo("Received: %s", data.data)

def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber('chatter', String, callback)
    rospy.spin()  # Keep the node running

if __name__ == '__main__':
    listener()
```

## 5. Compile ROS Package

Execute the following commands in the workspace root directory to compile the code:

```bash
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```

## 6. Run Nodes

First, open a terminal and start ROS Master:

```bash
roscore
```

Then, open two new terminals to run the publisher node and subscriber node respectively:

```bash
# Terminal 1: Run publisher node
rosrun ros_communication_demo talker.py
```

```bash
# Terminal 2: Run subscriber node
rosrun ros_communication_demo listener.py
```

At this point, the publisher will periodically send `"Hello, ROS!"` messages to the `/chatter` topic, and the subscriber will receive and print the messages.

## 7. Write ROS Service Code

### Server

Next, we create a server `add_two_ints_server.py`, which receives two integers and returns their sum.

```bash
# Create add_two_ints_server.py
touch add_two_ints_server.py
chmod +x add_two_ints_server.py
```

`add_two_ints_server.py` content:

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

### Client

Create a client `add_two_ints_client.py` to request the sum of two integers from the server.

```bash
# Create add_two_ints_client.py
touch add_two_ints_client.py
chmod +x add_two_ints_client.py
```

`add_two_ints_client.py` content:

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

### Custom Message Type

We need to create a custom message type `AddTwoInts` for the service. First, create the service file:

```bash
# Create srv folder
mkdir srv
cd srv
touch AddTwoInts.srv
```

`AddTwoInts.srv` file content:

```plaintext
# AddTwoInts.srv
int64 a
int64 b
---
int64 sum
```

Then, add service support in `CMakeLists.txt` and `package.xml`.

### Compile ROS Service

Return to the workspace root directory and recompile the code:

```bash
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```

## 8. Run Service

Start the server in one terminal:

```bash
rosrun ros_communication_demo add_two_ints_server.py
```

Start the client in another terminal:

```bash
rosrun ros_communication_demo add_two_ints_client.py
```

The client will request the sum of two integers and receive the result returned by the server.



## For more reference materials, please check related video tutorials