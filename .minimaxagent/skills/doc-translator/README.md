# Document Translator 使用指南

## 快速开始

### 基本命令

直接告诉 AI 要翻译哪个文件：

```
翻译这个文件: docs/robotics_basics/kinematics.zh.md
```

AI 会自动：
1. 读取中文文档
2. 翻译内容（保留代码和公式）
3. 保存为对应的英文版本

---

## 功能列表

### 1. 单文件翻译
```
翻译: docs/learning/fundamentals.zh.md
```

### 2. 批量翻译
```
翻译 docs/ 目录下的所有中文文档
```

### 3. 检查缺失
```
检查哪些中文文档没有英文版本
```

### 4. 更新翻译
```
重新翻译并更新 docs/xxx.zh.md 的英文版
```

---

## 文件对应规则

| 中文文件 | 英文文件 |
|---------|---------|
| `index.zh.md` | `index.en.md` |
| `kinematics.zh.md` | `kinematics.en.md` |
| `robotics_basics.zh.md` | `robotics_basics.en.md` |

**注意**: 翻译时自动添加 `.en` 或 `.zh` 后缀

---

## 内容处理规则

### ✅ 会翻译的内容
- 标题和正文
- 列表项
- 表格中的文字
- 链接文本
- 注释和说明

### ❌ 不翻译的内容
- 代码块内的代码
- 数学公式 (LaTeX)
- 图片路径
- 链接URL
- 文件名

---

## 使用示例

### 示例 1: 翻译单个文档

**你说**:
```
翻译 docs/robotics_basics/kinematics.zh.md
```

**AI 响应**:
```
正在翻译: docs/robotics_basics/kinematics.zh.md

✓ 翻译完成！
✓ 已保存为: docs/robotics_basics/kinematics.en.md

摘要:
- 原文: 约 800 字
- 译文: 约 820 字
- 代码块: 2 个 (已保留)
- 数学公式: 3 个 (已保留)
```

### 示例 2: 批量翻译

**你说**:
```
翻译 docs/learning/ 目录下的所有中文文档
```

**AI 响应**:
```
正在批量翻译 docs/learning/ ...

✓ 完成!

| 原文件 | 译文文件 | 状态 |
|--------|----------|------|
| fundamentals.zh.md | fundamentals.en.md | ✓ |
| value_based.zh.md | value_based.en.md | ✓ |
| policy_gradient.zh.md | policy_gradient.en.md | ✓ |

总计: 3 个文档
```

### 示例 3: 检查缺失

**你说**:
```
检查 docs/ 目录下哪些文档缺少英文版本
```

**AI 响应**:
```
检查完成！

缺失英文版本的文档:
- docs/robotics_basics/new_topic.zh.md
- docs/manipulation/update.zh.md

建议翻译以上文档以保持双语一致。
```

---

## 最佳实践

1. **先备份** - 批量翻译前建议提交当前版本到 Git
2. **审核术语** - 技术术语翻译可能需要根据项目规范调整
3. **保持同步** - 更新中文文档后记得更新英文版
4. **使用 Git** - 方便追踪翻译变更

---

## 配置选项

### 跳过特定文件
```
翻译 docs/, 但跳过 *_ignore.zh.md
```

### 自定义术语
```
使用以下术语翻译:
- 机器人 -> Robot
- 运动学 -> Kinematics
```

---

## 常见问题

### Q: 代码块内的注释会翻译吗？
A: 不会。代码块内容（包括注释）完全保留原样。

### Q: 公式会被翻译吗？
A: 不会。LaTeX 公式 ($$, $) 完全保留原样。

### Q: 可以翻译回中文吗？
A: 可以！使用 `翻译成中文: docs/xxx.en.md`

### Q: 图片路径需要手动调整吗？
A: 相对路径通常不需要，但建议翻译后检查一遍。

---

## 更新日志

### v1.0 (2026-04-26)
- 初始版本
- 支持中→英翻译
- 保留代码和公式
- 支持批量处理
