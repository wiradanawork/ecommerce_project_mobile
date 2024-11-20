import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  // Fungsi untuk mengambil data produk
  Future<List<dynamic>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://10.0.2.2:8000/products/json/');
    
    // Parsing JSON string ke List
    final products = jsonDecode(response);

    // Pastikan response berupa list
    if (products is List<dynamic>) {
      return products;
    } else {
      throw Exception('Failed to load products. Invalid data format.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Menampilkan loader saat data sedang dimuat
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Menampilkan pesan error jika terjadi kesalahan
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            // Menampilkan pesan jika tidak ada data produk
            return const Center(child: Text('No products available.'));
          } else {
            // Jika data berhasil dimuat
            final products = snapshot.data;

            return ListView.builder(
              itemCount: products.length, // Panjang data
              itemBuilder: (context, index) {
                final product = products[index]; // Akses produk ke-i
                final fields = product['fields']; // Detail produk berada di dalam `fields`

                return ListTile(
                  title: Text(fields['name']), // Nama produk
                  subtitle: Text('Price: Rp ${fields['price']}'), // Harga produk
                  onTap: () {
                    // Navigasi ke halaman detail produk dengan argument
                    Navigator.pushNamed(
                      context,
                      '/item_detail',
                      arguments: fields, // Kirim detail produk
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
