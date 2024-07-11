import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final VoidCallback? action;
  final double? width;
  final double? height;

  const DeliveryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.action,
    this.width,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(label),
        ),
      ),
    );
  }
}
