import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrement>((event, emit) async{
      Future.delayed(Duration(seconds: 1));

      emit(CounterIncrementSuccess(event.value + 1));
    });
    on<CounterInitialCounter>((event, emit) {
      emit(CounterIncrementSuccess(0));
    });
  }
}
