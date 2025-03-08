import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectGalleryWidget extends StatelessWidget {
  const SelectGalleryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.filledTonal(
          iconSize: 40,
          onPressed: () async {
            final xFile = await ImagePicker().pickImage(
              source: ImageSource.gallery,
            );
            if (context.mounted) {
              Navigator.of(context).pop(xFile);
            }
          },
          icon: const Icon(
            Icons.photo_library_outlined,
          ),
        ),
        Text(
          'Gallery',
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
