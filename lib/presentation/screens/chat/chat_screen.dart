import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sejeong_magica/domain/entities/message.dart';
import 'package:sejeong_magica/presentation/providers/chat_provider.dart';
import 'package:sejeong_magica/presentation/widgets/chat/her_message_bubble.dart';
import 'package:sejeong_magica/presentation/widgets/chat/message_field_box.dart';
import 'package:sejeong_magica/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://imgmedia.larepublica.pe/640x371/larepublica/original/2022/03/22/6239d01abe813b5a8a55052a.webp"),
          ),
        ),
        title: const Text("Mi amor Kim Se Jeong 💕"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  if (message.fromWho == FromWho.HER) {
                    return HerMessageBubble(message: message);
                  }
                  return MyMessageBubble(message: message);
                }
              )
            ),
            MessageFieldBox(
              onFieldSubmitted: (value) {
                chatProvider.sendMessage(value);
              },
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
