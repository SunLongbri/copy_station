const serviceUrl = 'http://192.168.1.133:8020/';
const smsUrl = 'http://192.168.1.133:8026/';
const registerUrl = 'http://192.168.1.133:8823/';

const servicePath = {
  'sms': smsUrl + 'sms/send_code', //发送手机号码

  'registerByTel': registerUrl + 'user/register_by_tel', //用户手机号+验证码 注册
  'resetByTel': registerUrl + '/user/reset_password_by_tel', //用户手机号+验证码 注册

  'mobileLogin': serviceUrl + 'mobile/login', //用户通过手机+验证码快速登录
  'login': serviceUrl + 'oauth/token', //用户通过手机+密码和邮箱加密码登录接口

  'resetPass': registerUrl + 'user/reset_password_by_tel', //手机号重置密码
};
