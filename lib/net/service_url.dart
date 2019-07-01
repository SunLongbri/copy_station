const serviceUrl = 'http://192.168.1.129:3100';

const servicePath = {
  'sms': serviceUrl + '/api/user/register/authcode', //发送手机号码

  'registerByTel': serviceUrl + '/api/user/register', //用户手机号+验证码 注册
  'getSalt': serviceUrl + '/api/user/get/salt', //获取盐值

  'mobileLogin': serviceUrl + '/api/user/authcode/login', //用户通过手机+验证码快速登录
  'login': serviceUrl + '/api/user/login', //用户通过手机+密码和邮箱加密码登录接口

  'resetPass': serviceUrl + '/api/user/modify/password', //手机号重置密码
};
