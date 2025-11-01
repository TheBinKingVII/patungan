import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const CustomChip({
    Key? key,
    required this.label,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [Color(0xFF9C27B0), Color(0xFFFF9800)],
    );

    return InkWell(
      onTap: onSelected,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: selected ? gradient : null,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black54),
          color: selected ? null : Colors.white,
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black26,
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class CustomChip extends StatelessWidget {
//   final String label;
//   final bool selected;
//   final ValueChanged<bool>? onSelected;

//   const CustomChip({
//     super.key,
//     required this.label,
//     this.selected = false,
//     this.onSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const gradient = LinearGradient(
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//       colors: [Color(0xFFAA2F6A), Color(0xFFD64E56), Color(0xFFEEBE4B)],
//     );

//     return Container(
//       height: 40,
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(
//         gradient: selected ? gradient : null,
//         color: selected ? null : Colors.grey,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: ChoiceChip(
//         label: Text(
//           label,
//           style: TextTheme.of(
//             context,
//           ).bodyMedium?.copyWith(color: Colors.black),
//         ),
//         selected: selected,
//         backgroundColor: Colors.transparent,
//         selectedColor: Colors.transparent,
//         onSelected: onSelected,
//         showCheckmark: false,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       ),
//     );
//   }
// }
