//解析使用用户名和密码登录返回的json
class PassLoginModel {
  String accessToken;
  int age;
  int delFlag;
  String error;
  String errorDescription;
  int expiresIn;
  int gender;
  int id;
  String refreshToken;
  String scope;
  int status;
  String tokenType;
  String username;

  PassLoginModel(
      {this.accessToken,
      this.age,
      this.delFlag,
      this.error,
      this.errorDescription,
      this.expiresIn,
      this.gender,
      this.id,
      this.refreshToken,
      this.scope,
      this.status,
      this.tokenType,
      this.username});

  PassLoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'] ?? '';
    age = json['age'] ?? 0;
    delFlag = json['del_flag'] ?? 0;
    error = json['error'] ?? '';
    errorDescription = json['error_description'] ?? '';
    expiresIn = json['expires_in'] ?? 0;
    gender = json['gender'] ?? 0;
    id = json['id'] ?? 0;
    refreshToken = json['refresh_token'] ?? '';
    scope = json['scope'] ?? '';
    status = json['status'] ?? 0;
    tokenType = json['token_type'] ?? '';
    username = json['username'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['age'] = this.age;
    data['del_flag'] = this.delFlag;
    data['error'] = this.error;
    data['error_description'] = this.errorDescription;
    data['expires_in'] = this.expiresIn;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['refresh_token'] = this.refreshToken;
    data['scope'] = this.scope;
    data['status'] = this.status;
    data['token_type'] = this.tokenType;
    data['username'] = this.username;
    return data;
  }
}
