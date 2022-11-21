import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dentaku',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textControllerA = TextEditingController();
  final _textControllerB = TextEditingController();

 double a = 0;
 double b = 0;
 double c = 0;

  @override
  void initState(){
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
        onTap: () {
      FocusScope.of(context).unfocus();
    },
      child: Scaffold(
      appBar: AppBar(title: Text('Calculator'),),
      body: Column(
         children:[
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 70,
                height: 50,
                child: TextField(
                  autofocus: true,
                  controller: _textControllerA,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'A',
                  ),
                  onChanged: (text){
                    setState(() {
                      a = double.tryParse(text) ?? 0;
                    });
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 70,
                  height: 50,
                  child: TextField(
                    autofocus: true,
                    controller: _textControllerB,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'B',
                    ),
                    onChanged:(text) {
                      setState(() {
                        b = double.tryParse(text) ?? 0;
                      });
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.center,
                  width: 70,
                  height: 50,
                  child: Text('結果 = $c'),

              ),
            ],
            ),
           Padding(padding: EdgeInsets.only(top: 30)),

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               ElevatedButton(
                   onPressed: () {
                     setState(() {
                       c = a + b;
                       print('$c');
                     });
                   },
                   child: Text('+'),
               ),
               ElevatedButton(
                   onPressed: () {
                     setState(() {
                       c = a - b;
                       print('$c');
                     });
                   },
                   child: Text('-'),
               ),
               ElevatedButton(
                   onPressed: () {
                     setState(() {
                       c = a * b;
                       print('$c');
                     });
                   },
                   child: Text('×'),
               ),
               ElevatedButton(
                   onPressed: () {
                     setState(() {
                       c = a / b;
                       print('$c');
                     });
                   },
                   child: Text('÷'),
               ),
             ],
           )
      ]
      ),
      ),
    );
  }
  }


