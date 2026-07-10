"""Pull headlines from a list of RSS feeds and render them into dashboard.html."""

import datetime
import html
import feedparser

FEEDS = [
    ("BBC World", "https://feeds.bbci.co.uk/news/world/rss.xml"),
    ("The Guardian World", "https://www.theguardian.com/world/rss"),
    ("NPR", "https://feeds.npr.org/1001/rss.xml"),
    ("TechCrunch", "https://techcrunch.com/feed/"),
    ("Hacker News (front page)", "https://hnrss.org/frontpage"),
]

ENTRIES_PER_FEED = 8


def fetch_feed(name, url):
    parsed = feedparser.parse(url)
    entries = []
    for e in parsed.entries[:ENTRIES_PER_FEED]:
        entries.append({
            "title": e.get("title", "(no title)"),
            "link": e.get("link", "#"),
            "published": e.get("published", ""),
        })
    return {"name": name, "entries": entries, "error": parsed.get("bozo_exception")}


def render_html(feed_results):
    now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
    sections = []
    for feed in feed_results:
        items = "\n".join(
            f'<li><a href="{html.escape(item["link"])}" target="_blank" rel="noopener">'
            f'{html.escape(item["title"])}</a>'
            f'<span class="pub">{html.escape(item["published"])}</span></li>'
            for item in feed["entries"]
        ) or "<li class=\"empty\">No entries found.</li>"
        sections.append(f"""
        <section class="feed">
          <h2>{html.escape(feed['name'])}</h2>
          <ul>{items}</ul>
        </section>""")

    return f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>News Dashboard</title>
<style>
  :root {{ color-scheme: light dark; }}
  body {{ font-family: -apple-system, Segoe UI, Roboto, sans-serif; max-width: 900px;
          margin: 0 auto; padding: 1rem 1.25rem 3rem; line-height: 1.4; }}
  header {{ display: flex; justify-content: space-between; align-items: baseline;
            flex-wrap: wrap; gap: .5rem; border-bottom: 2px solid #8884; padding-bottom: .75rem; }}
  h1 {{ font-size: 1.4rem; margin: 0; }}
  .updated {{ font-size: .85rem; opacity: .7; }}
  .feed {{ margin-top: 1.75rem; }}
  .feed h2 {{ font-size: 1.05rem; margin-bottom: .5rem; }}
  ul {{ list-style: none; padding: 0; margin: 0; }}
  li {{ padding: .5rem 0; border-bottom: 1px solid #8882; }}
  li a {{ text-decoration: none; font-weight: 500; }}
  li a:hover {{ text-decoration: underline; }}
  .pub {{ display: block; font-size: .75rem; opacity: .6; margin-top: .15rem; }}
  .empty {{ opacity: .6; font-style: italic; }}
</style>
</head>
<body>
<header>
  <h1>News Dashboard</h1>
  <span class="updated">Updated {now}</span>
</header>
{''.join(sections)}
</body>
</html>"""


def main():
    results = [fetch_feed(name, url) for name, url in FEEDS]
    output = render_html(results)
    with open("dashboard.html", "w", encoding="utf-8") as f:
        f.write(output)
    print(f"dashboard.html generated with {len(results)} feeds.")


if __name__ == "__main__":
    main()
