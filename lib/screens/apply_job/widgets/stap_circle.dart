import 'package:flutter/material.dart';

class StepCircle extends StatelessWidget {
  final int number;
  final bool isActive;
  final bool isDone;
  final String text;

  const StepCircle({
    super.key,
    required this.number,
    required this.isActive,
    required this.isDone,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 23,
          backgroundColor: isActive
              ? const Color(0xff3366FF)
              : isDone
                  ? const Color(0xff3366FF)
                  : const Color(0xff9CA3AF),
          child: CircleAvatar(
              radius: 22,
              foregroundColor: isActive
                  ? const Color(0xff3366FF)
                  : isDone
                      ? const Color(0xff3366FF)
                      : const Color(0xff9CA3AF),
              backgroundColor: isActive
                  ? Colors.white
                  : isDone
                      ? const Color(0xff3366FF)
                      : Colors.white,
              child: isDone
                  ? const Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                  : Text(number.toString())),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: isActive
                ? const Color(0xff3366FF)
                : isDone
                    ? const Color(0xff3366FF)
                    : const Color(0xff9CA3AF),
          ),
        ),
      ],
    );
  }
}
