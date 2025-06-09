import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/create/widgets/create_task.dart';
import 'package:flutter_tutorial_april/home/widgets/home_view.dart';
import 'package:flutter_tutorial_april/profile/widgets/profile_view.dart';
import 'package:flutter_tutorial_april/tasks/widgets/tasks_list.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {

final List<Widget> _pages = [
    const HomeView(),
    const TasksList(),
    const CreateTask(),
    Container(),
    const ProfileView()
  ];
  final List<String> _tabbarTitles = [
    'Home',
    'Tasks',
    'Create',
    'Analytics',
    'Profile'
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          ' ${_tabbarTitles[_selectedIndex]}',
          style:const TextStyle(color: Colors.white),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
         style: TabStyle.fixedCircle,
          onTap: (index) {
            // Handle navigation based on the selected index
            // For example, navigate to a different screen based on the index
            setState(() {
              _selectedIndex = index;
            });
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
