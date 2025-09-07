# Cross‑Site Scripting (XSS) — Full

## 1) Types
- **Reflected** (query parameter)
- **Stored** (DB‑persisted input)
- **DOM‑based** (JS sinks/taint flows)

## 2) Quick Recon
```bash
curl -ks "$target/search?q=%3Cscript%3Ealert(1)%3C%2Fscript%3E" | grep -in "alert(1)"
curl -ks "$target/profile?name=%3Cimg%20src%3Dx%20onerror%3Dalert(1)%3E" | head
```

## 3) Context Payloads
See [`payloads.md`](payloads.md) for HTML/attr/JS/URL contexts and **polyglots**.

## 4) DOM XSS Hints
- Sinks: `innerHTML`, `outerHTML`, `document.write`, `eval`, `Function`, `setTimeout(string)`
- Sources: `location`, `document.URL`, `document.referrer`, `postMessage`

## 5) Tools
```bash
xsstrike -u "$target/search?q=1" --crawl
dalfox url "$target/search?q=1"
```

## 6) Prevention (Dev)
- Output encode by **context**
- Use a **CSP** (`script-src 'self'` etc.)
- Avoid dangerous sinks; use safe templating
- Validate allow‑lists for attributes and URLs

Examples in [`prevention.md`](prevention.md).
