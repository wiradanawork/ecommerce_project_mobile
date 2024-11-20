import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({Key? key}) : super(key: key);

  Future<List<dynamic>> fetchItems(CookieRequest request) async {
    final response = await request.get('http://10.0.2.2:8000/products/json/');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(title: const Text('Item List')),
      body: FutureBuilder(
        future: fetchItems(request),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else {
            final items = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text("Price: ${item['price']}"),
                  onTap: () {
                    Navigator.pushNamed(context, '/item_detail', arguments: item);
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
