import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:formz/formz.dart';
import 'package:shellhacks2022/Presentation/Screens/account_create_page.dart';

import '../../../Data/Blocs/cubit_sign_up/sign_up_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _EmailInput(),
            const SizedBox(height: 8),
            _PasswordInput(),
            const SizedBox(height: 8),
            _ConfirmPasswordInput(),
            const SizedBox(height: 8),
            _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Container(
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
              key: const Key('signUpForm_emailInput_textField'),
              onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding:
                          EdgeInsets.only(left: 2, right: 5, top: 6, bottom: 1),
                hintText: 'email',
                helperText: '',
                errorText: state.email.invalid ? 'invalid email' : null,
                border: InputBorder.none
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
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Container(
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
              key: const Key('signUpForm_passwordInput_textField'),
              onChanged: (password) =>
                  context.read<SignUpCubit>().passwordChanged(password),
              obscureText: true,
              decoration: InputDecoration(
                 contentPadding:
                      EdgeInsets.only(left: 2, right: 5, top: 6, bottom: 1),
                hintText: 'password',
                helperText: '',
                errorText: state.password.invalid ? 'invalid password' : null,
                border: InputBorder.none
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return Container(
            height: 55.0,
            width: 400.0,
            decoration: BoxDecoration(
              //color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 5),
            child: TextField(
              key: const Key('signUpForm_confirmedPasswordInput_textField'),
              onChanged: (confirmPassword) => context
                  .read<SignUpCubit>()
                  .confirmedPasswordChanged(confirmPassword),
              obscureText: true,
              decoration: InputDecoration(
                contentPadding:
                      EdgeInsets.only(left: 2, right: 5, top: 6, bottom: 1),
                hintText: 'confirm password',
                helperText: '',
                errorText: state.confirmedPassword.invalid
                    ? 'passwords do not match'
                    : null,
                    border: InputBorder.none
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  key: const Key('signUpForm_continue_raisedButton'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(160, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: state.status.isValidated
                      ? () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ascontext) => CreateAccountPage(
                                  oldContext: context, email: state.email.value),
                            ),
                          )
                      : null,
                  child: const Text('SIGN UP'),
                ),
            );
      },
    );
  }
}
