class AddressModel {
  //所在地区
  String address;

  //详细地址
  String detailAddress;

  //收件人姓名
  String destName;

  //手机号码
  String phone;

  //邮政编码
  String postalCode;

  //是否为默认地址 true：是默认地址
  bool defaultType;

  AddressModel({
    this.address,
    this.detailAddress,
    this.destName,
    this.phone,
    this.postalCode,
    this.defaultType,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    detailAddress = json['detailAddress'];
    destName = json['destName'];
    phone = json['phone'];
    postalCode = json['postalCode'];
    defaultType = json['defaultType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['detailAddress'] = this.detailAddress;
    data['destName'] = this.destName;
    data['phone'] = this.phone;
    data['postalCode'] = this.postalCode;
    data['defaultType'] = this.defaultType;
    return data;
  }
}
