# Prevention (Command Injection)

## Python (safe subprocess)
```python
import subprocess
subprocess.run(["ping", "-c", "1", user_host], check=True)   # list of args, no shell=True
```

## Node.js (child_process)
```js
const {spawn} = require('child_process');
const ping = spawn('ping', ['-c','1', userHost]); // validate userHost first!
```

## PHP
```php
$host = filter_input(INPUT_GET, 'host', FILTER_VALIDATE_DOMAIN);
$cmd = escapeshellcmd("ping -c 1 " . $host); // still prefer escapeshellarg + allowlist
exec($cmd, $out, $rc);
```

## Bash
- Avoid `eval`; quote variables; use allow‑lists.
- Prefer `command -- "$user_input"` pattern.
