import 'package:flutter/material.dart';
import 'package:iti_aswan_tutorial/models/user.dart';
import 'package:iti_aswan_tutorial/components/user_card.dart';

class UserDetailsScreen extends StatefulWidget {
  final User user;
  UserDetailsScreen({@required this.user});
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User details"),
      ),
      body: Center(
        child: UserCard(
          user: widget.user,
        ),
      ),
    );
  }
}
