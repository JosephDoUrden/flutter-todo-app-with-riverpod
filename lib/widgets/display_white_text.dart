import 'package:flutter/material.dart';
import 'package:todo_app_riverpod/utils/utils.dart';

class DisplayWhiteText extends StatelessWidget {
  const DisplayWhiteText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Text(
      text,
      style: context.textTheme.headlineSmall?.copyWith(
        color: colors.surface,
        fontSize: fontSize ?? 40,
        fontWeight: fontWeight,
      ),
    );
  }
}
