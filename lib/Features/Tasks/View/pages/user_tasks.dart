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

class UserTasksPage extends StatefulWidget {
  const UserTasksPage({super.key});

  @override
  State<UserTasksPage> createState() => _UserTasksPageState();
}

class _UserTasksPageState extends State<UserTasksPage> {
  final advancedDrawerController = AdvancedDrawerController();
  Widget selectedScreenWidget = const USersPage();
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: const HomeDrawer(),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
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
                          UserTasksAppBar(
                            advancedDrawerController: advancedDrawerController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
            ),
          ),
        ),
      ),
    );
  }
}
