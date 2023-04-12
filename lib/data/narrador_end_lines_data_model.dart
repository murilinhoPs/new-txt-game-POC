class NarradorEndLinesDataModel {
  late List<String> lines;

  NarradorEndLinesDataModel({
    required this.lines,
  });

  NarradorEndLinesDataModel.fromJson(Map<String, dynamic> json) {
    lines = json['lines'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['lines'] = lines;
    return data;
  }
}
