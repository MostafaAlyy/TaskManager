import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Features/Department/Model/department_model.dart';
import 'package:task_manger/Features/Department/ViewModel/cubit/department_cubit.dart';

class DepartmentDropDown extends StatelessWidget {
  SingleValueDropDownController controller;
  String hint;
  List<Department> list;
  DepartmentDropDown({
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
              textFieldDecoration: const InputDecoration(
                labelText: "Select Department",
                enabledBorder: OutlineInputBorder(),
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
