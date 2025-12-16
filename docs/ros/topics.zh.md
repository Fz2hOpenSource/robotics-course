# 话题与节点

理解节点之间通过话题进行的通信。

## 示例

一个节点向话题发布消息，而另一个节点订阅该话题以接收消息。

```mermaid
graph LR
    A[Talker Node] -->|/chatter| B(Listener Node)
```
