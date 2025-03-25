import 'package:flutter/material.dart';
import 'package:urban_culture/core/util/color_constant/urban_color.dart';

class CommonSnackbarWidget {
  static void show({
    required BuildContext context,
    required String message,
    required bool isPositiveToast,
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: isPositiveToast ? UrbanColor.green :UrbanColor.darkBrown,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    );

    // Show the snack bar
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
