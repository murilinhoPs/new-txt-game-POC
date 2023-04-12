import 'package:equatable/equatable.dart';

class OptionNode extends Equatable {
  final int index;
  final int nextNode;
  final String text;
  final RemoveParams? removeParams;
  final Map<String, bool>? setState;
  final Map<String, bool>? requiredState;

  const OptionNode({
    required this.index,
    required this.text,
    required this.nextNode,
    this.setState,
    this.requiredState,
    this.removeParams,
  });

  @override
  List<Object?> get props => [
        index,
        text,
        nextNode,
        setState,
        requiredState,
        removeParams,
      ];
}

class RemoveParams extends Equatable {
  final int narrativeNodeId;
  final int optionIndex;

  const RemoveParams({
    required this.narrativeNodeId,
    required this.optionIndex,
  });

  @override
  List<Object?> get props => [
        narrativeNodeId,
        optionIndex,
      ];
}
