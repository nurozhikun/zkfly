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
  final GlobalKey _formKey = GlobalKey<FormState>();
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
              // await widget.filter?.login(_nameCtrl.text, _pwdCtrl.text);
              widget.filter
                  ?.actionOf(ZkValueKey.keyLogin)
                  .onPressedCallback
                  ?.call(_nameCtrl.text, _pwdCtrl.text);
            },
          ),
        ),
      ),
    ];
  }
}
