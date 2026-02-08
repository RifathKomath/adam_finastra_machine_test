import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:flutter/material.dart';

class CountryCodeDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const CountryCodeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        dropdownColor: whiteClr,
        value: value,
        isDense: true,
        items: const [
          DropdownMenuItem(value: "+91", child: Text("+91")),
          DropdownMenuItem(value: "+1", child: Text("+1")),
          DropdownMenuItem(value: "+44", child: Text("+44")),
        ],
        onChanged: (val) => onChanged(val!),
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: borderColor,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
