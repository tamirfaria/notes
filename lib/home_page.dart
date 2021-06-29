import 'package:flutter/material.dart';
import 'create_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final notes = <Map<String, dynamic>>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes | Raro Academy"),
        leading: const Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            notes.length,
            (index) => Card(
              child: ListTile(
                leading: const Icon(
                  Icons.book,
                  color: Colors.pink,
                ),
                title: Text(notes[index]['title']),
                subtitle: Text(notes[index]['subtitle']),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePage(),
            ),
          ).then((value) => notes.add(value));
          setState(() {});
        },
        icon: const Icon(Icons.add),
        label: const Text("Criar"),
      ),
    );
  }
}
