import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manger/Features/Home/View/Components/home_drawer.dart';
import 'package:task_manger/Features/Home/View/Components/time_line.dart';
import 'package:task_manger/Features/Tasks/VIewModel/TaskCubit/task_cubit.dart';
import 'package:task_manger/Features/Tasks/View/components/user_tasks_appbar.dart';
import 'package:task_manger/Features/Tasks/View/components/task_card.dart';
import 'package:task_manger/Features/Home/View/Pages/users_page.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final advancedDrawerController = AdvancedDrawerController();
  Widget selectedScreenWidget = const USersPage();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => TaskCubit()..getAllTasks(),
        child: BlocConsumer<TaskCubit, TaskState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is UpdateTasksSussesState) {
              Fluttertoast.showToast(
                  msg: state.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 12.0);
            }
            if (state is UpdateTasksErrorState) {
              Fluttertoast.showToast(
                  msg: state.errorMessage,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 12.0);
            }
          },
          builder: (context, state) {
            var cupit = TaskCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  const TimeLine(),
                  if (state is GetAllTasksLoadingState)
                    const LinearProgressIndicator(),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => TaskCard(
                            cupit: cupit,
                            taskIndex: index,
                          ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: cupit.allTasks.length)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
