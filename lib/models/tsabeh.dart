class TsabehModel {
  String? tasbyh;
  String? num;
  String? subtitile;

  TsabehModel({this.tasbyh, this.num, this.subtitile});

  TsabehModel.fromJson(Map<String, dynamic> json) {
    tasbyh = json['tasbyh'];
    num = json['num'];
    subtitile = json['subtitile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tasbyh'] = this.tasbyh;
    data['num'] = this.num;
    data['subtitile'] = this.subtitile;
    return data;
  }
}