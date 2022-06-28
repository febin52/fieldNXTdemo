import 'dart:async';

import 'package:fieldnxtdemo/bloc/profilebloc/profileevents.dart';
import 'package:fieldnxtdemo/bloc/profilebloc/profilestate.dart';
import 'package:fieldnxtdemo/data/dbhelper.dart';
import 'package:fieldnxtdemo/data/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<CoreEvent, CoreState> {
  ProfileBloc() : super(CoreState()) {
    on<GetProfile>(_getProfile);
  }
//profile
  Future<FutureOr<void>> _getProfile(
      GetProfile event, Emitter<CoreState> emit) async {
    emit(RetreivingProfileData());
    ProfileModel profileModel;
    List<Map<String, dynamic>> list = await SqlHelper.getItems();
    profileModel = ProfileModel.fromJson(list[0]);
    emit(ProfileSuccess(profileModel: profileModel));
  }
}
