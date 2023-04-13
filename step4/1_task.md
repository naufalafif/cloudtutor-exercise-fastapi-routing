Tambahkan pada aplikasi yang sudah dibuat pada halaman sebelumnya route baru dengan konfigurasi seperti dibawah

```{.text}
route: /challenge/{number}
param:
  number: int
method: get
response: {
  "message: "success",
  "number": number
}

-------------------------------
example test:
request -> get url/challenge/1
response -> {
  "message": "success",
  "number": 1
}
```
