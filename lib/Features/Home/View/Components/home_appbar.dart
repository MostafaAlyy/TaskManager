import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, required this.advancedDrawerController});
  final AdvancedDrawerController advancedDrawerController;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  SampleItem? selectedMenu;

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
      Container(
        decoration: BoxDecoration(
            color: const Color(0xff5a55ca),
            borderRadius: BorderRadius.circular(8)),
        child: PopupMenuButton<SampleItem>(
          initialValue: selectedMenu,
          // Callback that sets the selected popup menu item.
          onSelected: (SampleItem item) {
            setState(() {
              selectedMenu = item;
            });
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          iconSize: 32,
          position: PopupMenuPosition.under,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemOne,
              child: Text('employee'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemTwo,
              child: Text('department'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemThree,
              child: Text('task'),
            ),
          ],
        ),
      ),
    ]);
  }
}

enum SampleItem { itemOne, itemTwo, itemThree }
