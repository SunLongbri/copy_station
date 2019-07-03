class AmapModel {
  String count;
  List<Geocodes> geocodes;
  String info;
  String infocode;
  String status;

  AmapModel(
      {this.count, this.geocodes, this.info, this.infocode, this.status});

  AmapModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['geocodes'] != null) {
      geocodes = new List<Geocodes>();
      json['geocodes'].forEach((v) {
        geocodes.add(new Geocodes.fromJson(v));
      });
    }
    info = json['info'];
    infocode = json['infocode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.geocodes != null) {
      data['geocodes'] = this.geocodes.map((v) => v.toJson()).toList();
    }
    data['info'] = this.info;
    data['infocode'] = this.infocode;
    data['status'] = this.status;
    return data;
  }
}

class Geocodes {
  String adcode;
  String city;
  String citycode;
  String country;
  String district;
  String formattedAddress;
  String level;
  String location;
  String province;

  Geocodes(
      {this.adcode,
        this.city,
        this.citycode,
        this.country,
        this.district,
        this.formattedAddress,
        this.level,
        this.location,
        this.province});

  Geocodes.fromJson(Map<String, dynamic> json) {
    adcode = json['adcode'];
    city = json['city'];
    citycode = json['citycode'];
    country = json['country'];
    district = json['district'];
    formattedAddress = json['formatted_address'];
    level = json['level'];
    location = json['location'];
    province = json['province'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adcode'] = this.adcode;
    data['city'] = this.city;
    data['citycode'] = this.citycode;
    data['country'] = this.country;
    data['district'] = this.district;
    data['formatted_address'] = this.formattedAddress;
    data['level'] = this.level;
    data['location'] = this.location;
    data['province'] = this.province;
    return data;
  }
}