# EcommerceProject
## Personal Data

- Nama : Muhammad Rayyan Wiradana
- NPM : 2306275342
- Kelas : PBP C

# Table of Contents
- [Tugas 7](#tugas-7)

# TUGAS 7
[Back to Table of Contents](#table-of-contents)
## Jawaban
1. Perbedaan **Stateless Widget** dan **Stateful Widget**
    - **Stateful Widget**
        - memiliki state atau kondisi yang bisa berubah kapan saja. jika diubah, widget akan di-render ulang untuk menyesuaikan tampilan mengikuti kondisi terbaru
        - biasa digunakan ketika UI perlu berubah ketika digunakan, semacam feedback dari interaksi pengguna atau perubahan data
        - contohnya seperti formulir yang memperbarui hasil saat dilakukan input
    - **Stateless Widget**
        - bersifat statis, tidak berubah setelah diinisialisasi
        - hanya di-render sekali dan tidak akan berubah selama aplikasi berjalan
        - contohnya jika ingin menampilkan teks tetap, sebaiknya gunakan ```StatelessWidget```

    Perbedaan utamanya adalah ```StatelesWidget``` tidak berubah setelah dibuat, sedangkan ```StatefulWidget``` bisa berubah setelah dibuat.

2. **Widget** yang digunakan dan fungsi nya
    - **MaterialApp**: membuat aplikasi flutter dengan desain material dan menyediakan fitur seperti tema, judul, dan navigasi
    - **Scaffold**: memberikan struktur dasar visual aplikasi, termasuk ```appBar```, ```body```, dan ```floatingActionButton```
    - **Column**: widget tata letak yang menempatkan elemen-elemen secara vertikal
    - **Container**: membuat kotak yang bisa diatur dengan padding, margin, warna, ukuran
    - **AppBar**: membuat bar di bagian atas layar dengan judul dan tombol logout
    - **Text**: menampilkan teks di layar
    - **Center**: menampilkan elemen di tengah layar
    - **IconButton**: tombol dengan ikon, seperti tombol logout
    - **ElevatedButton**: membuat tombol yang bisa ditekan, seperti tombol lihat daftar produk
    - **AlertDialog**: menampilkan dialog
    - **FloatingActionButton**: tombol mengambang yang bisa ditekan, seperti tombol untuk menambahkan produk baru

3. Fungsi **```setState()```**
    - fungsi pada ```StatefulWidget``` yang berguna untuk memberi tahu flutter bahwa ada perubahan pada state. ketika fungsi ini dipanggil. flutter akan memperbarui UI sesuai dengan perubahan state tersebut
    - dari proyek flutter saya, variabel ```foodItems``` diperbarui menggunakan fungsi ini. setiap kali ada produk yang ditambahkan, fungsi ini akan dipanggil untuk memperbarui daftar di layar

4. Perbedaan antara **```const```** dan **```final```**
    - ```final``` mirip seperti ```const```, yaitu membuat variabel yang tidak dapat diubah setelah dideklarasikan, tetapi nilainya bisa ditentukan saat aplikasi berjalan
    - ```const``` digunakan untuk membuat variabel dengan nilai tetap yang sudah diketahui saat aplikasi dijalankan. ```const``` membuat variabel tidak dapat diubah (immutable)

    Perbedaan utamanya adalah ```const``` nilai nya harus ditentukan dulu sebelum aplikasi dijalankan, sedangkan ```final``` nilainya bisa ditentukan saat aplikasi berjalan

5. Cara implementasi sesuai checklist
- pertama-tama, saya melakukan modifikasi pada widget di kelas ```MyApp``` seperti ini

```bash
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcommerceProject',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EcommerceProject'),
    );
  }
}
```

- untuk membuat tombol-tombol seperti lihat daftar produk, tambah produk, dan logout dengan warna yang berbeda-beda dan menampilkan teks menggunakan ```Snackbar```, begini kode nya
    - lihat daftar produk saya letakkan di main page seperti ini
    ```bash
    ...
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Kamu telah menekan tombol lihat daftar produk")),
                );
              },
              icon: const Icon(Icons.list),
              label: const Text("lihat daftar produk"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
            ),
    ...
    ```
    - logout saya letakkan di tempat yang sama seperti ini
    ```bash
    ...
      const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Kamu telah menekan tombol logout")),
                );
              },
              icon: const Icon(Icons.list),
              label: const Text("logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
            ),
    ...
    ```
    
    - tombol tambah produk ditempat yang sama seperti ini
    ```bash
    ...
     const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Kamu telah menekan tombol tambah produk")),
                );
              },
              icon: const Icon(Icons.list),
              label: const Text("tambah produk"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
            ),
    ...
    ```


# TUGAS 8
[Back to Table of Contents](#table-of-contents)
## Jawaban
1. Kegunaan ```const```, keuntungannya, kapan sebaiknya digunakan, dan kapan sebaiknya tidak digunakan

  - ```const``` digunakan untuk membuat widget atau objek yang bersifat konstan (immutable). berarti niai dari objek atau widget akan selalu konsisten dan tidak akan berubah selama runtime.

  - **keuntungan** menggunakan ```const```:
    - **Optimalisasi performa**, karena dengan menggunakan ```const```, flutter tidap perlu membuat ulang widget ketika UI diperbarui, karena tidak pernah berubah
    - **Penggunaan memori yang lebih rendah**, karena widget atau objek yang menggunakan ```const``` diinisialisasi hanya sekali
    - **Debugging lebih mudah**, karena ```const``` tidak akan berubah, jadi bagian yang menggunakan ini tidak akan termodifikasi secara tidak sengaja selama aplikasi dijalankan
  
  - Kapan **sebaiknya** menggunakan ```const```?

    ```const``` sebaiknya digunakan pada widget atau objek yang tidak perlu diubah selama aplikasi berjalan, seperti teks tetap dan dekorasi yang tidak akan diubah.
  
  - Kapan **sebaiknya tidak** menggunakan ```const```?

    ```const``` sebaiknya tidak digunakan pada widget atau objek yang perlu/akan diubah selama aplikasi berjalan, karena ```const``` tidak dapat diperbarui tanpa melakukan rebuild.

2. Perbandingan ```column``` dan ```row``` pada flutter
  - **Column**

    ```Column``` digunakan untuk menyusun widget secara vertikal dari atas ke bawah, contoh implementasi nya:
    ```bash
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
        Text('Hello, World!'),
        Text('Welcome to Flutter.'),
        ElevatedButton(
        onPressed: () {},
        child: Text('Click Me'),
        ),
    ],
    )
    ```

  - **Row**

    ```Row``` digunakan untuk menyusun widget secara horizontal dari kiri ke kanan, contoh implementasi nya:
    ```bash
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
        Icon(Icons.home),
        Text('Home'),
        ElevatedButton(
        onPressed: () {},
        child: Text('Go'),
        ),
    ],
    )

    ```

3. **Elemen-elemen input** yang saya gunakan pada halaman form
  - ```TextFormField```: digunakan untuk menerima input dalam bentuk teks, seperti nama, deskripsi, URL, dan integer.

4. Cara mengatur **tema (theme)** dalam aplikasi flutter
  saya mengatur tema pada aplikasi flutter saya menggunakan ```ThemeApp``` di dalam ```MaterialApp```, di sini saya menentukan warna dasar dan secondary color untuk tema saya. seperti ini implementasinya:

    ```bash
    theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
    useMaterial3: true,
    ),
    ```

5. **Navigasi** dalam aplikasi flutter
  untuk navigasi, saya menggunakan ```Navigator``` dengan  ```Navigator.push``` . contoh implementasi nya:
    ```bash
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AddItemPage()),
    );
      ...
    ```


# Tugas 9

## Subjudul: Penjelasan Tugas dan Implementasi

### **1. Mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON?**
Model diperlukan untuk memetakan struktur data JSON menjadi representasi objek di Flutter. Hal ini mempermudah manipulasi data dan memastikan kesesuaian struktur antara data yang diterima/dikirim dengan aplikasi. Tanpa model, kita harus menangani JSON mentah secara langsung, yang bisa membingungkan dan rentan terhadap error seperti null pointer atau kesalahan tipe data.

Namun, jika kita tidak membuat model terlebih dahulu, aplikasi tetap dapat berjalan, tetapi akan sulit mengelola data secara efisien, dan risiko kesalahan lebih tinggi karena tidak ada validasi struktur data.

---

### **2. Fungsi dari library `http` pada tugas ini**
Library `http` digunakan untuk melakukan HTTP request, seperti `GET` untuk mengambil data dari server atau `POST` untuk mengirim data ke server. Library ini menyediakan metode sederhana untuk komunikasi dengan web service, termasuk menangani header, body, dan metode request. 

Pada tugas ini, library `http` digunakan untuk menghubungkan aplikasi Flutter dengan backend Django untuk login, register, dan pengambilan data.

---

### **3. Fungsi dari `CookieRequest` dan mengapa instance-nya perlu dibagikan ke semua komponen di aplikasi Flutter**
`CookieRequest` adalah sebuah library yang memungkinkan Flutter untuk menangani sesi pengguna dan autentikasi berbasis cookie. Fungsi utamanya adalah:
- Menyimpan cookie yang diterima dari server untuk melacak sesi pengguna.
- Mengirim cookie secara otomatis pada setiap request untuk memastikan pengguna tetap terautentikasi.

Instance `CookieRequest` perlu dibagikan ke seluruh komponen aplikasi menggunakan `Provider` agar semua widget yang memerlukan data autentikasi dapat mengaksesnya tanpa perlu membuat ulang objek `CookieRequest`.

---

### **4. Mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter**
1. **Input Data:** 
   - Pengguna mengisi data pada `TextField` di Flutter.
   - Data dari input pengguna disimpan di `TextEditingController`.

2. **Pengiriman Data:**
   - Flutter menggunakan library `http` atau `CookieRequest` untuk mengirim data ke endpoint Django melalui HTTP POST.

3. **Proses di Backend Django:**
   - Django menerima data dan memprosesnya (misalnya, menyimpan data ke database atau mengotentikasi pengguna).
   - Django mengembalikan respons JSON ke Flutter.

4. **Menampilkan Data di Flutter:**
   - Data yang diterima dari Django dikonversi menjadi objek model di Flutter menggunakan metode `fromJson`.
   - Flutter menggunakan `FutureBuilder` untuk menampilkan data secara asinkron.

---

### **5. Mekanisme autentikasi dari login, register, hingga logout**
#### **Login:**
1. Pengguna memasukkan username dan password pada Flutter.
2. Flutter mengirim data ke endpoint `/login/` di Django menggunakan HTTP POST.
3. Django memverifikasi data dan mengembalikan respons (berhasil atau gagal).
4. Jika berhasil, cookie sesi disimpan oleh `CookieRequest` di Flutter, dan pengguna diarahkan ke halaman utama.

#### **Register:**
1. Pengguna memasukkan username, password, dan konfirmasi password.
2. Flutter mengirim data ke endpoint `/register/` di Django.
3. Django memproses data (validasi dan pendaftaran akun baru).
4. Jika pendaftaran berhasil, Django mengembalikan respons sukses, dan Flutter mengarahkan pengguna ke halaman login.

#### **Logout:**
1. Pengguna memilih logout di Flutter.
2. Flutter mengirim request ke endpoint `/logout/` di Django.
3. Django menghapus sesi pengguna dan mengembalikan respons sukses.
4. Flutter menghapus cookie sesi dan mengarahkan pengguna ke halaman login.

---

### **6. Implementasi Checklist Secara Step-by-Step**
1. **Setup Django Backend:**
   - Tambahkan aplikasi `authentication` ke `INSTALLED_APPS`.
   - Konfigurasi `django-cors-headers` untuk mengizinkan akses dari Flutter.
   - Buat endpoint `/login/`, `/register/`, dan `/logout/`.

2. **Setup Flutter:**
   - Tambahkan dependency `pbp_django_auth` dan `provider` ke proyek Flutter.
   - Konfigurasi `Provider` di `main.dart` untuk membagikan instance `CookieRequest`.

3. **Implementasi Login:**
   - Buat file `login.dart`.
   - Tambahkan input untuk username dan password.
   - Kirim data ke Django menggunakan `CookieRequest`.

4. **Implementasi Register:**
   - Buat file `register.dart`.
   - Tambahkan input untuk username, password, dan konfirmasi password.
   - Kirim data ke endpoint Django untuk pendaftaran.

5. **Implementasi Logout:**
   - Tambahkan tombol logout di Flutter.
   - Kirim request logout ke Django, lalu hapus sesi di Flutter.

6. **Pengambilan dan Penampilan Data:**
   - Buat model Dart untuk memetakan JSON ke objek.
   - Gunakan `FutureBuilder` untuk menampilkan data yang diambil dari Django.

7. **Pengujian:**
   - Uji setiap fitur (login, register, logout, pengambilan data) di emulator Android dan browser.

---


