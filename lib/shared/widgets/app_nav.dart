import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const NavButton(this.label, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(label,style: TextStyle(color: Colors.black)));
  }
}

class DrawerItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const DrawerItem(this.label, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(label,style: TextStyle(color: Colors.black),), onTap: onTap);
  }
}
