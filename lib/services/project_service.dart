import 'package:acronyms/services/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectService {
   DataService _dataService = new DataService();

  getProjects() {
    return _dataService.getDataStreamSnapshot("projects");
  }

  getProjectName(DocumentSnapshot snapshot) {
    return snapshot["name"];
  }

   makeDefault(DocumentSnapshot snapshot) {
    print(snapshot.data["name"]);
    _dataService.getDataStream("defaultprojects")
        .where("projectName", isEqualTo: snapshot.data["name"]).limit(1).snapshots()
        .listen((QuerySnapshot s) {
          if (s.documents.length > 0) {
            DocumentSnapshot d = s.documents[0];
            d.data["projectName"] = snapshot.data["name"];
            print(d.reference.documentID);
            _dataService.updateData("defaultprojects", d.reference.documentID, d);//TODO fix this
          }
        }
     );
//    _dataService.updateData("defaultProjects", snapshot.documentID, snapshot.data);
    print("Hey I'm here");
  }

  addProject(project) {
    print("hello project");
  }

  deleteProject(String id) {
    _dataService.deleteData("projects", id);
  }

}