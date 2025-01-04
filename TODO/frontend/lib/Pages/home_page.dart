import 'package:flutter/material.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/todo_container.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import '../Models/todo.dart';
import 'package:frontend/Utils/methods.dart';

// HelperFunction helperFunction = HelperFunction();
final HelperFunction helperFunction = HelperFunction();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int done = 0;
  List<Todo> myTodos = [];
  bool isLoading = true;

  void _showModel() {
    String title = '';
    String desc = '';
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          // color: Colors.white,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Add your Todo',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    // color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      title:
                      value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      desc:
                      value;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Call the postData function here with the current title and desc
                    helperFunction.postData(title: title, desc: desc);
                    Navigator.pop(context); // Close the modal after submission
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    helperFunction.fetchData().then((value) {
      setState(() {
        myTodos = value;
        isLoading = false;
      });
      print(value.length);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: customAppbar(),
      body: FutureBuilder(
          future: helperFunction.fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            Widget widget = const Text('');
            if (snapshot.hasData) {
              widget = SingleChildScrollView(
                child: Column(
                  children: [
                    PieChart(dataMap: {
                      'Done': done.toDouble(),
                      'Incomplete': (myTodos.length - done).toDouble()
                    }),
                    isLoading
                        ? const CircularProgressIndicator()
                        : Column(
                            children: snapshot.data.map<Widget>((e) {
                              return TodoContainer(
                                onPress: () => helperFunction.delete_todo(e.id.toString()),
                                id: e.id,
                                title: e.title.toString(),
                                desc: e.desc.toString(),
                                isDone: e.isDone,
                              );
                            }).toList(),
                          ),
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              widget = const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              widget = const Center(
                child: Text('Something went wrong'),
              );
            }
            return widget;
          }),

      /*SingleChildScrollView(
        child: Column(
          children: [
            PieChart(dataMap: {
              'Done': done.toDouble(),
              'Incomplete': (myTodos.length - done).toDouble()
            }),
            isLoading
                ? const CircularProgressIndicator()
                : Column(
                    children: myTodos.map((e) {
                      return TodoContainer(
                        onPress: (){} /*=> delete_todo(e.id.toString())*/,
                        id: e.id,
                        title: e.title,
                        desc: e.desc,
                        isDone: e.isDone,
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModel();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
