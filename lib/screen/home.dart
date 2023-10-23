import 'dart:io';

import 'package:assignment1/services/user_api.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment 1'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: ((context, index) {
          final user = users[index];
          // final img = user['picture']['thumbnail'];
          final img = user.pic;
          final email = user.email;
          final color = user.gender == 'male' ? Colors.white : Colors.grey;
          return ListTile(
            tileColor: color,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(img.medium),
            ),
            title: Text(user.fullName),
            subtitle: Text(email),
          );
        }),
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
