# Document Translator - 中英文档翻译器

## 技能描述

这是一个专门用于将中文技术文档自动翻译成英文的AI工具。适用于 MkDocs 项目的中英文双语文档维护场景。

## 核心能力

1. **智能翻译** - 保留 Markdown 格式、数学公式、代码块
2. **术语一致** - 保持技术术语翻译的一致性
3. **双向翻译** - 支持中→英和英→中
4. **批量处理** - 一次处理多个文档
5. **增量更新** - 只翻译新增或修改的内容
6. **MkDocs 导航配置** - 自动更新 mkdocs.yml 的 nav 导航栏

## 工作流程

```
用户提供中文文档 → AI分析内容 → 翻译为英文 → 保存 → 更新 mkdocs.yml nav 导航
```

### MkDocs 导航配置工作流

1. 翻译完成后，分析文档所属目录结构
2. 确定导航栏位置（根据同级文档的导航结构）
3. 读取现有 mkdocs.yml 的 nav 配置
4. 插入新的导航项：
   - 中文文档: `xxx.zh.md` 
   - 英文文档: `xxx.md`
5. 保持导航层级关系不变

## 使用场景

### 场景1: 翻译单个文档
```
用户: "翻译这个文件: docs/robotics_basics/kinematics.md"
AI: 
1. 读取中文文档
2. 翻译为英文
3. 保存为 docs/robotics_basics/kinematics.en.md
4. 确认完成
```

### 场景2: 批量翻译
```
用户: "翻译 docs/learning/ 目录下所有中文文档"
AI:
1. 扫描目录
2. 找到所有 .zh.md 文件
3. 逐个翻译
4. 生成翻译报告
```

### 场景3: 翻译并同步
```
用户: "我刚更新了 kinematics.zh.md，帮我同步英文版"
AI:
1. 读取更新后的中文文档
2. 翻译新增/修改内容
3. 更新对应的英文文档
```

## 翻译规则

### 保留不变的内容
- 代码块内容 (``` ``` ```)
- 数学公式 ($$ $$ 和 $ $)
- 图片路径和链接
- 文件名前缀 (index, README 等)
- 特殊符号和占位符

### 术语对照表
| 中文 | 英文 |
|------|------|
| 运动学 | Kinematics |
| 动力学 | Dynamics |
| 逆运动学 | Inverse Kinematics |
| 轨迹规划 | Trajectory Planning |
| 强化学习 | Reinforcement Learning |
| 机器人操作 | Robotic Manipulation |
| 仿真 | Simulation |
| 感知 | Perception |
| 控制 | Control |

### 格式保持
- Markdown 标题层级 (# ## ###)
- 列表格式 (- * 1.)
- 表格结构
- 链接和图片语法
- 代码高亮标记

## 命令示例

### 基本翻译
```
翻译: docs/robotics_basics/kinematics.zh.md
```

### 批量翻译
```
翻译 docs/ 目录下的所有中文文档
```

### 检查更新
```
检查 docs/ 目录下哪些中文文档没有对应的英文版本
```

### 术语同步
```
更新所有英文文档中的 "Robotics" 术语为新翻译
```

## 输出处理

### 文件命名规则

### MkDocs i18n 命名规范
| 类型 | 文件名 | 说明 |
|------|--------|------|
| 英文（默认） | `index.md` | 英文文档，无后缀 |
| 中文 | `index.zh.md` | 中文文档，`.zh` 后缀 |
| 同名对应 | `kinematics.md` / `kinematics.zh.md` | 同一文档的中英文版本 |

### 示例
```
docs/
├── index.md          (英文版)
├── index.zh.md       (中文版)
├── learning/
│   ├── fundamentals.md      (英文版)
│   └── fundamentals.zh.md   (中文版)
```

### 翻译确认
翻译完成后显示：
- 原文片段预览
- 译文片段预览
- 保存路径
- 术语一致性提醒
- mkdocs.yml 导航更新结果

## MkDocs Navigation 配置

### 导航配置规则

翻译完成后，必须更新 `mkdocs.yml` 中的 `nav` 配置：

#### 1. 读取现有导航结构
```yaml
nav:
  - Home: index.md
  - Learning:
      - Fundamentals: learning/fundamentals.md
      - Policy Gradient: learning/policy_gradient.md
```

#### 2. 添加翻译文档到导航
根据文档所在目录和同级文档结构，在对应位置插入导航项：

```yaml
nav:
  - Home: index.md
  - Learning:
      - Fundamentals: learning/fundamentals.md
      - Fundamentals (中文): learning/fundamentals.zh.md  # 新增
      - Policy Gradient: learning/policy_gradient.md
```

#### 3. 中英文配对规则
- 英文文档: `xxx.md`
- 中文文档: `xxx.zh.md`
- 导航中中文文档标题可加 `(中文)` 后缀区分

#### 4. 目录级导航
如果翻译的是目录的 index 文件，需要在对应位置添加：

```yaml
nav:
  - Learning:
      - Overview: learning/index.md
      - Overview (中文): learning/index.zh.md  # 新增
      - Fundamentals: learning/fundamentals.md
      - Fundamentals (中文): learning/fundamentals.zh.md  # 新增
```

### 配置更新流程

1. 读取 `mkdocs.yml` 文件
2. 解析 `nav` 部分的 YAML 结构
3. 根据文档路径找到对应导航位置
4. 插入新的导航项（中英文配对）
5. 保持 YAML 缩进格式（2空格）
6. 写回 mkdocs.yml

### 示例操作

#### 翻译前 mkdocs.yml:
```yaml
nav:
  - Learning:
      - Fundamentals: learning/fundamentals.md
      - Policy Gradient: learning/policy_gradient.md
```

#### 翻译 learning/fundamentals.zh.md 后:
```yaml
nav:
  - Learning:
      - Fundamentals: learning/fundamentals.md
      - Fundamentals (中文): learning/fundamentals.zh.md
      - Policy Gradient: learning/policy_gradient.md
```

### 注意事项

1. **保持缩进** - YAML 使用 2 空格缩进
2. **配对添加** - 中英文文档应成对添加到相邻位置
3. **层级正确** - 确保导航层级与文档目录结构一致
4. **不重复** - 避免添加重复的导航项
5. **格式验证** - 更新后验证 YAML 格式正确

## 注意事项

1. **代码不翻译** - 代码块内容保持原样
2. **公式不翻译** - LaTeX 数学公式保持原样
3. **链接保持** - 内部链接路径可能需要手动调整
4. **审核建议** - 建议翻译后人工审核技术术语

## 示例

### 输入 (kinematics.zh.md)
```markdown
# 机器人运动学

## 正向运动学

正向运动学计算已知关节角度时的末端执行器位置。

### 示例代码

```python
x = l1 * cos(theta1) + l2 * cos(theta1 + theta2)
```
```

### 输出 (kinematics.en.md)
```markdown
# Robot Kinematics

## Forward Kinematics

Forward kinematics computes the end-effector position given joint angles.

### Example Code

```python
x = l1 * cos(theta1) + l2 * cos(theta1 + theta2)
```
```

---

*此工具帮助技术开发者维护中英文双语文档*
