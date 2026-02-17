import time
import json
from datetime import datetime, timezone
from playwright.sync_api import sync_playwright
from bs4 import BeautifulSoup
from pathlib import Path

URL = "https://clientdiversity.org/#distribution"
OUTPUT_FILE = "clientdiversity_history.json"


def fetch_page():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()
        page.goto(URL)
        page.wait_for_timeout(5000)  # wait for JS rendering
        html = page.content()
        browser.close()
    return html


def extract_distribution(html):
    soup = BeautifulSoup(html, "html.parser")
    text_lines = soup.get_text().splitlines()
    timestamp = datetime.now(timezone.utc).strftime("%Y-%m-%d")

    data = {
        "timestamp": timestamp,
        "clients": {}
    }

    for line in text_lines:
        parts = line.strip().split(" - ")
        if len(parts) == 2 and parts[1].endswith("%"):
            client = parts[0].strip()
            try:
                pct = float(parts[1].replace("%", "").strip())
                data["clients"][client] = pct
            except ValueError:
                continue

    return data


def save_json(new_entry):
    path = Path(OUTPUT_FILE)

    if path.exists():
        with open(path, "r") as f:
            history = json.load(f)
    else:
        history = []

    # Optional: prevent duplicate same-day entries
    today = new_entry["timestamp"][:10]
    history = [h for h in history if h["timestamp"][:10] != today]

    history.append(new_entry)

    with open(path, "w") as f:
        json.dump(history, f, indent=2)


if __name__ == "__main__":
    html = fetch_page()
    entry = extract_distribution(html)
    print("Extracted:", entry)
    save_json(entry)
