import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Features/Department/ViewModel/cubit/department_cubit.dart';
import 'package:task_manger/Features/Home/View/Components/department_users.dart';

class USersPage extends StatelessWidget {
  const USersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentCubit()..getAllDepartment(),
      child: BlocConsumer<DepartmentCubit, DepartmentState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cupit = DepartmentCubit.get(context);
          return Column(
            children: [
              if (state is GetAllDepartmentsLLoadingState)
                const LinearProgressIndicator(),
              Expanded(
                child: ListView.separated(
                    //  physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => DepartmentUsersWidget(
                          department: cupit.departments[index],
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: cupit.departments.length),
              ),
            ],
          );
        },
      ),
    );
  }
}
