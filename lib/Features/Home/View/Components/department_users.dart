import 'package:flutter/material.dart';
import 'package:task_manger/Features/Home/View/Components/user_card.dart';

class DepartmentUsersWidget extends StatelessWidget {
  const DepartmentUsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: Row(
            children: [
              Container(
                height: 1,
                color: Colors.grey,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'department name',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Icon(
                Icons.edit_note_outlined,
                color: Colors.grey,
              )
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 4,
          itemBuilder: (context, index) => const UserCard(),
        ),
      ],
    );
  }
}
