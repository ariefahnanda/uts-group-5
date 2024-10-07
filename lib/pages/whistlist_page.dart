import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/whistlist_tile.dart';
import 'package:flutter/material.dart';

class WhistlistPage extends StatelessWidget {
  const WhistlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Whistlist'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => WhistlistTile(
              data: products[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
