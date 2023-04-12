class WithdrawLinesDataModel {
  late List<String> lines;

  WithdrawLinesDataModel({
    required this.lines,
  });

  WithdrawLinesDataModel.fromJson(Map<String, dynamic> json) {
    lines = json['lines'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['lines'] = lines;
    return data;
  }
}
