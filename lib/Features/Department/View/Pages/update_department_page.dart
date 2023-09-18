import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Features/Department/View/Components/department_drop_dowen.dart';
import 'package:task_manger/Features/Department/View/Components/manager_drop_dowen.dart';
import 'package:task_manger/Features/Department/ViewModel/cubit/department_cubit.dart';

class UpdateDepartmentPage extends StatefulWidget {
  const UpdateDepartmentPage({super.key});

  @override
  State<UpdateDepartmentPage> createState() => _UpdateDepartmentPageState();
}

class _UpdateDepartmentPageState extends State<UpdateDepartmentPage> {
  SingleValueDropDownController managerDropDownController =
      SingleValueDropDownController();
  SingleValueDropDownController departmentDropDownController =
      SingleValueDropDownController();
  @override
  void dispose() {
    // TODO: implement dispose
    departmentDropDownController.dispose();
    managerDropDownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentCubit()
        ..getAllManagers()
        ..getAllDepartment(),
      child: BlocConsumer<DepartmentCubit, DepartmentState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cupit = DepartmentCubit.get(context);
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Update Department!",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 38),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Update  department details and assign a new manager to continue work!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 22),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DepartmentDropDown(
                      controller: departmentDropDownController,
                      hint: 'Select Department',
                      list: cupit.departments,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ManagerDropDown(
                      controller: managerDropDownController,
                      hint: 'Select Manager',
                      list: cupit.mangers,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 15,
                      child: MaterialButton(
                        onPressed: () {
                          cupit.updateDepartment(
                              departmentDropDownController.dropDownValue!.name,
                              managerDropDownController.dropDownValue!.value!,
                              departmentDropDownController
                                  .dropDownValue!.value!);
                        },
                        color: const Color(0xff5a55ca),
                        child: const Text(
                          "UPDATE",
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
        },
      ),
    );
  }
}
