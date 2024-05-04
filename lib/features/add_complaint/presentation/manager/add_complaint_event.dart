part of 'add_complaint_bloc.dart';


abstract class BaseAddComplaintEvent {}

class AddComplaintEvent extends BaseAddComplaintEvent{
  final AddComplaintsModel addComplaintsModel;

  AddComplaintEvent({required this.addComplaintsModel});
}