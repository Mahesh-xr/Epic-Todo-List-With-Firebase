import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool today = true, tomorrow = false, nextweek = false, suggest = false;
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
                      onTap: () {
                        today = true;
                        tomorrow = false;
                        nextweek = false;
                        setState(() {});
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
                      onTap: () {
                        today = false;
                        tomorrow = true;
                        nextweek = false;
                        setState(() {});
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
                      onTap: () {
                        today = false;
                        tomorrow = false;
                        nextweek = true;
                        setState(() {});
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
            CheckboxListTile(
              value: suggest,
              onChanged: (newValue) {
                setState(() {
                  suggest = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Color(0xFF279cfb),
              title: Text(
                "Learn Firebase",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
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
                    child: Center(
                      child: Text(
                        "add",
                        style: TextStyle(
                          color: Colors.white,
                          
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

