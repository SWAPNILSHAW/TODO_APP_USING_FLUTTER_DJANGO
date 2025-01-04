import 'package:flutter/material.dart';
import 'package:frontend/Utils/methods.dart';
import '../Constants/colors.dart';

class TodoContainer extends StatelessWidget {
  final int id;
  final String title;
  final String desc;
  final bool isDone;
  final Function onPress;

   TodoContainer({
    super.key,
    required this.id,
    required this.title,
    required this.desc,
    required this.isDone,
    required this.onPress,
  });
final HelperFunction helperFunction =  HelperFunction();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: (){
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
                      'Update your Todo',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        //color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: title,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),

                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: desc,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                      ),

                    ),
                    ElevatedButton(
                      onPressed: () {
                        helperFunction.postData(title: title, desc: desc);
                        Navigator.pop(context);
                      },
                      child: const Text('Update'),
                    ),
                  ],
                ),
              ),
            );
          },

          );},
        child: Container(
          width: double.infinity,
          height: null,
          decoration: BoxDecoration(
            color: isDone == true ? green : red,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$id. '.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () => onPress(),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    desc,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
