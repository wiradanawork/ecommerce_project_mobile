import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil data item dari arguments yang dikirim melalui Navigator
    final item = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    // Jika item null, tampilkan pesan error
    if (item == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(
          child: Text('Item data is not available.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item['name'] ?? 'Item Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${item['name'] ?? 'Unknown'}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: Rp ${item['price'] ?? 'Not specified'}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Description: ${item['description'] ?? 'No description available.'}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Product List'),
            ),
          ],
        ),
      ),
    );
  }
}
