class AllNarrativeNodesList {
  late final List<NarrativeNode> narrative;

  AllNarrativeNodesList({required this.narrative});

  AllNarrativeNodesList.fromJson(Map<String, dynamic> json) {
    narrative = <NarrativeNode>[];
    json['adventure'].forEach((v) {
      narrative.add(NarrativeNode.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['adventure'] = narrative.map((v) => v.toJson()).toList();

    return data;
  }
}

class NarrativeNode {
  late final int id;
  late final String title;
  late final List<Option> options;

  NarrativeNode({
    required this.id,
    required this.title,
    required this.options,
  });

  NarrativeNode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    options = <Option>[];
    json['options'].forEach((v) {
      options.add(Option.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['options'] = options.map((v) => v.toJson()).toList();

    return data;
  }
}

class Option {
  late final int index;
  late final int nextNode;
  late final String text;
  late final Map<String, bool>? setState;
  late final Map<String, bool>? requiredState;

  Option({
    required this.index,
    required this.text,
    required this.nextNode,
    this.setState,
    this.requiredState,
  });

  Option.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    text = json['text'];
    nextNode = json['nextText'];
    setState = json['setState'] != null
        ? Map<String, bool>.from(json['setState'])
        : null;
    requiredState = json['requiredState'] != null
        ? Map<String, bool>.from(json['requiredState'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['index'] = index;
    data['text'] = text;
    data['nextText'] = nextNode;
    if (setState != null) {
      data['setState'] = setState;
    }
    if (requiredState != null) {
      data['requiredState'] = requiredState;
    }
    return data;
  }
}
