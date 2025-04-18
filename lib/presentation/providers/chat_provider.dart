import 'package:flutter/material.dart';
import 'package:sejeong_magica/config/helpers/get_yes_no_answer.dart';
import 'package:sejeong_magica/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messages = [
    Message(text: "Hola, amor!", fromWho: FromWho.HER),
    Message(text: "Te extrañé mucho!", fromWho: FromWho.HER),
    Message(text: "Preguntame y te respondo con 'sí' o 'no'. :)", fromWho: FromWho.HER),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      return;
    }
    final newMessage = Message(text: text, fromWho: FromWho.ME);
    messages.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
    if (text.endsWith("?")) {
      herReply();
    }
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );
  }
}
