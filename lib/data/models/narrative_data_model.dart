class AllNarrativeNodesList {
  late List<NarrativeNode> narrative;

  AllNarrativeNodesList({required this.narrative});

  AllNarrativeNodesList.fromJson(Map<String, dynamic> json) {
    narrative = <NarrativeNode>[];
    json['adventure'].forEach((v) {
      narrative.add(NarrativeNode.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['adventure'] = narrative.map((v) => v.toJson()).toList();

    return data;
  }
}

class NarrativeNode {
  late int id;
  late bool? save;
  late String title;
  late String nodeName;
  late List<Option> options;

  NarrativeNode({
    required this.id,
    required this.save,
    required this.title,
    required this.nodeName,
    required this.options,
  });

  NarrativeNode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    nodeName = json['nodeName'];
    save = json['save'] ?? false;
    options = <Option>[];
    json['options'].forEach((v) {
      options.add(Option.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['nodeName'] = nodeName;
    if (save != null) {
      data['save'] = save;
    }
    data['options'] = options.map((v) => v.toJson()).toList();

    return data;
  }
}

class Option {
  late int index;
  late int nextNode;
  late String text;
  late Remove? removeParams;
  late Map<String, bool>? setState;
  late Map<String, bool>? requiredState;

  Option({
    required this.index,
    required this.text,
    required this.nextNode,
    this.setState,
    this.requiredState,
    this.removeParams,
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
    removeParams =
        json['remove'] != null ? Remove.fromJson(json['remove']) : null;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['index'] = index;
    data['text'] = text;
    data['nextText'] = nextNode;
    if (setState != null) {
      data['setState'] = setState;
    }
    if (requiredState != null) {
      data['requiredState'] = requiredState;
    }
    if (removeParams != null) {
      data['remove'] = removeParams!.toJson();
    }
    return data;
  }
}

class Remove {
  String? nodeName;
  late int id;
  late int optionIndex;

  Remove({
    this.nodeName,
    required this.id,
    required this.optionIndex,
  });

  Remove.fromJson(Map<String, dynamic> json) {
    nodeName = json['nodeName'];
    id = json['id'];
    optionIndex = json['optionIndex'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (nodeName != null) data['nodeName'] = nodeName;
    data['id'] = id;
    data['optionIndex'] = optionIndex;
    return data;
  }
}
