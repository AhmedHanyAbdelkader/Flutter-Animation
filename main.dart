import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedControllerPage(),
    );
  }
}

class AnimatedControllerPage extends StatefulWidget {
  static String id ="AnimatedControllerPage";
  @override
  State<AnimatedControllerPage> createState() => _AnimatedControllerPageState();
}

class _AnimatedControllerPageState extends State<AnimatedControllerPage> with SingleTickerProviderStateMixin{
  AnimationController? _controller;
  Animation? _animation;
  @override
  void initState() {
    _controller = AnimationController(vsync: this , duration:const Duration(seconds: 2),);
    _animation = Tween(begin: 50.0 , end: 500)
        .animate(_controller!)
      ..addStatusListener((status) { print(status); })
      ..addListener((){
        setState(() {});
        print("value${_animation?.value}"); });
    _controller!.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Animation Controller'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ShapeRotation(_animation,),
          ShapeRotation(_animation),
        ],
      ),
    );
  }
}

class ShapeRotation extends StatelessWidget {
  var _animation;
  ShapeRotation(_animation){
    this._animation=_animation;}
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Container(
          margin:const EdgeInsets.only(top: 50.0),
          child: Transform.rotate(
            angle: -3.14/2 * _animation!.value,
            child: Container(color: Colors.blue,height: 100,width: 100,),
          ),
        ),
      ),

    );
  }
}
