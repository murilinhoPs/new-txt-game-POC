import 'package:equatable/equatable.dart';
import 'package:txt_game_poc/entities/narrative_node.dart';

class NarrativeList extends Equatable {
  final List<NarrativeNode> narrative;

  const NarrativeList({required this.narrative});

  @override
  List<Object?> get props => [narrative];
}
