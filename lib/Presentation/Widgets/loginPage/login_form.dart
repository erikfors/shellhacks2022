import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

import '../../../Data/Blocs/cubit_login/login_cubit.dart';
import '../../Screens/sign_up_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://i.imgur.com/6A2hlGw.png',
                height: 250,
              ),
              const SizedBox(height: 16),
              _EmailInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 8),
              _LoginButton(),
              const SizedBox(height: 4),
              _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            height: 55.0,
            width: 400.0,
            decoration: BoxDecoration(
              // color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 5),
              child: TextField(
                key: const Key('loginForm_emailInput_textField'),
                onChanged: (email) =>
                    context.read<LoginCubit>().emailChanged(email),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 2, right: 5, top: 6, bottom: 1),
                  hintText: 'Email',
                  helperText: '',
                  errorText: state.email.invalid ? 'Invalid Email' : null,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            height: 55.0,
            width: 400.0,
            decoration: BoxDecoration(
              //color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 5),
              child: TextField(
                key: const Key('loginForm_passwordInput_textField'),
                onChanged: (password) =>
                    context.read<LoginCubit>().passwordChanged(password),
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 2, right: 5, top: 6, bottom: 1),
                  hintText: 'Password',
                  helperText: '',
                  errorText: state.password.invalid ? 'Invalid Password' : null,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  key: const Key('loginForm_continue_raisedButton'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(160, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    //disabledBackgroundColor: Color.fromARGB(255, 215, 216, 219),
                  ),
                  onPressed: state.status.isValidated
                      ? () => context.read<LoginCubit>().logInWithCredentials()
                      : null,
                  child: const Text('Login', style: TextStyle(color: Colors.white),),
                ),
              );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextButton(
        key: const Key('loginForm_createAccount_flatButton'),
        onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
        child: Text(
          'CREATE ACCOUNT',
          style: TextStyle(color: theme.colorScheme.onBackground),
        ),
      ),
    );
  }
}
