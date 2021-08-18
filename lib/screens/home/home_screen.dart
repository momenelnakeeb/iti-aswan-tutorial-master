import 'package:flutter/material.dart';
import 'package:iti_aswan_tutorial/components/user_card.dart';
import 'package:iti_aswan_tutorial/data/users_service.dart';
import 'package:iti_aswan_tutorial/models/user.dart';
import 'package:iti_aswan_tutorial/screens/userDetails/user_details_screen.dart';
import 'package:iti_aswan_tutorial/services/services_handler.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  Future<List<User>> _usersList;
  List<User> users;
  _getUsers() async {
    _usersList = UserServices().getUsers();
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getUserCard(),
      appBar: getAppBar(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _counter++;
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      title: Text('Aswan ITI'),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {
          print('Menu button Clicked');
        },
      ),
    );
  }

  Widget getUserCard() {
    return FutureBuilder<List<User>>(
        future: _usersList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Widget> items = List.generate(
              snapshot.data.length,
              (index) => UserCard(
                user: snapshot.data[index],
                onItemClick: (clickedUser) {
                  print('Clicked user ${clickedUser.name}');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserDetailsScreen(
                        user: clickedUser,
                      ),
                    ),
                  );
                },
              ),
            );

            return GridView.count(
              crossAxisCount: 2,
              children: items,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget getHomeViewBody() {
    return Center(
      child: Column(
        children: [
          Text('Your current count is '),
          Text('$_counter'),
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
