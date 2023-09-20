import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:task_manger/Features/Home/View/Components/home_appbar.dart';
import 'package:task_manger/Features/Home/View/Components/home_drawer.dart';
import 'package:task_manger/Features/Home/View/Pages/tasks_page.dart';
import 'package:task_manger/Features/Home/View/Pages/users_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            child: Column(
              children: [
                HomeAppBar(
                  advancedDrawerController: advancedDrawerController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedScreenWidget = const USersPage();
                        });
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person,
                                  color: (selectedScreenWidget is USersPage)
                                      ? const Color(0xff5a55ca)
                                      : Colors.black),
                              Text(
                                "Users",
                                style: TextStyle(
                                    color: (selectedScreenWidget is USersPage)
                                        ? const Color(0xff5a55ca)
                                        : Colors.black),
                              ),
                            ],
                          ),
                          if (selectedScreenWidget is USersPage)
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width * 0.2,
                              color: const Color(0xff5a55ca),
                            )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedScreenWidget = const TaskPage();
                        });
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.task_alt_outlined,
                                  color: (selectedScreenWidget is TaskPage)
                                      ? const Color(0xff5a55ca)
                                      : Colors.black),
                              Text(
                                "Tasks",
                                style: TextStyle(
                                    color: (selectedScreenWidget is TaskPage)
                                        ? const Color(0xff5a55ca)
                                        : Colors.black),
                              ),
                            ],
                          ),
                          if (selectedScreenWidget is TaskPage)
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width * 0.2,
                              color: const Color(0xff5a55ca),
                            )
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(),
                Expanded(child: selectedScreenWidget)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
