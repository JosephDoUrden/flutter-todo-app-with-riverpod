import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/utils/utils.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.taskTitle,
    this.controller,
    required this.hintText,
    this.maxLines,
  });

  final String taskTitle;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          taskTitle,
          style: context.textTheme.titleLarge,
        ),
        const Gap(10),
        TextField(
          controller: controller,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: hintText,
          ),
          onChanged: (value) {},
          maxLines: maxLines,
        ),
      ],
    );
  }
}
