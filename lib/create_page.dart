import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  final String? title;
  final String? subtitle;
  const CreatePage({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  createState() => _CreatePageState();
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
  void initState() {
    title = widget.title;
    subtitle = widget.subtitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: widget.title,
                onChanged: (value) {
                  title = value;
                },
                validator: (value) =>
                    value!.isEmpty ? "Title precisa ser preenchido" : null,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextFormField(
                initialValue: widget.subtitle,
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
                      child: const Text("Save"),
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
