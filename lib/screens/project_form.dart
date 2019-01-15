import 'package:flutter/material.dart';

class ProjectForm extends StatefulWidget {
  @override
  ProjectFormState createState() {
    return ProjectFormState();
  }

}

class ProjectFormState extends State<ProjectForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new TextFormField(
        maxLength: 50,
        decoration: new InputDecoration(
            labelText: "Name",
            helperText: "Enter the name of your project"
        ),
      )
    );
  }

}