import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = '/';
  static String registerPage = '/register';
  static String codePage = '/code';
  static String mailPage = '/mail';
  static String homePage = '/home';
  static String cityPage = '/city';
  static String searchPage = '/search';
  static String personalCenter = '/personal';
  static String evaluatePage = '/evaluate';
  static String cartPage = '/cart';
  static String collectionPage = '/collection';
  static String invocePage = '/invoce';
  static String confirmInvocePage = '/confirmInvoce';
  static String showAddressPage = '/showAddress';
  static String addAddressPage = '/addAddress';
  static String invoceInfoPage = '/invoceInfo';
  static String invoceCommonPage = '/invoceInfoCommon';
  static String invoceSpecialPage = '/invoceInfoSpecial';
  static String invoceMarkPage = '/invoceInfoMark';
  static String orderMarkPage = '/orderMark';
  static String myApplicationPage = '/myApplication';
  static String bindEmailPage = '/bindEmail';
  static String setPassPage = '/setPass';
  static String efficacyPassPage = '/efficacyPass';
  static String setPayPassPage = '/setPayPass';
  static String resetPassPage = '/resetPass';
  static String settingPage = '/setting';
  static String aboutBDLSPage = '/aboutBDLS';
  static String myOrderPage = '/myOrder';
  static String webViewHelper = '/webView';
  static String webViewFlutter = '/webViewFlutter';

  static void configureRoutes(Router router) {
    //当没有找到对应的路由时
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR ==== > ROUTE WAS NOT FOUND!');
    });
    //配置路由
    router.define(registerPage, handler: registerHandler);
    router.define(codePage, handler: codeHandler);
    router.define(mailPage, handler: mailHandler);
    router.define(homePage, handler: homeHandler);
    router.define(cityPage, handler: cityHandler);
    router.define(searchPage, handler: searchHandler);
    router.define(personalCenter, handler: personalHandler);
    router.define(evaluatePage, handler: evaluateHandler);
    router.define(cartPage, handler: cartHandler);
    router.define(collectionPage, handler: collectionHandler);
    router.define(invocePage, handler: invoceHandler);
    router.define(confirmInvocePage, handler: confirmInvoceHandler);
    router.define(showAddressPage, handler: showAddressHandler);
    router.define(addAddressPage, handler: addAddressHandler);
    router.define(invoceInfoPage, handler: invoceInfoHandler);
    router.define(invoceCommonPage, handler: invoceCommonHandler);
    router.define(invoceSpecialPage, handler: invoceSpecialHandler);
    router.define(invoceMarkPage, handler: invoceMarkHandler);
    router.define(orderMarkPage, handler: orderMarkHandler);
    router.define(myApplicationPage, handler: myApplicationHandler);
    router.define(bindEmailPage, handler: bindEmailHandler);
    router.define(setPassPage, handler: setPassHandler);
    router.define(efficacyPassPage, handler: efficacyPassHandler);
    router.define(setPayPassPage, handler: setPayPassHandler);
    router.define(resetPassPage, handler: resetPassHandler);
    router.define(settingPage, handler: settingHandler);
    router.define(aboutBDLSPage, handler: aboutBDLSHandler);
    router.define(myOrderPage, handler: myOrderHandler);
    router.define(webViewHelper, handler: webViewHandler);
    router.define(webViewFlutter, handler: webViewFlutterHandler);
  }
}
