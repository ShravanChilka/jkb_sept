import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectCameraWidget extends StatelessWidget {
  const SelectCameraWidget({
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
              source: ImageSource.camera,
            );
            if (context.mounted) {
              Navigator.of(context).pop(xFile);
            }
          },
          icon: const Icon(Icons.camera_alt_outlined),
        ),
        Text(
          'Camera',
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
