import 'package:flutter/material.dart';
import 'package:task_manger/Features/Auth/Model/user_model.dart';
import 'package:task_manger/Features/Auth/View/Pages/login_page.dart';
import 'package:task_manger/Features/Auth/ViewModel/AuthCupit/auth_cupit.dart';
import 'package:task_manger/Features/Department/View/Pages/add_department_page.dart';
import 'package:task_manger/Features/Department/View/Pages/update_department_page.dart';
import 'package:task_manger/Features/Home/View/Pages/home_page.dart';
import 'package:task_manger/Features/Tasks/View/pages/user_tasks.dart';
import 'package:task_manger/Features/Tasks/View/pages/add_tasks_page.dart';
import 'package:task_manger/Features/User/View/Pages/add_user_page.dart';
import 'package:task_manger/Features/User/View/Pages/update_user.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://ca.slack-edge.com/T02421YTFJ7-U05T0LYF333-d51dbe108b54-48',
                  fit: BoxFit.fill,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            (AuthCupit.userData!.userType != UserTypes.user)
                                ? const HomePage()
                                : const UserTasksPage(),
                      ));
                },
                leading: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              if (AuthCupit.userData!.userType == UserTypes.admin ||
                  AuthCupit.userData!.userType == UserTypes.manager)
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddDepartmentPage(),
                        ));
                  },
                  leading: const Icon(Icons.table_bar_sharp),
                  title: const Text('Add Department'),
                ),
              if (AuthCupit.userData!.userType == UserTypes.admin ||
                  AuthCupit.userData!.userType == UserTypes.manager)
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateDepartmentPage(),
                        ));
                  },
                  leading: const Icon(Icons.update),
                  title: const Text('Update Department'),
                ),
              if (AuthCupit.userData!.userType == UserTypes.admin ||
                  AuthCupit.userData!.userType == UserTypes.manager)
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddUserPage(),
                        ));
                  },
                  leading: const Icon(Icons.person),
                  title: const Text('Add User'),
                ),
              if (AuthCupit.userData!.userType == UserTypes.admin ||
                  AuthCupit.userData!.userType == UserTypes.manager)
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateUserPage(),
                        ));
                  },
                  leading: const Icon(Icons.update),
                  title: const Text('Update User'),
                ),
              if (AuthCupit.userData!.userType == UserTypes.admin ||
                  AuthCupit.userData!.userType == UserTypes.manager)
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddTaskPage(),
                        ));
                  },
                  leading: const Icon(Icons.task_alt_outlined),
                  title: const Text('Add Task'),
                ),
              ListTile(
                onTap: () {
                  AuthCupit.logout();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
