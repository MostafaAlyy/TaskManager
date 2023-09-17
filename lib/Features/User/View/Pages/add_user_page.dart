import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manger/Features/Auth/Model/user_model.dart';
import 'package:task_manger/Features/Department/ViewModel/cubit/department_cubit.dart';
import 'package:task_manger/Features/User/ViewModel/cubit/user_cubit.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  UserTypes userType = UserTypes.admin;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          // TODO: implement listener

          if (state is AddUserSuccessState) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 12.0);
          }
          if (state is AddUserErrorState) {
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
                      "Add New User!",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 38),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create a new user now and assign them tasks right away.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 22),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "Name",
                      ),
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
                          cupit.addUser(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              userType: (userType == UserTypes.admin)
                                  ? 0
                                  : (userType == UserTypes.manager)
                                      ? 1
                                      : 2);
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
