part of 'faqs_cubit.dart';

@immutable
sealed class FaqsState {}

final class FaqsInitial extends FaqsState {}
final class FaqsLoading extends FaqsState {}
final class FaqsSuccess extends FaqsState {}
final class FaqsFailure extends FaqsState {
  final String message;
  FaqsFailure(this.message);
}
