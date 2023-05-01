import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
