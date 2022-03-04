class KsasAnbiaaModel {
  String? nabi;
  String? part1;
  String? part2;
  String? part3;
  String? part4;

  KsasAnbiaaModel({this.nabi, this.part1, this.part2, this.part3, this.part4});

  KsasAnbiaaModel.fromJson(Map<String, dynamic> json) {
    nabi = json['nabi'];
    part1 = json['part1'];
    part2 = json['part2'];
    part3 = json['part3'];
    part4 = json['part4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nabi'] = this.nabi;
    data['part1'] = this.part1;
    data['part2'] = this.part2;
    data['part3'] = this.part3;
    data['part4'] = this.part4;
    return data;
  }
}