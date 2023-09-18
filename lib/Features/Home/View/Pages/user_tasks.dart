import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:task_manger/Features/Home/View/Components/home_drawer.dart';
import 'package:task_manger/Features/Home/View/Components/time_line.dart';
import 'package:task_manger/Features/Home/View/Components/user_tasks_appbar.dart';
import 'package:task_manger/Features/Home/View/Components/user_tasks_by_tybe_card.dart';
import 'package:task_manger/Features/Home/View/Pages/users_page.dart';

class UserTasksPage extends StatefulWidget {
  const UserTasksPage({super.key});

  @override
  State<UserTasksPage> createState() => _UserTasksPageState();
}

class _UserTasksPageState extends State<UserTasksPage> {
  final advancedDrawerController = AdvancedDrawerController();
  Widget selectedScreenWidget = const USersPage();
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: const HomeDrawer(),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserTasksAppBar(
                    advancedDrawerController: advancedDrawerController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TimeLine(),
                  UserTasksByTypeCard(
                    color: const Color(0xff5a55ca),
                    title: "NEW",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UserTasksByTypeCard(
                    color: Colors.orange,
                    title: "PROCESSING",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UserTasksByTypeCard(
                    color: Colors.greenAccent,
                    title: "NOT COMPLETED",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UserTasksByTypeCard(
                    color: Colors.redAccent,
                    title: "EXPIRED",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UserTasksByTypeCard(
                    color: Colors.blueAccent,
                    title: "COMPLETED",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
