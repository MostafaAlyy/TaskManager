import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

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
              const Text(
                'Employee name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                  color: Colors.purple.withOpacity(0.3),
                  child: const Text(' Admin ')),
              const Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 16,
                  ),
                  Text(' email')
                ],
              ),
              const Row(
                children: [
                  Icon(
                    Icons.phone_outlined,
                    size: 16,
                  ),
                  Text(' phone')
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
