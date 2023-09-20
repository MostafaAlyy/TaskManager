import 'package:flutter/material.dart';
import 'package:task_manger/Features/Auth/Model/user_model.dart';
import 'package:task_manger/Features/Auth/ViewModel/AuthCupit/auth_cupit.dart';
import 'package:task_manger/Features/Tasks/Model/task_moudel.dart';
import 'package:task_manger/Features/Tasks/VIewModel/TaskCubit/task_cubit.dart';

Future updateTaskDialog({
  required BuildContext context,
  required TaskCubit cupit,
  required int taskIndex,
}) {
  TextEditingController titleController =
      TextEditingController(text: cupit.allTasks[taskIndex].name);
  TextEditingController descriptionController =
      TextEditingController(text: cupit.allTasks[taskIndex].description);

  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Sign In",
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width / 1.1,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: UpdateTaskWidget(
              cupit: cupit,
              taskIndex: taskIndex,
              titleController: titleController,
              descriptionController: descriptionController,
            ),
          ),
        );
      });
}

class UpdateTaskWidget extends StatefulWidget {
  const UpdateTaskWidget({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.cupit,
    required this.taskIndex,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TaskCubit cupit;
  final int taskIndex;

  @override
  State<UpdateTaskWidget> createState() => _UpdateTaskWidgetState();
}

class _UpdateTaskWidgetState extends State<UpdateTaskWidget> {
  TaskStatus taskStatus = TaskStatus.NEW;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (AuthCupit.userData!.userType == UserTypes.admin ||
                  AuthCupit.userData!.userType == UserTypes.manager)
                TextField(
                  controller: widget.titleController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              if (AuthCupit.userData!.userType == UserTypes.user)
                Text(
                  '${widget.cupit.allTasks[widget.taskIndex].name}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Assigned by',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        widget.cupit.allTasks[widget.taskIndex].creator!.name!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Due date',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        widget.cupit.allTasks[widget.taskIndex].endDate!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all()),
                    child: Center(
                      child: Row(
                        children: [
                          Radio<TaskStatus>(
                            value: TaskStatus.NEW,
                            groupValue: taskStatus,
                            onChanged: (value) {
                              setState(() {
                                taskStatus = value!;
                              });
                            },
                          ),
                          const Text(
                            'NEW',
                            style: TextStyle(fontSize: 7),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.27,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all()),
                    child: Row(
                      children: [
                        Radio<TaskStatus>(
                          value: TaskStatus.PROCCESSING,
                          groupValue: taskStatus,
                          onChanged: (value) {
                            setState(() {
                              taskStatus = value!;
                            });
                          },
                        ),
                        const Text(
                          'PROCCESSING',
                          style: TextStyle(fontSize: 7),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all()),
                    child: Row(
                      children: [
                        Radio<TaskStatus>(
                          value: TaskStatus.CANCELED,
                          groupValue: taskStatus,
                          onChanged: (value) {
                            setState(() {
                              taskStatus = value!;
                            });
                          },
                        ),
                        const Text(
                          'CANCELED',
                          style: TextStyle(fontSize: 7),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all()),
                    child: Center(
                      child: Row(
                        children: [
                          Radio<TaskStatus>(
                            value: TaskStatus.COMPLETED,
                            groupValue: taskStatus,
                            onChanged: (value) {
                              setState(() {
                                taskStatus = value!;
                              });
                            },
                          ),
                          const Text(
                            'COMPLETED',
                            style: TextStyle(fontSize: 7),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.27,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all()),
                    child: Row(
                      children: [
                        Radio<TaskStatus>(
                          value: TaskStatus.NOTCOMPLETED,
                          groupValue: taskStatus,
                          onChanged: (value) {
                            setState(() {
                              taskStatus = value!;
                            });
                          },
                        ),
                        const Text(
                          'NOTCOMPLETED',
                          style: TextStyle(fontSize: 6),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all()),
                    child: Row(
                      children: [
                        Radio<TaskStatus>(
                          value: TaskStatus.EXPIRED,
                          groupValue: taskStatus,
                          onChanged: (value) {
                            setState(() {
                              taskStatus = value!;
                            });
                          },
                        ),
                        const Text(
                          'EXPIRED',
                          style: TextStyle(fontSize: 7),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              if (AuthCupit.userData!.userType == UserTypes.admin ||
                  AuthCupit.userData!.userType == UserTypes.manager)
                TextField(
                  controller: widget.descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              if (AuthCupit.userData!.userType == UserTypes.user)
                Text(
                  '${widget.cupit.allTasks[widget.taskIndex].description}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 15,
                child: MaterialButton(
                  onPressed: () {
                    widget.cupit.allTasks[widget.taskIndex].name =
                        widget.titleController.text;
                    widget.cupit.allTasks[widget.taskIndex].description =
                        widget.descriptionController.text;
                    widget.cupit.allTasks[widget.taskIndex].status = taskStatus
                        .toString()
                        .replaceFirst('TaskStatus.', '')
                        .toLowerCase();
                    widget.cupit.updateTask(
                        task: widget.cupit.allTasks[widget.taskIndex]);
                    Navigator.pop(context);
                  },
                  color: const Color(0xff5a55ca),
                  child: const Text(
                    "Update",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 15,
                child: MaterialButton(
                  onPressed: () {
                    widget.cupit.deleteTask(
                        taskId: widget.cupit.allTasks[widget.taskIndex].id!);
                    Navigator.pop(context);
                  },
                  color: const Color(0xff5a55ca),
                  child: const Text(
                    "Delete Task",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum TaskStatus { NEW, PROCCESSING, COMPLETED, NOTCOMPLETED, CANCELED, EXPIRED }
