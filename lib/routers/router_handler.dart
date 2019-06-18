import 'package:copy_station/helper/web_view_flutter.dart';
import 'package:copy_station/helper/web_view_helper.dart';
import 'package:copy_station/homepages/city_page/select_city_page.dart';
import 'package:copy_station/homepages/drawer/my_order_page.dart';
import 'package:copy_station/homepages/drawer/personal_center.dart';
import 'package:copy_station/homepages/drawer/personal_center/about_bdls_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/bind_email_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/cart_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/collection_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/efficacy_pass_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/evaluate_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/invoce_page/add_address_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/invoce_page/invoce_common_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/invoce_page/invoce_info_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/invoce_page/invoce_mark_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/invoce_page/invoce_special_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/invoce_page/order_mark_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/invoce_page/show_address_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/invoce_page/confirm_invoce_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/invoice_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/my_application_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/reset_pass_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/set_pass_page.dart';
import 'package:copy_station/homepages/drawer/personal_center/set_pay_pass.dart';
import 'package:copy_station/homepages/drawer/personal_center/setting_page.dart';
import 'package:copy_station/homepages/search_page/search_work_page.dart';
import 'package:copy_station/registerpages/code_page.dart';
import 'package:copy_station/registerpages/mail_page.dart';
import 'package:copy_station/registerpages/register_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:copy_station/homepages/home_page.dart';

Handler registerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('registerHandler ---> params:${params}');
  return RegisterPage();
});

Handler codeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('codeHandler ---> params:${params}');
  return CodePage();
});

Handler mailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('mailHandler ---> params:${params}');
  return MailPage();
});

Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('homeHandler ---> params:${params}');
  return HomePage();
});

Handler cityHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String cityName = params['name'].first;
  print('cityHandler ---> params:${params}');
  return SelectCityPage(cityName);
});

Handler searchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('searchHandler ---> params:${params}');
  return SearchWorkPage();
});

Handler personalHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('personalHandler ---> params:${params}');
  return PersonalCenter();
});

Handler evaluateHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('evaluateHandler ---> params:${params}');
  return EvaluatePage();
});

Handler cartHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('cartHandler ---> params:${params}');
  return CartPage();
});

Handler collectionHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('collectionHandler ---> params:${params}');
  return CollectionPage();
});

Handler invoceHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('invoceHandler ---> params:${params}');
  return InvocePage();
});

Handler confirmInvoceHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('confirmInvoceHandler ---> params:${params}');
  return ConfirmInvocePage();
});

Handler showAddressHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('showAddressHandler ---> params:${params}');
  return ShowAddressPage();
});
Handler addAddressHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('addAddressHandler ---> params:${params}');
  return AddAddressPage();
});
Handler invoceInfoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('invoceInfoHandler ---> params:${params}');
  return InvoceInfoPage();
});
Handler invoceCommonHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('invoceCommonHandler ---> params:${params}');
  return InvoceCommonPage();
});
Handler invoceSpecialHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('invoceSpecialHandler ---> params:${params}');
  return InvoceSpecialPage();
});
Handler invoceMarkHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('invoceMarkHandler ---> params:${params}');
  return InvoceMarkPage();
});
Handler orderMarkHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('orderMarkHandler ---> params:${params}');
  return OrderMarkPage();
});
Handler myApplicationHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('myApplicationHandler ---> params:${params}');
  return MyApplicationPage();
});
Handler bindEmailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('bindEmailHandler ---> params:${params}');
  return BindEmailPage();
});
Handler setPassHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('setPassHandler ---> params:${params}');
  return SetPassPage();
});
Handler efficacyPassHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('efficacyPassHandler ---> params:${params}');
  return EfficacyPassPage();
});
Handler setPayPassHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('setPayPassHandler ---> params:${params}');
  return SetPayPassPage();
});
Handler resetPassHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title'].first;
  print('resetPassHandler ---> params:${params}');
  return ResetPassPage(title);
});
Handler settingHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('settingHandler ---> params:${params}');
  return SettingPage();
});
Handler aboutBDLSHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('aboutBDLSHandler ---> params:${params}');
  return AboutBDLSPage();
});
Handler myOrderHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  print('myOrderHandler ---> params:${params}');
  return MyOrderPage();
});

Handler webViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String webUrl = params['weburl'].first;
  print('webViewHandler ---> params:${params}');
  return WebViewHelper(webUrl);
});

Handler webViewFlutterHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String webUrl = params['weburl'].first;
  print('webViewFlutterHandler ---> params:${params}');
  return WebViewFlutter(webUrl);
});
