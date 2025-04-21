import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  final bool? isYellowButton;
  final VoidCallback onPressed;

  const DownloadButton(
      {super.key, this.isYellowButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isYellowButton != null
              ? [
                  const Color(0xFFFF416C), // hồng đậm (trái)
                  const Color(0xFFFF4B2B), // đỏ cam (phải)
                ]
              : const [Color(0xFF00C6FF), Color(0xFF0072FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onPressed,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_downward, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'DOWNLOAD',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
