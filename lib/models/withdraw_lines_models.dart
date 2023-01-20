class WithdrawLines {
  late List<String> lines;

  WithdrawLines({
    required this.lines,
  });

  WithdrawLines.fromJson(Map<String, dynamic> json) {
    lines = json['lines'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['lines'] = lines;
    return data;
  }
}
