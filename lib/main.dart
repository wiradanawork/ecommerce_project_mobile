import 'package:flutter/material.dart';
import 'screens/add_item_page.dart';
import 'screens/product_list_page.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart'; 
import 'screens/item_detail_page.dart'; 
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CookieRequest(), // Menyediakan CookieRequest ke semua widget
      child: MaterialApp(
        title: 'EcommerceProject',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        home: const AppInitializer(),
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/items': (context) => const ProductListPage(),
          '/add_item': (context) => const AddItemPage(),
          '/item_detail': (context) => const ItemDetailPage(), // Halaman detail item
        },
      ),
    );
  }
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return FutureBuilder<bool>(
      future: Future.value(request.loggedIn), // Mengecek status login
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Tampilkan spinner loading saat memeriksa status login
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.data == true) {
          // Jika sudah login, arahkan ke halaman daftar produk
          return const MyHomePage(title: 'EcommerceProject');
        } else {
          // Jika belum login, arahkan ke halaman login
          return const LoginPage();
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.yellow),
              child: const Text('Menu', style: TextStyle(fontSize: 24)),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'EcommerceProject')),
                );
              },
            ),
            ListTile(
              title: const Text('Add Item'),
              onTap: () {
                Navigator.pushNamed(context, '/add_item');
              },
            ),
            ListTile(
              title: const Text('View Products'),
              onTap: () {
                Navigator.pushNamed(context, '/items');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async {
                final request = context.read<CookieRequest>();
                final response = await request.logout('http://10.0.2.2:8000/logout/');
                if (response['status'] == true) {
                  Navigator.pushReplacementNamed(context, '/login');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logout successful!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logout failed: ${response['message']}')),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Welcome to my Ecommerce Project!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/items');
              },
              icon: const Icon(Icons.list),
              label: const Text("View Products"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/add_item');
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Product"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
