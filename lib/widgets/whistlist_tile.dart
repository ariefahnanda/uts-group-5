import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class WhistlistTile extends StatelessWidget {
  final ProductModel data;
  const WhistlistTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.grey.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(
              data.image,
              width: 68.0,
              height: 68.0,
            ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: const TextStyle(
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                data.priceFormat,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 28,
          ),
        ],
      ),
    );
  }
}
