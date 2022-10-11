import 'package:flutter/material.dart';

showErrorMessage(String? message, context, {duration = 5}) {
  final snackBar = SnackBar(
    content: Text(
      message ?? "une erreur s'est produite",
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showSuccessMessage(String? message, context, {title, duration = 5}) {
  final snackBar = SnackBar(
    content: Text(
      message ?? "success",
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showWarningMessage(String? message, context, {duration = 5}) {
  final snackBar = SnackBar(
    content: Text(
      message ?? "une erreur s'est produite",
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.orange,
  );
  ScaffoldMessenger.of(context).showSnackBar(
    snackBar,
  );
}
