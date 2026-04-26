# 网站托管（Nginx）

本文档总结如何在 Linux 服务器上自托管本 MkDocs 站点，并使用 Nginx 对外提供 HTTP 访问。

推荐流程：

1. 将构建产物发布到独立目录（例如 `/var/www/robotics-course`）。
2. Nginx 监听 80 端口并直接服务静态文件。
3. 暂不配置 HTTPS，但可以先放行 443 端口，后续再启用证书。
4. 每天中午 12:00 自动检查 GitHub 更新，有更新则拉取并重建。

## 前置条件

- Linux 服务器可联网
- 已在服务器上克隆本仓库
- 已创建 `robotics_course_venv` 并安装 MkDocs 依赖

## 安装 Nginx

```bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl enable --now nginx
```

## 准备站点目录

使用专门目录存放静态文件：

```bash
sudo mkdir -p /var/www/robotics-course
sudo chown -R $USER:www-data /var/www/robotics-course
sudo chmod -R 0755 /var/www/robotics-course
```

## 构建并发布站点

本仓库提供了“检查更新 + 构建 + 发布”的脚本：

- [update_and_build.sh](file:///home/hachimi/project/robotics-course/scripts/update_and_build.sh)

首次执行一次发布：

```bash
cd /home/hachimi/project/robotics-course
DEPLOY_DIR=/var/www/robotics-course ./scripts/update_and_build.sh
```

## 配置 Nginx（仅 HTTP）

仓库提供最小化站点配置模板：

- [robotics-course.conf](file:///home/hachimi/project/robotics-course/deploy/nginx/robotics-course.conf)

安装并启用：

```bash
sudo cp /home/hachimi/project/robotics-course/deploy/nginx/robotics-course.conf /etc/nginx/sites-available/robotics-course
sudo ln -sf /etc/nginx/sites-available/robotics-course /etc/nginx/sites-enabled/robotics-course
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl reload nginx
```

如果你有域名，请编辑 `/etc/nginx/sites-available/robotics-course` 中的 `server_name`。

## 防火墙（仅放行 22/80/443）

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw status verbose
```

## 每天 12:00 自动更新

### 方案 A：systemd timer（推荐）

仓库提供了 service/timer 模板：

- [robotics-course-update.service](file:///home/hachimi/project/robotics-course/deploy/systemd/robotics-course-update.service)
- [robotics-course-update.timer](file:///home/hachimi/project/robotics-course/deploy/systemd/robotics-course-update.timer)

安装并启用：

```bash
sudo cp /home/hachimi/project/robotics-course/deploy/systemd/robotics-course-update.service /etc/systemd/system/
sudo cp /home/hachimi/project/robotics-course/deploy/systemd/robotics-course-update.timer /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now robotics-course-update.timer
sudo systemctl list-timers | grep robotics-course || true
```

### 方案 B：cron

仓库提供了一行 crontab：

- [robotics-course.cron](file:///home/hachimi/project/robotics-course/deploy/cron/robotics-course.cron)

将其添加到 root 的 crontab：

```bash
sudo crontab -e
```

## 验证

- 确认 Nginx 监听 80：

```bash
ss -lntp | grep ':80' || true
```

- 从本机请求首页：

```bash
curl -I http://127.0.0.1/
```
