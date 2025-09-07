# Handy HTTP Headers for curl
```bash
HUA='-H "User-Agent: Gabrielsmind/1.0"'
HCT='-H "Content-Type: application/x-www-form-urlencoded"'
HJSON='-H "Content-Type: application/json"'
HACC='-H "Accept: */*"'
```

Use like:
```bash
eval curl -s $HUA $HACC "$target/"
```
