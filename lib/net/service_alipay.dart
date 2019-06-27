import 'package:tobias/tobias.dart' as tobias;
//支付宝appId初始化
aliPay() async {
  var result = await tobias.isAliPayInstalled();
  print('支付宝客户端是否安装:${result}');
}

