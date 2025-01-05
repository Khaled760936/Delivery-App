import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cubit/User_state.dart';
import 'package:test/models/sign_in_model.dart';
import 'package:test/models/sign_up_model.dart';
import 'package:test/repositories/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());
  final UserRepository userRepository;
  TextEditingController signInPhonerNumber = TextEditingController();

  TextEditingController signInPassword = TextEditingController();

  TextEditingController signUpFirstName = TextEditingController();

  TextEditingController signUpNumber = TextEditingController();

  TextEditingController signUpPassword = TextEditingController();

  TextEditingController signUpLastName = TextEditingController();

  SignInModel? signInModel;

  SignUpModel? signUpModel;


  

  signIn() async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
        phoneNumber: signInPhonerNumber.text, password: signInPassword.text);
    response.fold(
        (errorMessage) => emit(SignInFailure(errorMessage: errorMessage)),
        (SignInModel) => emit(SignInSuccess(message: 'success')));
  }

  signUp() async {
    emit(SignUpLoading());
    final response = await userRepository.signUp(
      firstName: signUpFirstName.text,
      lastName: signUpLastName.text,
      phoneNumber: signUpNumber.text,
      password: signUpPassword.text,
    );
    response.fold(
        (errorMessage) => emit(SignUpFailure(errorMessage: errorMessage)),
        (SignUpModel) => emit(SignUpSuccess(message: 'success')));
  }
}
