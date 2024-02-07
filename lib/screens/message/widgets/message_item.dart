import 'package:flutter/material.dart';
import 'package:job_finder_app/models/message_model.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';

import 'message_bubble.dart';
import 'my_message_bubble.dart';

class MessageCompanyItem extends StatefulWidget {
  const MessageCompanyItem({
    super.key,
    required this.title,
    required this.image,
    required this.company,
    required this.id,
  });

  final String title;
  final String image;
  final String company;
  final int id;

  @override
  State<MessageCompanyItem> createState() => _MessageCompanyItemState();
}

class _MessageCompanyItemState extends State<MessageCompanyItem> {
  late TextEditingController textEditingController;

  late ScrollController scrollController;

  List<MessageModel> message = [
    MessageModel(
      isUser: false,
      massage:
          "Ok, here I put the Google Meet link for later this afternoon. I ask for the timeliness, thank you!\nhttps://meet.google.com/dis-sxdu-ave",
    ),
    MessageModel(
      isUser: true,
      massage: "Of course, I can!",
    ),
    MessageModel(
      isUser: false,
      massage: "Can we have an interview via google meet call today at 3pm?",
    ),
    MessageModel(
      isUser: true,
      massage:
          "Hi Melan, thank you for considering me, this is good news for me.",
    ),
    MessageModel(
      isUser: false,
      massage:
          "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.",
    ),
  ];

  @override
  void initState() {
    textEditingController = TextEditingController();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: _buildMessageList(),
              ),
              _buildMessageInput(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildMessageInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              fillColor: Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              suffixIcon: const Icon(
                Icons.send,
              ),
              hintText: 'Write a message...',
              hintStyle: const TextStyle(
                color: Color(0xff9CA3AF),
                fontSize: 14,
                fontFamily: AppFonts.kLoginSubHeadlineFont,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      controller: scrollController,
      reverse: true,
      itemCount: message.length,
      itemBuilder: (context, index) {
        return getMessageBubble(message[index]);
      },
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        const SizedBox(width: 20),
        Image.asset(widget.image),
        const SizedBox(width: 10),
        Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xff111827),
            fontFamily: AppFonts.kLoginHeadlineFont,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        Image.asset(AppImages.kMore)
      ],
    );
  }

  Widget getMessageBubble(MessageModel message) {
    if (message.isUser == true) {
      //   log('inside condition');
      return MyMessageBubble(messageModel: message);
    } else {
      return MessageBubble(messageModel: message);
    }
  }
}
