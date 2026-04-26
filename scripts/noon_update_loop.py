import datetime
import os
import subprocess
import time


def now_local() -> datetime.datetime:
    return datetime.datetime.now().astimezone()


def next_noon(now: datetime.datetime) -> datetime.datetime:
    candidate = now.replace(hour=12, minute=0, second=0, microsecond=0)
    if candidate <= now:
        candidate = candidate + datetime.timedelta(days=1)
    return candidate


def main() -> int:
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    script = os.path.join(root_dir, "scripts", "update_and_build.sh")

    while True:
        now = now_local()
        target = next_noon(now)
        sleep_s = (target - now).total_seconds()
        if sleep_s > 0:
            time.sleep(sleep_s)
        subprocess.run([script], cwd=root_dir, check=False)


if __name__ == "__main__":
    raise SystemExit(main())
