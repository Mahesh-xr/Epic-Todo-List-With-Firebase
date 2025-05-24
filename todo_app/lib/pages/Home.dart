import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:random_string/random_string.dart";
import "package:todo_app/services/db.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool today = true, tomorrow = false, nextweek = false, suggest = false;
  Stream? todoStream;
  getontheLoad()async{

    DatabaseMethods databaseMethods = DatabaseMethods();

    todoStream = await databaseMethods.getAllTasks(today?"Today":tomorrow?"Tomorrow":"NextWeek");
    setState(() {
      
    });
  }
  @override
  initState(){
    getontheLoad();
    super.initState();
  }
  Widget allWork(){
    return StreamBuilder(stream: todoStream, builder: (context, AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(padding: EdgeInsets.zero, itemCount: snapshot.data.docs.length, itemBuilder: (context, index){
        DocumentSnapshot ds = snapshot.data.docs[index];
        return CheckboxListTile(
              value: suggest,
              onChanged: (newValue) {
                setState(() {
                  suggest = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Color(0xFF279cfb),
              title: Text(
                ds["work"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
      }): CircularProgressIndicator();
    });
  }
  
  TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBox(context);
        },
        child: Icon(Icons.add, color: Color(0xFF249fff), size: 30.0),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF232FDA2), Color(0xFF13D8CA), Color(0xFF09adfe)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello\nMahesh",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Good Morning",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,

                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                today
                    ? Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF3dffe3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Today",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                    : GestureDetector(
                      onTap: () async{
                        today = true;
                        tomorrow = false;
                        nextweek = false;
                        setState(() {});
                                                await getontheLoad();

                      },

                      child: Text(
                        "Today",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                tomorrow
                    ? Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF3dffe3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Tomorrow",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                    : GestureDetector(
                      onTap: () async {
                        today = false;
                        tomorrow = true;
                        nextweek = false;
                        setState(() {});
                        await getontheLoad();
                      },

                      child: Text(
                        "Tomorrow",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                nextweek
                    ? Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF3dffe3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Nextweek",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                    : GestureDetector(
                      onTap: () async {
                        today = false;
                        tomorrow = false;
                        nextweek = true;
                        setState(() {});
                         await getontheLoad();

                      },
                      child: Text(
                        "Next Week",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
              ],
            ),
            SizedBox(height: 10),
            Flexible(child: allWork())
            
          ],
        ),
      ),
    );
  }
  Future openBox(dynamic context) => showDialog(
  context: context,
  builder:
      (context) => AlertDialog(
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel),
                    ),
                    SizedBox(width: 60.0,),
                Text("Add the work to do",style: TextStyle(
                  color: Color(0xff008080),
                  fontWeight: FontWeight.bold
                ),)
                  ],
                ),
                SizedBox(height: 20,),
                Text("Add Text"),
                SizedBox(height: 20.0,),
                Container(
                  padding: EdgeInsets.symmetric( horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                      width: 2.0,
                    ),borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Text"
                    ),
                  ),
                ),
                
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xff008080),
                      borderRadius: BorderRadius.circular(10),
                  
                    ),
                    child: GestureDetector(
                      onTap: () {
                        String id = randomAlphaNumeric(10);
                        Map<String, dynamic> userTask = {
                          "work": textController.text,
                          "id": id
                        };

                        today? DatabaseMethods().addTodayTask(userTask, id): tomorrow?DatabaseMethods().addTomorrowTask(userTask, id):DatabaseMethods().addNextWeekTask(userTask, id);
                        Navigator.pop(context);
                        textController.text = "";
                        
                      },
                      child: Center(
                        child: Text(
                          "add",
                          style: TextStyle(
                            color: Colors.white,
                            
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
);

}

