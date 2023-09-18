import 'package:flutter/material.dart';
import 'package:task_manger/Features/Home/View/Components/department_users.dart';

class USersPage extends StatelessWidget {
  const USersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const DepartmentUsersWidget(),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: 50);
  }
}
