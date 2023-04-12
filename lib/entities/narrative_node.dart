import 'package:equatable/equatable.dart';
import 'package:txt_game_poc/entities/option_node.dart';

class NarrativeNode extends Equatable {
  final bool save;
  final int id;
  final String title;
  final String nodeName;
  final List<OptionNode> options;

  const NarrativeNode({
    required this.id,
    required this.save,
    required this.title,
    required this.nodeName,
    required this.options,
  });

  @override
  List<Object?> get props => [
        id,
        save,
        title,
        nodeName,
        options,
      ];
}
