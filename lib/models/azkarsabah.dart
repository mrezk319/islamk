class AzkarSbahModel {
  String? zekr;
  int? repeat;
  String? bless;

  AzkarSbahModel({this.zekr, this.repeat, this.bless});

  AzkarSbahModel.fromJson(Map<String, dynamic> json) {
    zekr = json['zekr'];
    repeat = json['repeat'];
    bless = json['bless'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zekr'] = this.zekr;
    data['repeat'] = this.repeat;
    data['bless'] = this.bless;
    return data;
  }
}