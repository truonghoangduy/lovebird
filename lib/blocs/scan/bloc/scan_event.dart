part of 'scan_bloc.dart';

abstract class ScanEvent extends Equatable {
  const ScanEvent();

  @override
  List<Object> get props => [];
}

class ScanStartEvent extends ScanEvent {}

class ScanResultFlowingEvent extends ScanEvent {
  final Bio bio;

  ScanResultFlowingEvent(this.bio);
  @override
  List<Object> get props => [bio];
}
