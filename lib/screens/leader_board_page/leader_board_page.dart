import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/ui_strings.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  LeaderBoardState createState() => LeaderBoardState();
}

class LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person_add)),
        ],
        title: Text(
          "Leader_board",
          style: TextStyle(fontSize: 29),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [

            Container(
              padding: EdgeInsets.only(top : 40),
              height: 330,
              decoration: BoxDecoration(
                  color: leaderProfileBackgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1331&q=80"),
                        radius: 50,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(shape: BoxShape.circle ,color: Colors.white),child: Icon(Icons.edit,color: Colors.purpleAccent,),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Vishnu Vardhan",
                    style: TextStyle(
                        fontSize: 22,
                        color: leaderProfileTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "45",
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(0.9)),
                          ),
                          Text("Level",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("#335",
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(0.9))),
                          Text("Rank",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Leaderboard",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: SizedBox(
                height: 300,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80"),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Nagarjuna")
                          ],
                        ),
                        leading: Text("#${index + 1}" ,style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Text(
                            "cal.${(2000 / (index + 1)).toString().substring(0, 5)}",style: TextStyle(fontWeight: FontWeight.bold)),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(thickness: 1,color: Colors.purple,indent: 10,endIndent: 10,),
                    itemCount: 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}