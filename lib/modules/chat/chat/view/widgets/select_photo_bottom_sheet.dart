import 'package:flutter/material.dart';
import 'package:jkb_sept/modules/chat/chat/view/widgets/select_camera_widget.dart';
import 'package:jkb_sept/modules/chat/chat/view/widgets/select_gallery_widget.dart';

class SelectPhotoBottomSheet extends StatelessWidget {
  const SelectPhotoBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SelectCameraWidget(),
          SelectGalleryWidget(),
        ],
      ),
    );
  }
}
