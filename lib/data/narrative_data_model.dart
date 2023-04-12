class NarrativeNodesListDataModel {
  late List<NarrativeNodeDataModel> narrative;

  NarrativeNodesListDataModel({required this.narrative});

  NarrativeNodesListDataModel.fromJson(Map<String, dynamic> json) {
    narrative = <NarrativeNodeDataModel>[];
    json['adventure'].forEach((v) {
      narrative.add(NarrativeNodeDataModel.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['adventure'] = narrative.map((v) => v.toJson()).toList();

    return data;
  }
}

class NarrativeNodeDataModel {
  bool? save;
  late int id;
  late String title;
  late String nodeName;
  late List<OptionNodeDataModel> options;

  NarrativeNodeDataModel({
    required this.id,
    required this.save,
    required this.title,
    required this.nodeName,
    required this.options,
  });

  NarrativeNodeDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    nodeName = json['nodeName'];
    save = json['save'] ?? false;
    options = <OptionNodeDataModel>[];
    json['options'].forEach((v) {
      options.add(OptionNodeDataModel.fromJson(v));
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

class OptionNodeDataModel {
  late int index;
  late int nextNode;
  late String text;
  late RemoveDataModel? removeParams;
  late Map<String, bool>? setState;
  late Map<String, bool>? requiredState;

  OptionNodeDataModel({
    required this.index,
    required this.text,
    required this.nextNode,
    this.setState,
    this.requiredState,
    this.removeParams,
  });

  OptionNodeDataModel.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    text = json['text'];
    nextNode = json['nextText'];
    setState = json['setState'] != null
        ? Map<String, bool>.from(json['setState'])
        : null;
    requiredState = json['requiredState'] != null
        ? Map<String, bool>.from(json['requiredState'])
        : null;
    removeParams = json['remove'] != null
        ? RemoveDataModel.fromJson(json['remove'])
        : null;
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

class RemoveDataModel {
  String? nodeName;
  late int id;
  late int optionIndex;

  RemoveDataModel({
    this.nodeName,
    required this.id,
    required this.optionIndex,
  });

  RemoveDataModel.fromJson(Map<String, dynamic> json) {
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
