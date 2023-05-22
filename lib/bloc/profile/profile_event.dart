part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class SaveProfileEvent extends ProfileEvent {
  final String response;
  SaveProfileEvent({
    required this.response,
  });
}
