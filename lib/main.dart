import 'package:button/my_floatingbutton.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:Scaffold(
//         appBar:AppBar(
//           title: Text('Button'),
//         ),
//         body:Center(
//           child:Text('Hello') ,
//           ),
//         floatingActionButton:FloatingActionButton(
//           child:Icon(Icons.call),
//           onPressed:() => print('Floating'),
//           // backgroundColor: Colors.greenAccent,
//           // foregroundColor:Colors.blue,
//           // shape:RoundedRectangleBorder(
//           //   borderRadius:BorderRadius.all(Radius.circular(10)),
//           //   side:BorderSide(color:Colors.blue,width:3)
//           // ),
//           // mini:false,
//           elevation:20,
//           shape: MyFloatingButton(),),
//         // floatingActionButton: FloatingActionButton.extended(
//         //   onPressed: ()=> print(' clicked'),
//         //   icon: Icon(Icons.save),
//         //   label: Text('save'),
//         //   backgroundColor: Colors.yellow,
//         //   foregroundColor: Colors.blue,
//         // ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//         )
//       );
//   }
// }
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String>courses=['dart','flutter','android','ios'];
  String selectedCourse='ios';

  var list=List<PopupMenuEntry<dynamic>>();

  @override
  void initState(){
    list.add(PopupMenuItem(
      value:'dart',
      child: Text('dart'),
    ));
    list.add(PopupMenuItem(
      value:'flutter',
      child: Text('flutter'),
    ));
    list.add(PopupMenuDivider(
      height: 100,
    ));
    list.add(PopupMenuItem(
      value:'android',
      child: Text('android'),
    ));
    list.add(PopupMenuItem(
      value:'ios',
      child: Text('ios'),
    ));
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title:Text('Dropdown'),
          actions: [
            PopupMenuButton(
              itemBuilder: (context){
                return list.toList();
                // return courses.map((course){
                //   return PopupMenuItem(
                //     value: course,
                //     child: Text(course),
                //   );
                // }).toList();
              },
              onCanceled: () => print('No thing selected'),
              onSelected: (item){
                setState(() {
                  selectedCourse=item;
                });
              },
              // icon: Icon(
              //   Icons.settings,
              //   color: Colors.red,
              // ),
              padding: EdgeInsets.only(right: 15),
              )
          ],
        ),
        body: Center(
          child:Column(
            children: [
              Text('selected $selectedCourse'),
              SizedBox(
                height: 50,
              ),
              ButtonBar(
                alignment:MainAxisAlignment.center ,
                children: [
                  RaisedButton(
                    child:Text('Button 1'),
                    onPressed: (){},
                  ),
                  FlatButton(
                    child: Text('Button 2'),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(Icons.save),
                    onPressed: (){},
                  )
            ],),
            SizedBox(
              height: 50,
            ),
            DropdownButton(
              items: courses.map((course){
                return DropdownMenuItem(value: course,child:Text(course));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCourse=value;
                });
              },
              value: selectedCourse,
              icon:Icon(Icons.arrow_drop_down_circle),
              iconEnabledColor: Colors.blue,
              iconDisabledColor: Colors.grey,
            )
            ],) ,
            ),
        ),      
    );
  }
}