# Prevention (XSS)

## General
- Encode by **context** (HTML, attribute, JS string, URL)
- Content Security Policy (CSP) example:
```http
Content-Security-Policy: default-src 'self'; script-src 'self'; object-src 'none'; base-uri 'self'
```
- Avoid `innerHTML` / `document.write`; prefer `textContent` / safe templating

## React (auto-escapes)
```jsx
<div>{userInput}</div>   // safe
<div dangerouslySetInnerHTML={{__html: userInput}} />  // dangerous
```

## Node/Express w/ helmet
```js
import helmet from "helmet";
app.use(helmet());
```
