part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncrement extends CounterEvent {
  int value;
  CounterIncrement(this.value);
}

class CounterInitialCounter extends CounterEvent {}
