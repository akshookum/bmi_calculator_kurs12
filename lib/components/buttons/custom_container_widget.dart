import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.tus,
    required this.onTap,
  });
  final IconData icon;
  final String text;
  final Color tus;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
              color: tus,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 17,
              ),
              child: Column(children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 90,
                ),
                Text(
                  text.toUpperCase(),
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ]),
            )),
      ),
    );
  }
}
