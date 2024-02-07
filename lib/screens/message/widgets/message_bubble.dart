import 'package:flutter/material.dart';

import '../../../models/message_model.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
            color: Color(0xffE5E7EB),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topRight: Radius.circular(8),
            )),
        child: Text(messageModel.massage!),
      ),
    );
  }
}
