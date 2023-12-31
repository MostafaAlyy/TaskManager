import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Features/Department/ViewModel/cubit/department_cubit.dart';
import 'package:task_manger/Features/User/Model/user_from_users_model.dart';

class UsersDropDown extends StatelessWidget {
  final SingleValueDropDownController controller;
  final String hint;
  final List<UserFromUsersModel> list;
  const UsersDropDown({
    super.key,
    required this.controller,
    required this.hint,
    required this.list,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentCubit(),
      child: BlocConsumer<DepartmentCubit, DepartmentState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cupit = DepartmentCubit.get(context);
          return ConditionalBuilder(
            condition: list.isNotEmpty,
            builder: (context) => DropDownTextField(
              textFieldDecoration: InputDecoration(
                labelText: hint,
                enabledBorder: const OutlineInputBorder(),
              ),
              controller: controller,
              searchDecoration: InputDecoration(hintText: hint),
              enableSearch: true,
              dropDownItemCount: list.length,
              dropDownList: list.map<DropDownValueModel>((value) {
                return DropDownValueModel(
                  value: value.id,
                  name: value.name!,
                );
              }).toList(),
              onChanged: (value) {
                cupit.changeDropDownValue();
                //   controller = value;
              },
            ),
            fallback: (context) => const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
