import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project 2 - Home Inventory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Project 2 - Home Inventory'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _itemTextInput = TextEditingController();
  final TextEditingController _quantityTextInput = TextEditingController();

  Widget textInputWidget() {
    return SizedBox(
      //height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: _itemTextInput,
        style: TextStyle(fontSize: 22, color: Colors.black),
        decoration: InputDecoration(
          hintText: 'Item',
          hintStyle: TextStyle(fontSize: 22, color: Colors.black, fontStyle: FontStyle.italic),
        ),
      )
    );
  }

  Widget quantityInputWidget() {
    return SizedBox(
      //height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: _quantityTextInput,
          style: TextStyle(fontSize: 22, color: Colors.black),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Quantity',
            hintStyle: TextStyle(fontSize: 22, color: Colors.black, fontStyle: FontStyle.italic),
          ),
        )
    );
  }

  Widget addButtonWidget() {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () async {
          setState(() async {
            //await itemListDB.add({'item_name': _itemTextInput.text});
            _itemTextInput.clear();

            //await itemListDB.add({'item_quantity': _quantityTextInput.text});
            _quantityTextInput.clear();
          });
        },
        child: Text('Add Item'),
      ),
    );
  }

  /*
  Widget itemListWidget() {
    return Expanded(
      child: StreamBuilder(stream: itemListDB.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (BuildContext context, int position) {
              return Card(
              child: itemTileWidget(snapshot, position),
              );
            }
          );
        })
    );
  }
  */

  Widget itemTileWidget(snapshot, position) {
    return ListTile(
      leading: Icon(Icons.check_box),
      title: Text(snapshot.data.docs[position]['item name']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 40,),
            Text('Use this application to keep track of the items in your home'),
            SizedBox(height: 40,),
            textInputWidget(),
            SizedBox(height: 20,),
            quantityInputWidget(),
            SizedBox(height: 20,),
            addButtonWidget(),
            //itemListWidget(),
          ],
         ),
      ),
    );
  }
}
