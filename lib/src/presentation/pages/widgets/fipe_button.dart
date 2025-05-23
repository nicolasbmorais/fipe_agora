import 'package:fipe_agora/src/core/typography.dart';
import 'package:flutter/material.dart';

class FipeButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const FipeButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.grey.shade800,
            ),
          ),
        )),
        onPressed: onPressed,
        child: Text(text, style: CustomTypography.bold),
      ),
    );
  }
}
