import 'package:final_project/main.dart';
import 'package:flutter/material.dart';

class AppBarCustomWidget extends StatelessWidget {
  const AppBarCustomWidget({super.key, required this.title});
 final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      color: Colors.blue[100],
      child: ListTile(
        leading: Image.asset('assets/images/icon.png'),
        title: Text(
          authUser,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(title, style: TextStyle(fontSize: 14)),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_active_outlined),
        ),
      ),
    );
  }
}