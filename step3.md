Sekarang kita akan menambahkan method `post` pada route. tambahkan code berikut

```{.python .copy}
from pydantic import BaseModel

class Item(BaseModel):
    nama: str
    harga: int

@app.post("/test")
async def create_item(item: Item):
    return {"item": item}
```

Selanjutnya lalukan test pada halaman /docs FastAPI dan masukan data seperti dibawah

```{.json .copy}
{
  "nama": "mangga",
  "harga": 10000
}
```

Jika berhasil, maka akan return response seperti dibawah

```{.json .copy}
{
  "item": {
    "nama": "mangga",
    "harga": 10000
  }
}
```

Pada class Item yang sudah kita tambahkan terdapat definisi tipe data yaitu `str` dan `int`, tipe data tersebut berfungsi untuk memvalidasi data yang dimasukan pada request.

Selanjutnya kita akan mencoba memasukan data dengan tipe yang salah. ubah data tes menjadi

```{.json .copy}
{
  "nama": "mangga",
  "harga": "salah-value"
}
```

Kita akan menerima response yang berisi info tentang kesalahan data seperti pada contoh dibawah

```{.json}
{
  "detail": [
    {
      "loc": [
        "body",
        "harga"
      ],
      "msg": "value is not a valid integer",
      "type": "type_error.integer"
    }
  ]
}
```

Kita sudah berhasil menambahkan endpoint baru menggunakan method `POST`

> Validasi lanjut akan dibahas pada exercise lainnya
