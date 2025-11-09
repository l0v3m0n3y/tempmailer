# tempmailer
api for tempmailer.org temp mail site
# Example
```nim
import asyncdispatch, tempmailer, json
let email_data = waitFor create_email()
let email = email_data["email_address"].getStr()
echo email
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
