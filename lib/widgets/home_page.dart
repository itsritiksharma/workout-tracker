import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/calendar_screen.dart';
import '../screens/main_drawer.dart';
import './main_app.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);
  // final titleController = TextEditingController();
  // final repsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Tracker'),
        actions: [
          IconButton(
              // onPressed: () {
              //   Navigator.of(context).pushNamed(CalendarScreen.routName);
              // },
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext ctx) {
                    return Container(
                      child: Text('hello'),
                    );
                  },
                );
              },
              icon: const Icon(Icons.calendar_today))
        ],
      ),
      drawer: const MainDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   // shape: const CircularNotchedRectangle(),
      //   shape: const AutomaticNotchedShape().getOuterPath(hostRect, guestRect),
      //   notchMargin: 20,
      //   color: Theme.of(context).primaryColor,
      //   child: const SizedBox(
      //     height: 50,
      //   ),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Theme.of(context).primaryColor,
        items: [
          IconButton(
            onPressed: () {
              // showModalBottomSheet(
              //   context: context,
              //   builder: (ctx) {
              //     Column(
              //       children: [
              //         TextField(
              //           controller: titleController,
              //         ),
              //       ],
              //     );
              //   },
              // );
            },
            icon: Icon(
              Icons.add,
              size: 50,
              color: Colors.white,
            ),
          ),
          // Icon(
          //   Icons.list,
          //   size: 50,
          //   color: Colors.white,
          // ),
        ],
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOutExpo,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: MainApp(),
    );
  }
}
