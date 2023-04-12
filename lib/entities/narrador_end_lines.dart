import 'package:equatable/equatable.dart';

class NarradorEndLines extends Equatable {
  final List<String> lines;

  const NarradorEndLines({
    required this.lines,
  });

  @override
  List<Object?> get props => [lines];
}
