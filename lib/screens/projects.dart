import 'package:acronyms/services/project_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Projects extends StatelessWidget {
  final ProjectService projectService = new ProjectService();

  @override
  Widget build(BuildContext context) {
    Stream projectStream = projectService.getProjects();

    return Scaffold(
      appBar: AppBar(
          title: Text('Projects')
      ),
      body: StreamBuilder(
          stream: projectStream,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Text('Loading...');
            }
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.documents[index])
            );
          }
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        elevation: 20.0,
        onPressed: sayHello,
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Text(
                  projectService.getProjectName(snapshot),
                  style: Theme.of(context).textTheme.headline
              )
            ),
            IconButton(
              icon: Icon(Icons.star),
              tooltip: 'Make your default project',
              onPressed: () {
                projectService.makeDefault(snapshot);
              },
            ),
            IconButton(
               icon: Icon(Icons.delete),
               tooltip: 'Delete Project',
              onPressed: () {
                 projectService.deleteProject(snapshot.reference.documentID);
              },
            ),
          ],
        )
    );
  }

  sayHello() {
    print("Hello sam");
    return AlertDialog(
      title: Text("Hello Sam")
    );
  }
}