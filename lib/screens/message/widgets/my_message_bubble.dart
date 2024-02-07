import 'package:flutter/material.dart';

import '../../../models/message_model.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: const BoxDecoration(
            color: Color(0xff3366FF),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            )),
        child: Text(
          messageModel.massage!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
