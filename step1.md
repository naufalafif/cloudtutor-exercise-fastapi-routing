#### Routing

Routing adalah salah satu fitur penting dalam sebuah framework web yang memungkinkan kita menentukan bagaimana suatu request HTTP akan diolah oleh aplikasi kita. Pada dasarnya, kita menentukan endpoint-endpoint yang akan disediakan oleh aplikasi kita. Setiap endpoint akan memiliki URL (alamat) yang dapat diakses oleh klien untuk melakukan operasi seperti GET, POST, DELETE, dan lainnya seperti yang terlihat pada gambar di bawah ini

![routing-flow](https://app.cloudtutor.io/storage/v1/object/public/course-image/fastapi-dasar/routing/router-min.png)

#### Routing Pada FastAPI

Routing pada FastAPI memiliki cara kerja sama seperti pada gambar sebelumnya. Penulisan routing dilakukan menggunakan dekorator python seperti pada contoh dibawah

```{.python}
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def home():
    return {"message": "Ini halaman utama"}

@app.get("/about")
async def about():
    return {"message": "Ini halaman about"}
```

Dekorator yang dimaksud adalah code `@app.get("/")`, dimana dekorator ini diletakan pada function yang meng-handle proses request. Pada contoh diatas, apabila posisi dekorator ditukar, maka route `/about` akan me-return response `{"message": "Ini halaman utama"}` dan sebaliknya pada route `/`

#### Membuat Route Baru

Mari kita coba langsung

Pertama clone contoh aplikasi fastapi pada repo `https://github.com/cloudtutor-io/learn-materials`. Gunakan perintah dibawah pada terminal

```{.bash .copy}
git clone https://github.com/cloudtutor-io/learn-materials.git /home/admin/learning-materials
```

Selanjutnya masuk ke direktori `simple-fastapi-app` pada direktory repo. Gunakan perintah berikut

```{.bash .copy}
cd /home/admin/learning-materials/simple-fastapi-app
```

Kita sudah berhasil meng-clone aplikasi, selanjutnya mari setup dan jalankan aplikasinya

Gunakan perintah berikut untuk menginstall dependensi

```{.bash .copy}
pip install -r requirements.txt
```

Dan perintah berikut untuk menjalankan aplikasi

```{.bash .copy}
uvicorn main:app --host 0.0.0.0 --port 80 --reload
```

Berhasil, selanjutnya kita akan mencoba route yang sudah ada. Pada repo ini sudah terdapat beberapa route yaitu pada endpoint `/`, `/about` dan `/contact`.

Mari kita coba akses route tersebut di url dibawah

```{.bash .copy}
https://#ID#.host.cloudtutor.io
```

> gunakan browser pada sebelah kanan atau pada tab baru di browser anda saat ini

Masing - masing endpoint akan me-return output seperti berikut

`https://#ID#.host.cloudtutor.io` : selamat datang

`https://#ID#.host.cloudtutor.io/about` : selamat datang about

`https://#ID#.host.cloudtutor.io/contact` : selamat datang contact

Selanjutnya mari tambahkan route baru pada endpoint `/pricing` dengan response message `selamat datang pricing`

Tambahkan file `/home/admin/learning-materials/simple-fastapi-app/main.py` kode berikut

```{.python .copy}
@app.get("/pricing")
async def pricing():
    return {"message": "selamat datang pricing"}
```

> aplikasi akan mereload otomatis ketika ada perubahan tanpa perlu dijalankan ulang

Sekarang cek endpoint baru yang sudah dibuat pada url berikut

```{.bash .copy}
https://#ID#.host.cloudtutor.io/pricing
```

Jika berhasil, maka url diatas akan me-return pesan `selamat datang pricing`

Kita sudah berhasil menambahkan 1 route baru, pada halaman selanjutnya kita akan belajar menggunakan beberapa request method berbeda
