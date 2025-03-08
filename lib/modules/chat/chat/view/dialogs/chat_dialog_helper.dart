import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jkb_sept/modules/chat/chat/model/message_model.dart';
import 'package:jkb_sept/modules/chat/chat/view/dialogs/delete_message_dialog.dart';
import 'package:jkb_sept/modules/chat/chat/view/widgets/select_photo_bottom_sheet.dart';
import 'package:jkb_sept/modules/chat/chat/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class ChatDialogHelper {
  static void showDeleteMessageDialog(
      BuildContext context, MessageModel message) {
    final viewModel = context.read<ChatViewModel>();
    showDialog<bool>(
      context: context,
      builder: (context) {
        return const DeleteMessageDialog();
      },
    ).then(
      (shouldDelete) {
        if (shouldDelete == true) {
          viewModel.deleteMessage(message);
        }
      },
    );
  }

  static void showImageBottomSheet(BuildContext context) {
    final viewModel = context.read<ChatViewModel>();
    showModalBottomSheet<XFile?>(
      context: context,
      builder: (context) {
        return const SelectPhotoBottomSheet();
      },
    ).then((xFile) {
      if (xFile != null) {
        viewModel.sendImageMessageEvent(xFile.path);
      }
    });
  }
}
