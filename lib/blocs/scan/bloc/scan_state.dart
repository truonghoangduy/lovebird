part of 'scan_bloc.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object> get props => [];
}

class ScanInitial extends ScanState {}

class ScanLoading extends ScanState {}

class ScanResult extends ScanState {
  final List<Bio> scanResult;

  ScanResult(this.scanResult);
  @override
  List<Object> get props => [scanResult];
}

class ScanFail extends ScanState {
  final String mess;

  ScanFail(this.mess);
  @override
  List<Object> get props => [mess];
}
