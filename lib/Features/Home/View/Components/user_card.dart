import 'package:flutter/material.dart';
import 'package:task_manger/Features/Department/Model/department_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.employee});
  final Employees employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Container(
            width: 5,
            height: double.infinity,
            color: const Color(0xff5a55ca),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                employee.name!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                  color: Colors.purple.withOpacity(0.3),
                  child: Text(employee.userType!)),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.email_outlined,
                    size: 16,
                  ),
                  Text(
                    employee.email!,
                    style: const TextStyle(fontSize: 10),
                  )
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone_outlined,
                    size: 16,
                  ),
                  Text(employee.phone.toString())
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
