import 'package:flutter/material.dart';

class CartFloatingActionButton extends StatelessWidget {
  const CartFloatingActionButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.blue,
      splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      borderRadius: BorderRadius.circular(24),
      child: Ink(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 2,
            color: Colors.red.shade100,
          ),
        ),
        child: const Icon(
          Icons.shopping_bag_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
