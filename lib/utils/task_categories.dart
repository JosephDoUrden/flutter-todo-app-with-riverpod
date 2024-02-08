import 'package:flutter/material.dart';

enum TaskCategories {
  education(Icons.school, Colors.blue),
  health(Icons.favorite, Colors.red),
  home(Icons.home, Colors.green),
  personal(Icons.person, Colors.purple),
  work(Icons.work, Colors.orange),
  shopping(Icons.shopping_cart, Colors.pink),
  social(Icons.people, Colors.teal),
  travel(Icons.flight, Colors.indigo),
  others(Icons.category, Colors.grey);

  static TaskCategories stringToTaskCategory(String name) {
    try {
      return TaskCategories.values.firstWhere((category) => category.name == name);
    } catch (e) {
      return TaskCategories.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategories(this.icon, this.color);
}
