import 'package:flutter/material.dart';
import 'package:zkfly/app/index.dart';

class ZkLoginView extends StatefulWidget {
  const ZkLoginView({Key? key, this.filter, this.autofocus = true})
      : super(key: key);
  final ZkFilter? filter;
  final bool autofocus;

  @override
  _ZkLoginViewState createState() => _ZkLoginViewState();
}

class _ZkLoginViewState extends State<ZkLoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPwd = false;
  final _nameCtrl = TextEditingController();
  final _pwdCtrl = TextEditingController();
  @override
  void dispose() {
    _nameCtrl.dispose();
    _pwdCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        // 封装children 避免嵌套过多
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return <Widget>[
      TextFormField(
        validator: validateUserName,
        enabled: widget.key == ZkValueKey.keyLogin,
        // 自动获取焦点
        autofocus: widget.autofocus,
        controller: _nameCtrl,
        decoration: InputDecoration(
          // 标签
          labelText:
              widget.filter?.labelTextOf(ZkValueKey.keyUsername) ?? "UserName",
          // 提示
          hintText:
              widget.filter?.hintTextOf(ZkValueKey.keyUsername) ?? "username",
          // 前缀图标
          prefixIcon: widget.filter?.prefixIconOf(ZkValueKey.keyUsername) ??
              const Icon(Icons.person),
        ),
      ),
      TextFormField(
        validator: validatePassWord,
        autofocus: false,
        controller: _pwdCtrl,
        decoration: InputDecoration(
          labelText:
              widget.filter?.labelTextOf(ZkValueKey.keyPassword) ?? "Password",
          hintText:
              widget.filter?.hintTextOf(ZkValueKey.keyPassword) ?? "password",
          prefixIcon: widget.filter?.prefixIconOf(ZkValueKey.keyPassword) ??
              const Icon(Icons.lock),
          // 后缀图标
          suffixIcon: IconButton(
            // 根据_showPwd属性设置图标的样式(可见/不可见)
            icon: Icon(_showPwd ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              //调用 setState能更新ui
              setState(() {
                _showPwd = !_showPwd;
              });
            },
          ),
        ),
        // 是否隐藏文本
        obscureText: !_showPwd,
      ),
      Padding(
        // 设置仅顶部填充
        padding: const EdgeInsets.only(top: 20.0),
        // 尺寸限制容器
        child: ConstrainedBox(
          // 设置限制条件(限制高度 宽度尽可能延申)
          constraints: const BoxConstraints.expand(height: 55.0),
          // 漂浮按钮
          // ignore: deprecated_member_use
          child: RaisedButton(
            //和主题色一致
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text(
                widget.filter?.labelTextOf(ZkValueKey.keyLogin) ?? "login"),
            //回调函数
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                widget.filter
                    ?.actionOf(ZkValueKey.keyLogin)
                    .onPressedCallback
                    ?.call(_nameCtrl.text, _pwdCtrl.text);
              }

              // ImsBeeAction
            },
          ),
        ),
      ),
    ];
  }
}

String? validateUserName(value) {
  RegExp exp = RegExp(r'^[\u4e00-\u9fa5 A-Z a-z 0-9 _]{3,8}$');
  if (value.isEmpty) {
    return '用户名不能为空!';
  } else if (!exp.hasMatch(value.trim())) {
    return '请输入3到8位中文、数字、字母、下划线';
  }
  return null;
}

// 密码
String? validatePassWord(value) {
  if (value.isEmpty) {
    return '密码不能为空';
  } else if (value.trim().length < 6 || value.trim().length > 18) {
    return '密码长度需大于等于6位';
  }
  return null;
}
