part of 'vehicles_cubit.dart';

@immutable
sealed class VehiclesState {}

final class VehiclesInitial extends VehiclesState {}
final class VehichlesGetLoading extends VehiclesState {}
final class VehiclesGetSuccess extends VehiclesState {}
final class VehiclesGetFailure extends VehiclesState {}

final class VehiclesAddLoading extends VehiclesState {}
final class VehiclesAddSuccess extends VehiclesState {}
final class VehiclesAddFailure extends VehiclesState {}