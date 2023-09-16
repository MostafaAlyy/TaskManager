import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/Features/Auth/ViewModel/AuthCupit/auth_cupit.dart';

class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCupit(),
        child: BlocConsumer<AuthCupit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cupit = AuthCupit.get(context);
            return Center(
                child: ElevatedButton(
                    child: const Text("Log Out"),
                    onPressed: () {
                      cupit.logout();
                      Navigator.pop(context);
                    }));
          },
        ),
      ),
    );
  }
}
