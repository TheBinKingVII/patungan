import 'package:flutter/material.dart';

class SwitchToggle extends StatelessWidget {
  final bool isPatungan;
  final Function(bool) onChanged;

  const SwitchToggle({
    super.key,
    required this.isPatungan,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Row(
          children: [
            // PATUNGAN
            Expanded(
              child: GestureDetector(
                onTap: () {
                  onChanged(true);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  // padding: EdgeInsets.symmetric(vertical: ),
                  decoration: BoxDecoration(
                    color: isPatungan
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Patungan",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isPatungan
                          ? Colors.white
                          : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // NORMAL
            Expanded(
              child: GestureDetector(
                onTap: () {
                  onChanged(false);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  // padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: !isPatungan
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Normal",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: !isPatungan
                          ? Colors.white
                          : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
