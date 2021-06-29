import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final formKey = GlobalKey<FormState>();
  dynamic title;
  dynamic subtitle;
  void validate() {
    final form = formKey.currentState;
    if (form!.validate()) {
      print("title $title \n subtitle $subtitle");
      final map = Map<String, dynamic>();
      map.addAll({"title": title, "subtitle": subtitle});
      Navigator.pop(context, map);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value) {
                  title = value;
                },
                validator: (value) =>
                    value!.isEmpty ? "Title precisa ser preenchido" : null,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextFormField(
                onChanged: (value) {
                  subtitle = value;
                },
                validator: (value) =>
                    value!.isEmpty ? "Subtitle precisa ser preenchido" : null,
                decoration: const InputDecoration(labelText: "Subtitle"),
              ),
              const SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        validate();
                      },
                      child: const Text("Salvar"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
