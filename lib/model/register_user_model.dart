import 'dart:convert' show json;

class RegisterUserModel {

  int age;
  int gender;
  String code;
  String email;
  String nikename;
  String password;
  String tel;
  String username;

  RegisterUserModel.fromParams({this.age, this.gender, this.code, this.email, this.nikename, this.password, this.tel, this.username});

  factory RegisterUserModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new RegisterUserModel.fromJson(json.decode(jsonStr)) : new RegisterUserModel.fromJson(jsonStr);

  RegisterUserModel.fromJson(jsonRes) {
    age = jsonRes['age'];
    gender = jsonRes['gender'];
    code = jsonRes['code'];
    email = jsonRes['email'];
    nikename = jsonRes['nikename'];
    password = jsonRes['password'];
    tel = jsonRes['tel'];
    username = jsonRes['username'];
  }

  @override
  String toString() {
    return '{"age": $age,"gender": $gender,"code": ${code != null?'${json.encode(code)}':'null'},"email": ${email != null?'${json.encode(email)}':'null'},"nikename": ${nikename != null?'${json.encode(nikename)}':'null'},"password": ${password != null?'${json.encode(password)}':'null'},"tel": ${tel != null?'${json.encode(tel)}':'null'},"username": ${username != null?'${json.encode(username)}':'null'}}';
  }
}

