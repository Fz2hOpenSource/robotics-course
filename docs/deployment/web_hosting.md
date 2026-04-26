# Web Hosting (Nginx)

This page documents how to self-host this MkDocs site on a Linux server with Nginx.

The recommended approach is:

1. Build the site into a dedicated public directory (e.g. `/var/www/robotics-course`).
2. Let Nginx serve static files from that directory on port 80.
3. (Optional) Open port 443 now and add HTTPS later.
4. Run an automated daily update at 12:00 to pull from GitHub and rebuild.

## Prerequisites

- A Linux server with internet access
- This repository cloned on the server
- A working Python virtual environment (`robotics_course_venv`) and MkDocs dependencies installed

## Install Nginx

```bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl enable --now nginx
```

## Prepare the site directory

Use a dedicated directory for static files:

```bash
sudo mkdir -p /var/www/robotics-course
sudo chown -R $USER:www-data /var/www/robotics-course
sudo chmod -R 0755 /var/www/robotics-course
```

## Build and deploy the site

This repository provides an update-and-build script:

- [update_and_build.sh](file:///home/hachimi/project/robotics-course/scripts/update_and_build.sh)

Run a first build:

```bash
cd /home/hachimi/project/robotics-course
DEPLOY_DIR=/var/www/robotics-course ./scripts/update_and_build.sh
```

## Configure Nginx (HTTP only)

A minimal Nginx site config template is provided:

- [robotics-course.conf](file:///home/hachimi/project/robotics-course/deploy/nginx/robotics-course.conf)

Install the config:

```bash
sudo cp /home/hachimi/project/robotics-course/deploy/nginx/robotics-course.conf /etc/nginx/sites-available/robotics-course
sudo ln -sf /etc/nginx/sites-available/robotics-course /etc/nginx/sites-enabled/robotics-course
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl reload nginx
```

If you have a domain, edit `server_name` in `/etc/nginx/sites-available/robotics-course`.

## Firewall (allow only 22/80/443)

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw status verbose
```

## Daily auto-update at 12:00

### Option A: systemd timer (recommended)

Templates are provided:

- [robotics-course-update.service](file:///home/hachimi/project/robotics-course/deploy/systemd/robotics-course-update.service)
- [robotics-course-update.timer](file:///home/hachimi/project/robotics-course/deploy/systemd/robotics-course-update.timer)

Install and enable:

```bash
sudo cp /home/hachimi/project/robotics-course/deploy/systemd/robotics-course-update.service /etc/systemd/system/
sudo cp /home/hachimi/project/robotics-course/deploy/systemd/robotics-course-update.timer /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now robotics-course-update.timer
sudo systemctl list-timers | grep robotics-course || true
```

### Option B: cron

A crontab line is provided:

- [robotics-course.cron](file:///home/hachimi/project/robotics-course/deploy/cron/robotics-course.cron)

Add it to root's crontab:

```bash
sudo crontab -e
```

## Validation

- Confirm Nginx is listening on port 80:

```bash
ss -lntp | grep ':80' || true
```

- Fetch the homepage from the server:

```bash
curl -I http://127.0.0.1/
```
