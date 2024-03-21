import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onFieldSubmitted;
  
  MessageFieldBox({ super.key, required this.onFieldSubmitted });

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlinedInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent
      ),
      borderRadius: BorderRadius.circular(30)
    );
    final inputDecoration = InputDecoration(
      hintText: "Termina el mensaje con el signo '?'",
      enabledBorder: outlinedInputBorder,
      focusedBorder: outlinedInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          focusNode.requestFocus();
          onFieldSubmitted(textValue);
        }
      ),
    );
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onFieldSubmitted(value);
      },
      onTapOutside: (event) {
        focusNode.unfocus();
      },
    );
  }
}
