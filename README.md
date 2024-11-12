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
