part of 'car_realtime_cubit.dart';

@immutable
sealed class CarRealtimeState {}

final class CarRealtimeInitial extends CarRealtimeState {}

final class CarRealtimeLoading extends CarRealtimeState {}

final class CarRealtimeChanged extends CarRealtimeState {
  // final Map<String, dynamic> data;
  // CarRealtimeChanged(this.data);
}

final class CarRealtimeFailure extends CarRealtimeState {}
