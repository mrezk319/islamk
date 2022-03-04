class AhadesModel {
  String? hokm;
  String? hades1;
  String? hades2;
  String? hades3;
  String? hades4;

  AhadesModel({this.hokm, this.hades1, this.hades2, this.hades3, this.hades4});

  AhadesModel.fromJson(Map<String, dynamic> json) {
    hokm = json['hokm'];
    hades1 = json['hades1'];
    hades2 = json['hades2'];
    hades3 = json['hades3'];
    hades4 = json['hades4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hokm'] = this.hokm;
    data['hades1'] = this.hades1;
    data['hades2'] = this.hades2;
    data['hades3'] = this.hades3;
    data['hades4'] = this.hades4;
    return data;
  }
}