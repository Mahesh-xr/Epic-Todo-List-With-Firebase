import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future addTodayTask( Map<String, dynamic> userTask, String id) async{

    return await FirebaseFirestore.instance.collection("Today").doc(id).set(userTask);

  }

  Future addTomorrowTask( Map<String, dynamic> userTask, String id) async{

    return await FirebaseFirestore.instance.collection("Tomorrow").doc(id).set(userTask);

  }
  Future addNextWeekTask( Map<String, dynamic> userTask, String id) async{

    return await FirebaseFirestore.instance.collection("NextWeek").doc(id).set(userTask);

  }
  Future<Stream<QuerySnapshot>>getAllTasks (String day) async{
    return await FirebaseFirestore.instance.collection(day).snapshots();

  }
}