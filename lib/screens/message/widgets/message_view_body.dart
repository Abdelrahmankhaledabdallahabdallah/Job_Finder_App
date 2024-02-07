import 'package:flutter/material.dart';

import 'company_messages_list_view.dart';
import 'custom_search_message.dart';

class MessageViewBody extends StatefulWidget {
  const MessageViewBody({
    super.key,
  });

  @override
  State<MessageViewBody> createState() => _MessageViewBodyState();
}

class _MessageViewBodyState extends State<MessageViewBody> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomSearchMessage(),
          ),
          CompanyMessagesListView(),
        ],
      ),
    );
  }
}
