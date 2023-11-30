part of 'search_bloc.dart';


abstract class BaseSearchEvent {}
 class SearchEvent extends BaseSearchEvent{
  final String title;

  SearchEvent({required this.title});
}
