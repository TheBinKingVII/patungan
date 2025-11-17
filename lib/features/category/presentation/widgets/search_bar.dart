import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool enabled;
  final void Function(String)? onChanged;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.enabled = true,
    this.onChanged,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: widget.controller,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
      
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 24, right: 8),
            child: Icon(Icons.search_rounded, color: Colors.grey, size: 24,),
          ),
        ),
      ),
    );
  }
}
