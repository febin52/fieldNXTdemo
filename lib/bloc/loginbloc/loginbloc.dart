import 'dart:async';

import 'package:fieldnxtdemo/bloc/loginbloc/loginevents.dart';
import 'package:fieldnxtdemo/bloc/loginbloc/loginstates.dart';
import 'package:fieldnxtdemo/data/dbhelper.dart';
import 'package:fieldnxtdemo/data/models/login_model.dart';
import 'package:fieldnxtdemo/data/models/profile_model.dart';
import 'package:fieldnxtdemo/data/repositories.dart';
import 'package:fieldnxtdemo/utilities/sharedpreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginBloc extends Bloc<GetOtpEvent, LoginStates> {
  ProfileModel profileModel = ProfileModel();
  LoginBloc() : super(LoginInitial()) {
    on<Verify>(verify);
  }

  Future<FutureOr<void>> verify(Verify event, Emitter<LoginStates> emit) async {
    emit(StartLoading());

    LoginModel loginModel;

    Map<String, String> data = {
      "username": event.number,
      "password": event.password,
      "appVersion": "1.10",
    };

    loginModel = await Repository().login(url: '/login', data: data);
    if (loginModel.code == 200) {
        Fluttertoast.showToast(msg: loginModel.message!);
      await addData(loginModel);
      await SqlHelper.createItem(profileModel);
      print(await SqlHelper.getItems());
      await PrefManager.setToken(loginModel.data!.token!);

      emit(LoginSuccess());
    } else if (loginModel.code == 401) {
      emit(LoginError(error: loginModel.message!));
      Fluttertoast.showToast(msg: loginModel.message!);
    } else {
      Fluttertoast.showToast(msg: loginModel.message!);
      emit(LoginError(error: loginModel.message!));
    }
  }

  addData(loginModel) {
    profileModel.id = loginModel.data!.id;
    profileModel.token = loginModel.data!.token;
    profileModel.tokenExpires = loginModel.data!.tokenExpires;
    profileModel.firstName = loginModel.data!.firstName;
    profileModel.lastName = loginModel.data!.lastName;
    profileModel.contactNo = loginModel.data!.contactNo;
    profileModel.empCode = loginModel.data!.empCode;
    profileModel.role = loginModel.data!.role;
  }
}
