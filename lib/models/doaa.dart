class DoaaModel {
  String? title;
  String? subtitle;

  DoaaModel({this.title, this.subtitle});

  DoaaModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    return data;
  }
}