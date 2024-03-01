part of 'fetch_users_cubit.dart';

@immutable
sealed class FetchUsersState {}

final class FetchUsersInitial extends FetchUsersState {}
final class FetchUsersLoading extends FetchUsersState {}
final class FetchUsersSuccess extends FetchUsersState {}
final class FetchUsersFailure extends FetchUsersState {}
