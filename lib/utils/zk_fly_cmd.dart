class ZkCmd {
  final int cmd;
  final String? str;
  final String? path;
  const ZkCmd(this.cmd, {this.str, this.path});

  @override
  bool operator ==(Object other) {
    if (other is ZkCmd) {
      return other.cmd == cmd;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => cmd;

  @override
  String toString() => str ?? path ?? cmd.toString();
}
