import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manger/Features/Auth/Model/user_model.dart';
import 'package:task_manger/Features/Department/View/Components/department_drop_dowen.dart';
import 'package:task_manger/Features/Department/ViewModel/cubit/department_cubit.dart';
import 'package:task_manger/Features/User/View/Components/users_drob_dowen_menu.dart';
import 'package:task_manger/Features/User/ViewModel/cubit/user_cubit.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SingleValueDropDownController nameController =
      SingleValueDropDownController();
  final SingleValueDropDownController departmentDropDownController =
      SingleValueDropDownController();
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    departmentDropDownController.dispose();
    super.dispose();
  }

  UserTypes userType = UserTypes.admin;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getAllUsers(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          // TODO: implement listener

          if (state is UpdateUserSuccessState) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 12.0);
          }
          if (state is UpdateUserErrorState) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 12.0);
          }
        },
        builder: (context, state) {
          var cupit = UserCubit.get(context);
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Update User Details!",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 38),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Update user details and give them a new identity.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 22),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    UsersDropDown(
                      controller: nameController,
                      hint: 'Select User',
                      list: cupit.allUsers,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "Email",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "Phone",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "Password",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocProvider(
                      create: (context) =>
                          DepartmentCubit()..getAllDepartment(),
                      child: BlocConsumer<DepartmentCubit, DepartmentState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          var departmentCupit = DepartmentCubit.get(context);
                          return DepartmentDropDown(
                            controller: departmentDropDownController,
                            hint: 'Select Department',
                            list: departmentCupit.departments,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all()),
                          child: Row(
                            children: [
                              Radio<UserTypes>(
                                value: UserTypes.admin,
                                groupValue: userType,
                                onChanged: (value) {
                                  setState(() {
                                    userType = value!;
                                  });
                                },
                              ),
                              const Text('Admin'),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all()),
                          child: Row(
                            children: [
                              Radio<UserTypes>(
                                value: UserTypes.manager,
                                groupValue: userType,
                                onChanged: (value) {
                                  setState(() {
                                    userType = value!;
                                  });
                                },
                              ),
                              const Text('Manager'),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all()),
                          child: Row(
                            children: [
                              Radio<UserTypes>(
                                value: UserTypes.user,
                                groupValue: userType,
                                onChanged: (value) {
                                  setState(() {
                                    userType = value!;
                                  });
                                },
                              ),
                              const Text('User'),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 15,
                      child: MaterialButton(
                        onPressed: () {
                          cupit.updateUser(
                              name: nameController.dropDownValue!.name,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              userType: (userType == UserTypes.admin)
                                  ? 0
                                  : (userType == UserTypes.manager)
                                      ? 1
                                      : 2,
                              departmentId: departmentDropDownController
                                  .dropDownValue!.value,
                              userId: nameController.dropDownValue!.value);
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
