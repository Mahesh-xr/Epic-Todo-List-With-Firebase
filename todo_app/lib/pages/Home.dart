import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool today = true, tomorrow=false, nextweek=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
               today ? Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                ):GestureDetector(
                  onTap: (){
                  today=true;
                tomorrow=false;
                nextweek=false;
                setState(() {
                  
                });
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
               tomorrow?
                   Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                 
                :GestureDetector(
                  onTap: (){today=false;
                tomorrow=true;
                nextweek=false;
                 setState(() {
                  
                });},
                
                child:Text(
                      "Tomorrow",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),),
                   nextweek? Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                ):GestureDetector(
                  onTap: (){today=false;
                tomorrow=false;
                nextweek=true;
                setState(() {
                  
                });},
                  child: Text(
                        "Next Week",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                )
                    
                    ,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
