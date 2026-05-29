import 'package:flutter/material.dart';

Future<void> showAlert({
  required BuildContext bContext,
  String? title,
  String? content,
}) {
  return showDialog<void>(
    context: bContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title ?? ""),
        content: Text(content ?? ""),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Ok"),
          ),
        ],
      );
    },
  );
}