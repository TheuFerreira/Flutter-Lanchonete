import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String? value) onChanged;

  const SearchWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      onSubmitted: onChanged,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: 'Pesquisar...',
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.grey[250],
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 4,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
          size: 20,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
