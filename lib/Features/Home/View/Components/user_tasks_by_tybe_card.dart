import 'package:flutter/material.dart';

class UserTasksByTypeCard extends StatelessWidget {
  UserTasksByTypeCard({
    super.key,
    required this.color,
    required this.title,
  });
  String title;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
            ),
          ],
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Color(0xff5a55ca)),
            ),
            const Divider(),
            Row(
              children: [
                Container(
                  width: 5,
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: color,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create a High-Intensity Interval...',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Design a 20-minute HIIT workout routine.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Icon(Icons.timelapse),
                SizedBox(
                  width: 3,
                ),
                Text('starts 12/9/2023 - ends 16/9/2023')
              ],
            )
          ]),
        ),
      ),
    );
  }
}
