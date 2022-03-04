class AzkarModel {
  String? zkr;
  String? num;
  String? subtitile;

  AzkarModel({this.zkr, this.num, this.subtitile});

  AzkarModel.fromJson(Map<String, dynamic> json) {
    zkr = json['zkr'];
    num = json['num'];
    subtitile = json['subtitile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zkr'] = this.zkr;
    data['num'] = this.num;
    data['subtitile'] = this.subtitile;
    return data;
  }
}