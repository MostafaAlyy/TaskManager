import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Features/Auth/View/Pages/login_page.dart';
import 'package:task_manger/Features/Auth/ViewModel/AuthCupit/auth_cupit.dart';
import 'package:task_manger/Features/Department/View/Pages/add_department_page.dart';
import 'package:task_manger/Features/Department/View/Pages/update_department_page.dart';
import 'package:task_manger/Features/User/View/Pages/add_user_page.dart';

class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCupit(),
        child: BlocConsumer<AuthCupit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cupit = AuthCupit.get(context);
            return Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    child: const Text("Log Out"),
                    onPressed: () {
                      cupit.logout();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    }),
                ElevatedButton(
                    child: const Text("Add department"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddDepartmentPage(),
                          ));
                    }),
                ElevatedButton(
                    child: const Text("Update department"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UpdateDepartmentPage(),
                          ));
                    }),
                ElevatedButton(
                    child: const Text("Add user"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddUserPage(),
                          ));
                    }),
              ],
            ));
          },
        ),
      ),
    );
  }
}
