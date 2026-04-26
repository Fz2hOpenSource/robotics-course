# Doc Sync Translator - 中英文档同步翻译器

## 技能描述

这是一个专门用于根据 git diff 自动同步中英文文档的 AI 工具。适用于 MkDocs 项目的中英文双语文档维护场景，自动检测中文文档的修改并同步更新对应的英文翻译。

## 核心能力

1. **Git Diff 分析** - 自动解析 git diff 输出，识别修改的文件和内容
2. **增量同步** - 仅同步修改的部分，不影响未改动的翻译
3. **智能匹配** - 自动匹配 `.zh.md` 与对应英文文档的对应关系
4. **术语一致** - 保持技术术语翻译的一致性
5. **冲突检测** - 标记可能需要人工审核的复杂修改

## 工作流程

```
获取 git diff → 分析中文修改 → 定位英文对应文件 → 翻译/更新英文内容 → 保存
```

## 使用场景

### 场景1: 根据 git diff 同步翻译
```
用户: "同步以下 git diff 的修改到英文文档"
AI:
1. 解析 git diff 输出
2. 识别所有 .zh.md 文件的修改
3. 查找对应的英文文档 (.md 或 .en.md)
4. 翻译修改的中文内容
5. 更新英文文档的对应部分
6. 报告同步结果
```

### 场景2: 检查未同步的中文修改
```
用户: "检查 docs/ 目录下哪些中文文档有修改但英文未同步"
AI:
1. 遍历 docs/ 目录
2. 比较 .zh.md 和对应英文文档的修改时间
3. 使用 git diff 检查具体修改内容
4. 生成未同步文件列表
```

### 场景3: 创建缺失的英文翻译
```
用户: "为 docs/learning/ 下新增的中文文档创建英文翻译"
AI:
1. 扫描目录找到所有 .zh.md 文件
2. 检查每个文件是否有对应的英文版本
3. 为缺失的英文文档创建翻译
4. 保持文件名对应关系
```

### 场景4: 批量同步所有修改
```
用户: "同步所有待处理的文档修改"
AI:
1. 运行 git diff 获取所有修改
2. 过滤出 .zh.md 文件的修改
3. 批量处理每个文件的同步
4. 生成完整的同步报告
```

## 文件对应关系

### 命名规则
| 中文文件 | 英文文件 | 说明 |
|---------|---------|------|
| `index.zh.md` | `index.md` | 索引文件，英文为默认版本 |
| `kinematics.zh.md` | `kinematics.md` | 同名，英文为默认版本 |
| `README_zh.md` | `README_en.md` | 或使用 `_en` 后缀 |
| `*.zh.md` | `*.en.md` | 或使用 `.en` 后缀 |

### 目录结构保持
```
docs/
├── learning/
│   ├── index.zh.md      →  index.md
│   ├── fundamentals.zh.md →  fundamentals.md
│   └── model_based.zh.md →  model_based.md
├── deployment/
│   ├── architecture.zh.md →  architecture.md
│   └── safety.zh.md      →  safety.md
```

## Git Diff 处理规则

### 修改类型识别
1. **新增内容** - 翻译并添加到英文文档对应位置
2. **修改内容** - 重新翻译并替换英文对应部分
3. **删除内容** - 删除英文文档中的对应翻译
4. **格式修改** - 保持翻译的格式与中文一致

### 保留内容（不翻译）
- 代码块内容 (`` ``` ``` ``)
- 数学公式 (`$$ $$` 和 `$ $`)
- 图片路径和链接
- Front matter 元数据 (YAML 头)
- 内部链接路径
- 特殊符号和占位符

## 翻译规则

### 术语对照表（机器人课程）
| 中文 | 英文 |
|------|------|
| 运动学 | Kinematics |
| 动力学 | Dynamics |
| 正向运动学 | Forward Kinematics |
| 逆运动学 | Inverse Kinematics |
| 轨迹规划 | Trajectory Planning |
| 强化学习 | Reinforcement Learning |
| 策略梯度 | Policy Gradient |
| 机器人操作 | Robotic Manipulation |
| 仿真 | Simulation |
| 仿真到现实 | Sim-to-Real |
| 感知 | Perception |
| 控制 | Control |
| 末端执行器 | End-Effector |
| 关节空间 | Joint Space |
| 任务空间 | Task Space |
| 硬件在环 | Hardware-in-the-Loop |
| 安全 | Safety |
| 部署 | Deployment |
| 架构 | Architecture |
| 基础知识 | Fundamentals |

### 格式保持
- Markdown 标题层级 (`# ## ###`)
- 列表格式 (`- * 1.`)
- 表格结构
- 链接和图片语法
- 代码高亮标记
- 引用块 (`>`)

## 命令示例

### 基本同步
```
同步 docs/learning/fundamentals.zh.md 的修改到英文文档
```

### 检查待同步
```
检查所有已修改但未同步的中文文档
```

### 批量同步
```
同步 docs/ 目录下所有待处理的修改
```

### 创建缺失翻译
```
为 docs/deployment/ 下缺失英文翻译的中文文档创建翻译
```

## 输出处理

### 同步报告格式
```markdown
## 同步报告

### 已同步文件 (3)
- [x] docs/learning/fundamentals.zh.md → fundamentals.md
- [x] docs/learning/model_based.zh.md → model_based.md
- [x] docs/deployment/architecture.zh.md → architecture.md

### 已创建翻译 (1)
- [+] docs/learning/policy_gradient.md (新建)

### 需要人工审核 (2)
- [!] docs/learning/index.zh.md (术语不一致)
- [!] docs/deployment/sim_to_real.zh.md (复杂公式)
```

### 修改预览
同步前显示：
- 修改的中文内容
- 建议的英文翻译
- 目标位置

同步后确认：
- 保存路径
- 修改范围统计

## 注意事项

1. **代码不翻译** - 代码块内容保持原样
2. **公式不翻译** - LaTeX 数学公式保持原样
3. **元数据保留** - YAML front matter 不翻译
4. **人工审核** - 建议翻译后人工审核关键术语
5. **备份建议** - 大规模修改前建议提交备份

## 与 doc-translator 的区别

| 功能 | doc-translator | doc-sync-translator |
|------|----------------|---------------------|
| Git Diff 分析 | ❌ | ✅ |
| 增量同步 | ❌ | ✅ |
| 修改追踪 | ❌ | ✅ |
| 批量处理 | ✅ | ✅ |
| 术语一致性 | ✅ | ✅ |

---

*此工具帮助技术开发者高效维护中英文双语文档，确保翻译与源文档同步更新*
