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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
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

              Container(
                height: 55.0,
                width: 400.0,
                decoration: BoxDecoration(
                  //color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 5),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 2, right: 5, top: 6, bottom: 1),
                        hintText: 'Name',
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 55.0,
                width: 400.0,
                decoration: BoxDecoration(
                  //color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 5),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 2, right: 5, top: 6, bottom: 1),
                        hintText: 'Phone Number',
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 55.0,
                width: 400.0,
                decoration: BoxDecoration(
                  //color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 5),
                  child: TextFormField(
                    controller: zipCodeController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 2, right: 5, top: 6, bottom: 1),
                        hintText: 'Zip Code',
                        border: InputBorder.none),
                  ),
                ),
              ),
              // button to submit form
               SizedBox(
                  height: 15,
                ),
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
      ),
    );
  }
}
