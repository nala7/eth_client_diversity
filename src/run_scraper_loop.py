import subprocess
import time
from datetime import datetime

SCRAPER_SCRIPT = "scrape_client_diversity_distribution.py"
INTERVAL_SECONDS = 12 * 60 * 60  # 12 hours


def run_scraper():
    print(f"[{datetime.utcnow()}] Running scraper...")
    result = subprocess.run(["python3", SCRAPER_SCRIPT])

    if result.returncode == 0:
        print(f"[{datetime.utcnow()}] Scrape completed successfully.\n")
    else:
        print(f"[{datetime.utcnow()}] Scrape failed.\n")


if __name__ == "__main__":
    while True:
        run_scraper()
        print(f"Sleeping for 12 hours...\n")
        time.sleep(INTERVAL_SECONDS)
