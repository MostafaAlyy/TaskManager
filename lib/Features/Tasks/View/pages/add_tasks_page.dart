import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:task_manger/Features/Auth/ViewModel/AuthCupit/auth_cupit.dart';
import 'package:task_manger/Features/Department/View/Components/department_drop_dowen.dart';
import 'package:task_manger/Features/Department/ViewModel/cubit/department_cubit.dart';
import 'package:task_manger/Features/Tasks/VIewModel/TaskCubit/task_cubit.dart';
import 'package:task_manger/Features/User/View/Components/users_drob_dowen_menu.dart';
import 'package:task_manger/Features/User/ViewModel/cubit/user_cubit.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateRangePickerController datePikerController = DateRangePickerController();
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  SingleValueDropDownController userController =
      SingleValueDropDownController();

  @override
  dispose() {
    userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AddTaskSuccessState) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 12.0);
          }
          if (state is AddTaskErrorState) {
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
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Add New Task!",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 38),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create a new task now and assign it to employees right away.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 22),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(6)),
                      child: SfDateRangePicker(
                          view: DateRangePickerView.month,
                          controller: datePikerController,
                          monthViewSettings:
                              const DateRangePickerMonthViewSettings(
                                  firstDayOfWeek: 6),
                          selectionMode: DateRangePickerSelectionMode.range,
                          showActionButtons: false,
                          onSubmit: (val) {
                            print(val);
                          },
                          onCancel: () {}),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: taskTitleController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "Title",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: taskDescriptionController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "Description",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocProvider(
                      create: (context) => UserCubit()..getAllEmployee(),
                      child: BlocConsumer<UserCubit, UserState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return UsersDropDown(
                              controller: userController,
                              hint: 'Select User',
                              list: UserCubit.get(context).allEmployee);
                        },
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
                          cupit.addTask(
                              name: taskTitleController.text,
                              description: taskDescriptionController.text,
                              employeeId: userController.dropDownValue!.value
                                  .toString(),
                              endDate:
                                  '${datePikerController.selectedRange!.endDate!.year}-${datePikerController.selectedRange!.endDate!.month}-${datePikerController.selectedRange!.endDate!.day}',
                              startDate:
                                  '${datePikerController.selectedRange!.startDate!.year}-${datePikerController.selectedRange!.startDate!.month}-${datePikerController.selectedRange!.startDate!.day}');
                        },
                        color: const Color(0xff5a55ca),
                        child: const Text(
                          "CREATE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
