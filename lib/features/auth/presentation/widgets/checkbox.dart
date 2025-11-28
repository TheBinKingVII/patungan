import 'package:flutter/material.dart';

class RememberMeCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final TextStyle? textStyle;

  const RememberMeCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label = 'Remember me',
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: const BorderSide(color: Colors.grey),
          value: value,
          onChanged: onChanged,
        ),
        Text(label, style: textStyle ?? Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
