import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> task = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  List<bool> isSelected = List.filled(5, false); // List to track selection
  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (isSelected[index]) {
                      selectedCount--;
                    } else {
                      selectedCount++;
                    }
                    isSelected[index] = !isSelected[index];

                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected[index] ? Colors.blue : Colors.white,
                    ),
                    height: 50,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(task[index],style: TextStyle(fontSize: 18),),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 4,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Selected Item'),
                content: Text('Number Of Select Item : $selectedCount'),
                actions: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Close',style: TextStyle(color: Colors.blue),),
                      ))
                ],

              );
            },
          );
        },
        child: Icon(Icons.check), // Right arrow icon
      ),
    );
  }
}
