import 'package:bloc_practice/presentation/cubit/data_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _email = TextEditingController();
    return Scaffold(
        body: BlocConsumer<DataCubit, DataState>(
          listenWhen: (_){,
          listener: (context, state) {
            print('listen $state');
            if(state is DataSucc){
              print('listen Success $state');
              SnackBar(
                content: Text('Welcome user'),
                backgroundColor: Colors.teal,
              );
            }
            if(state is DataFailure){
              SnackBar(
                content: Text('user Not Able to Login'),
                backgroundColor: Colors.teal,
              );
            }
          },
          builder: (context, state) {
            print('builder State $state');
            return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _name,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      icon: Icon(
                        Icons.account_circle_outlined,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    controller: _email,
                    validator: (val) {
                      if (!EmailValidator.validate(val.toString())) {
                        return 'Pls enter valid email address';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.email_outlined,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  ElevatedButton(onPressed: () {
                    context.read<DataCubit>().dataPass(_name.text, _email.text);

                  }, child: Text('Login'))

                ],
              ),
            );
          },
        )
    );
  }
}
