import 'package:flutter/material.dart';

class GoBackIconButton extends StatelessWidget {
  const GoBackIconButton({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
    );
  }
}
