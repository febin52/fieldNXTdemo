import 'package:fieldnxtdemo/data/models/profile_model.dart';

class CoreState   {

}

class RetreivingProfileData extends CoreState {}

class ProfileSuccess extends CoreState {
  final ProfileModel profileModel;
  ProfileSuccess({required this.profileModel});
}

class ProfileError extends CoreState {
  final String error;
  ProfileError({required this.error});
}