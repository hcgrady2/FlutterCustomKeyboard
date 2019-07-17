
import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/keydown_event.dart';
import 'package:flutter_custom_keyboard/keyboard_item.dart';

/// 自定义密码 键盘
class CustomKeyboard extends StatefulWidget {
  final callback;

  CustomKeyboard(this.callback);

  @override
  State<StatefulWidget> createState() {
    return new MyKeyboardStat();
  }
}

class MyKeyboardStat extends State<CustomKeyboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void onOkKeyDown() {
    widget.callback(new KeyDownEvent("ok"));
  }

  void onOneKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("1"));
  }

  void onTwoKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("2"));
  }

  void onThreeKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("3"));
  }

  void onFourKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("4"));
  }

  void onFiveKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("5"));
  }

  void onSixKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("6"));
  }

  void onSevenKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("7"));
  }

  void onEightKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("8"));
  }

  void onNineKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("9"));
  }

  void onZeroKeyDown(BuildContext cont) {
    widget.callback(new KeyDownEvent("0"));
  }

  /// 点击删除
  void onDeleteKeyDown() {
    widget.callback(new KeyDownEvent("del"));
  }

  void onCloseKeyDown(){
    widget.callback(new KeyDownEvent("close"));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      key: _scaffoldKey,
      width: double.infinity,
      height: 230.0,                ///所有控件加起来的高度
      color: Colors.white,
      child: new Column(
        children: <Widget>[

          InkWell(
            child:  new Container(
              height:30.0,
              color: Colors.white,
              alignment: Alignment.center,
              child: new Text(
                '关闭',
                style: new TextStyle(fontSize: 12.0, color: Color(0xff999999)),
              ),
            ),
            onTap: (){
              onCloseKeyDown();
            },
          ),



          ///  键盘主体
          new Column(
            children: <Widget>[
              ///  第一行
              new Row(
                children: <Widget>[
                  KeybaordItem(
                      text: '1', callback: (val) => onOneKeyDown(context)),
                  KeybaordItem(
                      text: '2', callback: (val) => onTwoKeyDown(context)),
                  KeybaordItem(
                      text: '3', callback: (val) => onThreeKeyDown(context)),
                ],
              ),

              ///  第二行
              new Row(
                children: <Widget>[
                  KeybaordItem(
                      text: '4', callback: (val) => onFourKeyDown(context)),
                  KeybaordItem(
                      text: '5', callback: (val) => onFiveKeyDown(context)),
                  KeybaordItem(
                      text: '6', callback: (val) => onSixKeyDown(context)),
                ],
              ),

              ///  第三行
              new Row(
                children: <Widget>[
                  KeybaordItem(
                      text: '7', callback: (val) => onSevenKeyDown(context)),
                  KeybaordItem(
                      text: '8', callback: (val) => onEightKeyDown(context)),
                  KeybaordItem(
                      text: '9', callback: (val) => onNineKeyDown(context)),
                ],
              ),

              ///  第四行
              new Row(
                children: <Widget>[
                  KeybaordItem(text: '删除', callback: (val) => onDeleteKeyDown()),
                  KeybaordItem(
                      text: '0', callback: (val) => onZeroKeyDown(context)),
                  KeybaordItem(text: '确定', callback: (val) => onOkKeyDown()),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

