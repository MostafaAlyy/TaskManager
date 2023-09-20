import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UserTasksAppBar extends StatefulWidget {
  const UserTasksAppBar({super.key, required this.advancedDrawerController});
  final AdvancedDrawerController advancedDrawerController;

  @override
  State<UserTasksAppBar> createState() => _UserTasksAppBarState();
}

class _UserTasksAppBarState extends State<UserTasksAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              widget.advancedDrawerController.showDrawer();
            },
            child: SvgPicture.asset(
              'assets/icons/Vector.svg',
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Today',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
      const Spacer(),
      CircularPercentIndicator(
        radius: 27.0,
        lineWidth: 5.0,
        percent: 0.90,
        center: const Text("9/10"),
        progressColor: Colors.green,
      ),
      const SizedBox(
        width: 30,
      ),
      CircularPercentIndicator(
        radius: 27.0,
        lineWidth: 5.0,
        percent: 0.90,
        center: const Text("9/10"),
        progressColor: Colors.orange,
      ),
      const SizedBox(
        width: 30,
      ),
      CircularPercentIndicator(
        radius: 27.0,
        lineWidth: 5.0,
        percent: 0.90,
        center: const Text("9/10"),
        progressColor: Colors.red,
      ),
    ]);
  }
}
