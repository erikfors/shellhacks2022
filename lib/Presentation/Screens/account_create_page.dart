import 'package:flutter/material.dart';
import 'package:shellhacks2022/Data/Repositories/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Models/user.dart';
import '../../../Data/Blocs/cubit_sign_up/sign_up_cubit.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({Key? key, required this.oldContext, required this.email})
      : super(key: key);

  final BuildContext oldContext;
  final String email;
//context.read<SignUpCubit>().signUpFormSubmitted()
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final zipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // form to get user info
            //   const User({
            //   required this.id,
            //   this.email,
            //   this.name,
            //   this.photo,
            //   this.phoneNumber,
            //   this.zipCode,
            // });
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),

            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextFormField(
              controller: zipCodeController,
              decoration: InputDecoration(
                labelText: 'Zip Code',
              ),
            ),
            // button to submit form
            ElevatedButton(
              onPressed: () {
                CacheClient client = CacheClient();

                client.write(
                  key: 'user',
                  value: User(
                    id: '1',
                    email: email,
                    name: nameController.text,
                    photo: '',
                    phoneNumber: phoneController.text,
                    zipCode: int.parse(zipCodeController.text),
                  ),
                );
                oldContext.read<SignUpCubit>().signUpFormSubmitted();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
