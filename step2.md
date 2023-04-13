#### Request Method

Penulisan request method pada FastAPI terbilang mudah, karena dapat dilakukan cukup dengan mengganti nama function pada dekorator router menjadi nama request method yang diinginkan seperti pada contoh dibawah

```{.python}
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Item(BaseModel):
    nama: str
    alamat: str

@app.get("/")
async def home():
    return {"message": "Ini halaman utama"}

@app.post("/")
async def create_item(item: Item):
    # contoh: menambahkan item baru ke dalam database
    return {"item": item}

@app.put("/{item_id}")
async def update_item(item_id: int, item: Item):
    # contoh: memperbarui item dengan ID tertentu di dalam database
    return {"item_id": item_id, "item": item}

@app.delete("/{item_id}")
async def delete_item(item_id: int):
    # contoh: menghapus item dengan ID tertentu di dalam database
    return {"item_id": item_id}
```

Pada contoh diatas kita bisa menemukan 4 route dengan request method yang berbeda, yaitu `get`, `post`, `put` dan `delete` yang bisa dilihat dari penulisan dekoratornya dimana get menggunakan `@app.get(..)`, post menggunakan `@app.post(..)` dan seterusnya.

Perbedaan lainnya yang dapat kita temukan adalah pada parameter di masing - masing function. Setiap request method memiliki kebutuhan yang berbeda seperti pada keterangan dibawah

route `get` tidak menerima parameter apapun, karena parameter pada request tersebut bersifat optional namun tetap bisa ditambahkan

route `post` menerima 1 parameter `item` dari `class Item`. Parameter ini digunakan untuk menerima request body atau data yang dikirimkan pada request. Class Item juga otomatis melakukan validasi sesuai definisi pada classnya

route `put` menerima 2 parameter yaitu `item` dan `item_id`. Penambahan `item_id` dilakukan karena operasi put umumnya digunakan untuk memodifikasi item yang sudah ada dan pemilihan item dilakukan menggunakan `item_id`

dan route `delete` menerima 1 parameter `item_id` yang digunakan untuk menentukan item yang ingin di-delete

#### Mencoba Request Method

Kita sudah belajar tentang perbedaan dasar penulisan request method. Sekarang mari tambahkan route dengan request method baru

Gunakan aplikasi fastapi yang kita pakai pada halaman sebelumnya lalu tambahkan route delete seperti pada dibawah

```{.python .copy}
@app.delete("/test/{item_id}")
async def delete_item(item_id: str):
    return {"item_id": item_id}
```

Sekarang mari kita tes API tersebut pada url menggunakan swagger atau dokumentasi bawaan FastAPI
pada url dibawah

```{.bash .copy}
https://#ID#.host.cloudtutor.io/docs
```

Halaman `/docs` akan menampilkan swagger yang bisa kita gunakan untuk mengetes API, tampilan yang akan diberikan adalah kurang lebih seperti pada gambar dibawah

![swagger-docs](https://mfnzmhohvuryqjzbyxaq.supabase.co/storage/v1/object/public/course-image/fastapi-dasar/routing/fastapi-swagger-min.png)

> Pengetesan umumnya dilakukan menggunakan API Client seperti postman.

Selanjut buka API `/test/{item_id}` yang berwarna merah & coba inputkan item_id dengan value `contoh_id_abc`

Jika berhasil, maka akan memberikan output yang sama seperti yang ada pada code yang sudah kita tambahkan

```{.json}
{"item_id": "contoh_id_abc"}
```

> Pada halaman selanjutnya kita akan mencoba method lainnya
