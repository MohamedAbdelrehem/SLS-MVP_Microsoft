import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

part 'car_realtime_state.dart';

class CarRealtimeCubit extends Cubit<CarRealtimeState> {
  CarRealtimeCubit() : super(CarRealtimeInitial());

  final database = FirebaseDatabase.instance.ref().child('car');
  String car1 = "0";

  void loadCarData() async {
    emit(CarRealtimeLoading());

    try {
      final event = await database.once(DatabaseEventType.value);
      car1 = event.snapshot.value.toString();
      print(car1);
      emit(CarRealtimeChanged());
    } catch (e) {
      emit(CarRealtimeFailure());
    }

    try {
      database.child('car').onChildChanged.listen((event) {
        final car1 = event.snapshot.value;
        emit(CarRealtimeChanged());
      });
    } catch (e) {
      emit(CarRealtimeFailure());
    }
    // final event = await database.child('car').once(DatabaseEventType.value);
    // temparture = event.snapshot.value?['temp'];
  }
}
