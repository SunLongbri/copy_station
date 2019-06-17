import 'package:fluwx/fluwx.dart' as fluwx;

class WechatHelper {
  _initFluwx() async {

  }

  //微信分享网页
  _wechatShareWeb() async {
    await fluwx.register(appId: "wx8eaa46b891bb15c5");
    var model = fluwx.WeChatShareWebPageModel(
        webPage: 'https://www.baidu.com',
        title: '这个是微信分享网页的title',
        thumbnail: 'images/home_icon.png',
        scene: fluwx.WeChatScene.TIMELINE,
        transaction: "hh");
    fluwx.share(model);
  }
}
