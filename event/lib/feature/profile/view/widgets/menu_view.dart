import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  const MenuView({
    required this.menu,
    required this.iconMenu,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final String menu;
  final IconData iconMenu;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(iconMenu),
                const SizedBox(width: 12),
                Text(
                  menu,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                )
              ],
            ),
            Icon(Icons.navigate_next),
          ],
        ),
      ),
    );
  }
}
