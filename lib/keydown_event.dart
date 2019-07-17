class KeyDownEvent {
  ///  当前点击的按钮所代表的值
  String key;
  KeyDownEvent(this.key);

  bool isDelete() => this.key == "del";
  bool isCommit() => this.key == "commit";
}
