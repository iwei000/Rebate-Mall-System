// +----------------------------------------------------------------------
// | ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2019 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://demo.thinkadmin.top
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | gitee 代码仓库：https://gitee.com/zoujingli/ThinkAdmin
// | github 代码仓库：https://github.com/zoujingli/ThinkAdmin
// +----------------------------------------------------------------------

$(function () {

    window.$body = $('body');

    /*! 后台加密登录处理 */
    $(function() {
      var $body = $('body');
  
      // 使用require.js加载md5模块，并处理表单提交
      require(["md5"], function (md5) {
          $body.find('[data-login-form]').each(function () {
              var $form = $(this);
  
              // 使用vali插件进行表单验证并提交
              $form.vali(function (data) {
                  // 对密码进行双重MD5加密，并添加唯一标识符
                  data['password'] = md5.hash(md5.hash(data['password']) + data['uniqid']);
  
                  // 异步提交表单数据
                  $.form.load(location.href, data, "post", function (ret) {
                      // 处理非成功返回，显示验证码组件并重新触发验证码生成
                      if (parseInt(ret.code) !== 1) {
                          $form.find('.verify.layui-hide').removeClass('layui-hide');
                          $form.find('[data-captcha]').trigger('click');
                      }
                  }, null, null, 'false');
              });
          });
      });
  });

    /*! 登录图形验证码刷新 */
    $(function() {
      var $body = $('body');
  
      // 更新验证码的函数
      function updateCaptcha($element, action) {
          var type = $element.attr('data-captcha-type') || 'captcha-type';
          var token = $element.attr('data-captcha-token') || 'captcha-token';
          var uniqidField = $element.attr('data-field-uniqid') || 'uniqid';
          var verifyField = $element.attr('data-field-verify') || 'verify';
  
          $.form.load(action, { type: type, token: token }, 'post', function(ret) {
              if (ret.code) {
                  var $img = $('<img alt="验证码图片">').attr('src', ret.data.image);
                  var $hiddenInput = $('<input type="hidden">').attr('name', uniqidField).val(ret.data.uniqid);
  
                  $element.empty().append($img, $hiddenInput);
  
                  // 如果后端返回了验证码，更新相应字段，否则清空
                  var verifyValue = ret.data.code || '';
                  $element.parents('form').find('[name=' + verifyField + ']').val(verifyValue);
                  return false;
              }
          }, false);
      }
  
      // 绑定点击事件，触发验证码更新
      $body.on('click', '[data-captcha]', function() {
          var $that = $(this);
          var action = this.getAttribute('data-captcha') || location.href;
          if (action.length < 5) {
              $.msg.tips('请设置验证码请求地址'); // 提示设置验证码请求地址
              return;
          }
          updateCaptcha($that, action);
      });
  
      // 触发所有带有 data-captcha 属性的元素的点击事件
      $('[data-captcha]').each(function() {
          $(this).trigger('click');
      });
  });

    $('[data-captcha]').map(function () {
        $(this).trigger('click')
    });

});