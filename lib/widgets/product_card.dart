import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel data;
  const ProductCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // ValueNotifier untuk menyimpan status apakah produk ini disukai
    final ValueNotifier<bool> isFavorited = ValueNotifier<bool>(false);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CartPage(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.3),
                  blurRadius: 1.0,
                  spreadRadius: 0,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    data.image,
                    width: double.infinity,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Flexible(
                  child: Text(
                    data.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  data.priceFormat,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: ValueListenableBuilder<bool>(
                valueListenable: isFavorited,
                builder: (context, isFav, child) {
                  return InkWell(
                    onTap: () {
                      isFavorited.value = !isFav;
                    },
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_outline,
                      color: isFav ? Colors.red : Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
