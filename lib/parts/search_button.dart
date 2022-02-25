import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key, required this.onPressed}) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xffff8e3c),
              primary: const Color(0xffeff0f3),
              textStyle: const TextStyle(fontWeight: FontWeight.bold)),
          onPressed: onPressed,
          icon: const Icon(Icons.search),
          label: const Text('検索')),
    );
  }
}
