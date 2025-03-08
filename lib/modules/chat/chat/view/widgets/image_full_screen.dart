import 'package:flutter/material.dart';

class ImageFullScreen extends StatelessWidget {
  const ImageFullScreen({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: InteractiveViewer(
              child: Image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
