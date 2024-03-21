import 'package:flutter/material.dart';
import 'package:sejeong_magica/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  
  const HerMessageBubble({ super.key, required this.message });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        message.image != null ? _ImageBubble(src: message.image ?? '') : SizedBox(height: 1),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String src;
  _ImageBubble({ required this.src });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        // "https://yesno.wtf/assets/yes/8-2f93962e2ab24427df8589131da01a4d.gif",
        src,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text("Mi amor está mandando un mensaje."),
          );
        },
      ),
    );
  }
}
