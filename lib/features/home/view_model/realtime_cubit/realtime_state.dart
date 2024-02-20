part of 'realtime_cubit.dart';

@immutable
sealed class RealtimeState {}

final class RealtimeInitial extends RealtimeState {}
final class RealtimeLoadiang extends RealtimeState {}
final class RealtimeSuccess extends RealtimeState {}
final class RealtimeFailure extends RealtimeState {}
