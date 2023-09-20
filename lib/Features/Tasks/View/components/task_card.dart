import 'package:flutter/material.dart';
import 'package:task_manger/Features/Tasks/Model/task_moudel.dart';
import 'package:task_manger/Features/Tasks/VIewModel/TaskCubit/task_cubit.dart';
import 'package:task_manger/Features/Tasks/View/components/update_tasl_dialog.dart';
import 'package:task_manger/Features/Tasks/View/pages/user_tasks.dart';

class TaskCard extends StatelessWidget {
  TaskCard({
    super.key,
    required this.taskIndex,
    required this.cupit,
  });

  TaskCubit cupit;
  int taskIndex;
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
              cupit.allTasks[taskIndex].status!.toUpperCase(),
              style: TextStyle(
                  fontSize: 16,
                  color: getStatusColor(cupit.allTasks[taskIndex].status!)),
            ),
            const Divider(),
            Row(
              children: [
                Container(
                  width: 5,
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: getStatusColor(cupit.allTasks[taskIndex].status!),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        cupit.allTasks[taskIndex].name!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        cupit.allTasks[taskIndex].description!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      updateTaskDialog(
                          context: context, cupit: cupit, taskIndex: taskIndex);
                    },
                    icon: const Icon(Icons.edit))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(Icons.timelapse),
                const SizedBox(
                  width: 3,
                ),
                Text(
                    'start ${cupit.allTasks[taskIndex].startDate!} - end ${cupit.allTasks[taskIndex].startDate!}')
              ],
            )
          ]),
        ),
      ),
    );
  }
}

Color getStatusColor(String status) {
  switch (status) {
    case 'new':
      return const Color(0xff5a55ca);

    case 'processing':
      return Colors.orange;

    case 'completed':
      return Colors.teal;

    case 'notcompleted':
      return Colors.red;

    case 'canceled':
      return Colors.green;
    case 'expired':
      return Colors.redAccent;

    default:
      return const Color(0xff5a55ca);
  }
}
