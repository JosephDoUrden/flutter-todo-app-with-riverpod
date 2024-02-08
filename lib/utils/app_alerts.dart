import 'package:flutter/material.dart';
import 'package:todo_app_riverpod/utils/utils.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
        ),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }
}
