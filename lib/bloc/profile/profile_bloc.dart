import 'package:bloc/bloc.dart';
import 'package:flutter_auth_bloc/data/datasources/api_datasources.dart';
import 'package:meta/meta.dart';

import '../../data/models/responses/profile_response.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ApiDatasource datasource;
  ProfileBloc(
    this.datasource,
  ) : super(ProfileInitial()) {
    on<SaveProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await datasource.profile();
      emit(ProfileLoaded(model: result));
    });
  }
}
