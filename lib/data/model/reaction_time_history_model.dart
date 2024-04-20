class ReactionTimeHistoryModel {
  String? date;
  int? reactionTime;

  ReactionTimeHistoryModel({this.date, this.reactionTime});

  ReactionTimeHistoryModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    reactionTime = json['reactionTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = date;
    data['reactionTime'] = reactionTime;
    return data;
  }
}