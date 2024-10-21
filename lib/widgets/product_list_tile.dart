import 'package:flutter/material.dart';
import 'package:jkb_sept/models/product.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
    required this.product,
    required this.quantity,
    required this.onTapAdd,
    required this.onTapRemove,
  });

  final Product product;
  final void Function() onTapAdd;
  final void Function() onTapRemove;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.grey.shade400,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '${product.currency} ${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              IconButton.filled(
                onPressed: onTapRemove,
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(width: 10),
              Text(
                quantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(width: 10),
              IconButton.filled(
                onPressed: onTapAdd,
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
