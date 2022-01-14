import 'package:flutter/material.dart';
import 'package:zkfly/app/index.dart';

class ZkServerForm extends StatefulWidget {
  const ZkServerForm({Key? key, this.filter, this.autofocus = true})
      : super(key: key);
  final ZkFilter? filter;
  final bool autofocus;

  @override
  _ZkServerFormState createState() => _ZkServerFormState();
}

class _ZkServerFormState extends State<ZkServerForm> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final _ipCtrl = TextEditingController();
  final _portCtrl = TextEditingController();
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
        controller: _ipCtrl,
        decoration: InputDecoration(
          labelText: widget.filter?.labelTextOf(ZkValueKey.keyUsername) ?? "Ip",
          hintText: widget.filter?.hintTextOf(ZkValueKey.keyUsername) ?? "ip",
        ),
      ),
      TextFormField(
        autofocus: false,
        controller: _portCtrl,
        decoration: InputDecoration(
          labelText:
              widget.filter?.labelTextOf(ZkValueKey.keyPassword) ?? "Port",
          hintText: widget.filter?.hintTextOf(ZkValueKey.keyPassword) ?? "port",
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            elevatedButton(
                widget.filter?.labelTextOf(ZkValueKey.keyTest) ?? 'btn',
                true
                    ? () => widget.filter?.onPressed(
                        widget.key == ZkValueKey.keyMainServer
                            ? ZkValueKey.keyMainServerTest
                            : ZkValueKey.keyAreaServerTest)
                    : null),
            elevatedButton(
                widget.filter?.labelTextOf(ZkValueKey.keySave) ?? 'btn',
                true
                    ? () => widget.filter?.onPressed(
                        widget.key == ZkValueKey.keyMainServer
                            ? ZkValueKey.keyMainServerSave
                            : ZkValueKey.keyAreaServerSave)
                    : null),
          ],
        ),
      ),
    ];
  }
}

// await widget.filter?.login(_nameCtrl.text, _pwdCtrl.text);
ElevatedButton elevatedButton(String title, _onPress) {
  return ElevatedButton(
    onPressed: _onPress,
    child: Text(
      title,
      style: const TextStyle(fontSize: 12),
    ),
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(60, 32)),
    ),
  );
}
