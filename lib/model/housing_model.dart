class HousingModel {
  int errCode;
  String message;
  Data data;

  HousingModel({this.errCode, this.message, this.data});

  HousingModel.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errCode'] = this.errCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int count;
  List<Rows> rows;

  Data({this.count, this.rows});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      rows = new List<Rows>();
      json['rows'].forEach((v) {
        rows.add(new Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int id;
  String housingName;
  String masterImg;
  String area;
  String station;
  String price;
  String gardenName;

  Rows(
      {this.id,
        this.housingName,
        this.masterImg,
        this.area,
        this.station,
        this.price,
        this.gardenName});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    housingName = json['housingName'];
    masterImg = json['masterImg'];
    area = json['area'];
    station = json['station'];
    price = json['price'];
    gardenName = json['gardenName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['housingName'] = this.housingName;
    data['masterImg'] = this.masterImg;
    data['area'] = this.area;
    data['station'] = this.station;
    data['price'] = this.price;
    data['gardenName'] = this.gardenName;
    return data;
  }
}