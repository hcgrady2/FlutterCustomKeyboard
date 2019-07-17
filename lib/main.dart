import 'package:flutter/material.dart';
import 'package:flutter_custom_keyboard/customTextField/my_editable_text.dart';
import 'package:flutter_custom_keyboard/customTextField/my_text_field.dart';
import 'package:flutter_custom_keyboard/custom_keyboard.dart';
import 'package:flutter_custom_keyboard/keydown_event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String showText = "";

  bool showKeyboard = false;

  MyTextEditingController controller = new MyTextEditingController();

  void _onItemTapped(int index){

  }

  /// 密码键盘的整体回调，根据不同的按钮事件来进行相应的逻辑实现
  void _onKeyDown(KeyDownEvent data){
    debugPrint("keyEvent:" + data.key);
    if(data.key == "close"){
      showKeyboard = false;
    }

    else if(data.isDelete()){
      controller.text = "";
    }
    else {
      controller.text += data.key;
    }

    setState(() {
      showText = data.key;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Column(
        children: <Widget>[
          Text("$showText"),

   /*       RaisedButton(
            child: Text("隐藏/显示"),
            onPressed: (){
                setState(() {
                  showKeyboard = !showKeyboard;
                });
            },
          ),

          */

          TextField(
          ),

          MyTextField(
            controller: controller,
            onTap: (){
              setState(() {
                showKeyboard = true;
              });
            },
          ),


        ],
      ),

        bottomNavigationBar:
        showKeyboard?
            CustomKeyboard(_onKeyDown):
        new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(title: Text("Home"),icon: Icon(Icons.message)),
              BottomNavigationBarItem(title: Text("My"),icon: Icon(Icons.person_outline)),
            ]
        ),

    );
  }
}
