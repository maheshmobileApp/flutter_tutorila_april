import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {

final List<Widget> _pages =  [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(),
      bottomNavigationBar: ConvexAppBar(
         style: TabStyle.fixedCircle,
          onTap: (index) {
            // Handle navigation based on the selected index
            // For example, navigate to a different screen based on the index
          },
          items:const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.task, title: 'Tasks'),
            TabItem(icon: Icons.create, title: 'Create'),
            TabItem(icon: Icons.analytics, title: 'Analytics'),
            TabItem(icon: Icons.person, title: 'Profile'),
          ]),
    );
  }
}
/*

Home
tasks
create
analytics
profile
 Icon(Icons.home),
          Icon(Icons.task),
          Icon(Icons.create),
          Icon(Icons.analytics),
          Icon(Icons.person),
 */
