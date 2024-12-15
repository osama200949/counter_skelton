part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}
final class CounterIncrementSuccess extends CounterState {
  int newValue;
  CounterIncrementSuccess(this.newValue);
}

final class CounterLoading extends CounterState {}
