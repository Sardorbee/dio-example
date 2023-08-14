import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(countValue: 0));
  void increment() => emit(CounterState(countValue: state.countValue + 1, isPressed: true,));
  void decrement() => emit(CounterState(countValue: state.countValue - 1, isPressed: false,));
}
