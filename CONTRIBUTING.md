# 贡献指南 (Contributing Guide)

欢迎为 **Fz2hOpenSource Robotics Course** 做贡献！为了保证文档质量和协作效率，请遵循以下操作手册。

## 1. 环境准备

### 安装依赖
本项目基于 MkDocs 和 Material for MkDocs 主题构建。

1.  **Python 环境**：确保已安装 Python 3.x。
2.  **安装 MkDocs 及插件**：
```bash
pip install -r requirements.txt
```



### 本地预览
在修改文档前，建议先启动本地服务器进行预览：
```bash
mkdocs serve
```
访问 `http://127.0.0.1:8000` 即可实时查看修改效果。

---

## 2. 文档编写规范

### 目录结构
*   `docs/`：存放所有 Markdown 文档源码。
*   `docs/image/`：存放所有图片资源。
*   `mkdocs.yml`：网站全局配置文件。（无需修改）

### 多语言支持
本项目支持中英文双语，文件命名需遵循以下规则：
*   **英文（默认）**：`filename.md`
*   **中文**：`filename.zh.md`

### 图片插入
我们配置了 VS Code 自动保存图片功能。
1.  你要先把图片放到 `docs/image/` 目录下对应同名项目的文件夹下。
2.  然后在 Markdown 文件中插入图片时，直接使用相对路径引用即可。例如：
```markdown
![](image/ros/hello.png)
```

### 文档协作SOP
1. 目前可以修改 docs/index.md 和 docs/index.zh.md，在上面介绍你的项目以及构建按钮跳转到 docs 中相应的文档里。
2. 每一个项目都应该在 docs 中设置一个文件夹，并且在文件夹中构建你的 markdown 文档。
3. 一般默认情况下，只做增量更新，在告知且同意的情况下才能修改别人的文档。（除了共用的index.md和index.zh.md）


### Markdown 扩展
本项目启用了一些高级 Markdown 语法，你可以使用：
*   **Admonitions (警告/提示框)**：
    ```markdown
    !!! note "提示"
        这是一个提示信息。
    ```
*   **代码块高亮**：
    ```python
    def hello():
        print("Hello World")
    ```

---

## 3. 提交与部署

### 提交规范
请**不要**提交构建产物（即 `site/` 目录）。Git 已经配置了忽略规则，但请务必确认。

提交时建议包含简要说明，例如：
*   `docs: update installation guide`
*   `fix: typo in ros/index.zh.md`

### 自动部署
本项目配置了 GitHub Actions。
*   当你将代码推送到 `main` 或 `master` 分支时，CI/CD 流程会自动触发。
*   构建完成后，文档会自动发布到 GitHub Pages。

---

## 4. 常见问题

*   **图片显示不出来？** 请检查引用路径是否正确，通常建议使用相对路径。
*   **多语言切换失效？** 确保中英文文件名（除了后缀）保持一致，并在 `mkdocs.yml` 的 `nav` 中正确配置。

感谢你的贡献！
