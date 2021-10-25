import 'package:flutter/material.dart';

class Menu {
  final String title;
  // final IconData icon;
  final Widget page;

  Menu(this.title, this.page);

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      json['title'],
      // json['icon'],
      json['page'],
    );
  }
}
