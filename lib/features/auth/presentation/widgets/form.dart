import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final bool enabled;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? helperText;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.enabled = true,
    this.validator,
    this.onChanged,
    this.helperText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscure,
      enabled: widget.enabled,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        helperText: widget.helperText,
        helperStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),

        errorStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Color(0xFFE63E6E),
          fontWeight: FontWeight.w500,
        ),

        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),

        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 24, right: 8),
                child: Icon(widget.prefixIcon, color: Colors.grey),
              )
            : null,

        suffixIcon: widget.obscureText
            ? Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() => _obscure = !_obscure);
                  },
                ),
              )
            : null,
      ),
    );
  }
}
// klo pake getx
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomTextFormField extends StatelessWidget {
//   final String hintText;
//   final IconData prefixIcon;
//   final bool isPassword;
//   final TextInputType keyboardType;

//   CustomTextFormField({
//     required this.hintText,
//     required this.prefixIcon,
//     this.isPassword = false,
//     this.keyboardType = TextInputType.text,
//   });

//   final obscure = true.obs;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => TextFormField(
//           obscureText: isPassword ? obscure.value : false,
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             prefixIcon: Icon(prefixIcon),
//             hintText: hintText,
//             suffixIcon: isPassword
//                 ? IconButton(
//                     icon: Icon(
//                       obscure.value ? Icons.visibility_off : Icons.visibility,
//                     ),
//                     onPressed: () => obscure.value = !obscure.value,
//                   )
//                 : null,
//           ),
//         ));
//   }
// }
