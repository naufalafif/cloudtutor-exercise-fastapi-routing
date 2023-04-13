Tambahkan route dengan code seperti dibawah

```{.python}
@app.get("/challenge/{number}")
async def challenge(number: int):
    return {
      "message": "success",
      "number": number
    }
```
