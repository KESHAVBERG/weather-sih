import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('posts').snapshots();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          actions:[
            TextButton(
              child: Text("Logout"),
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
               Text("Feeds", style:  TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              Text("Community", style:  TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
        // body: Container(
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        //   child:StreamBuilder<QuerySnapshot>(
        //     stream: _usersStream,
        //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //       if (snapshot.hasError) {
        //         return Text('Something went wrong');
        //       }
        //
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Text("Loading");
        //       }
        //
        //       return ListView(
        //         children: snapshot.data!.docs.map((DocumentSnapshot document) {
        //           Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        //           return ListTile(
        //             title: Text(data['title']),
        //             subtitle: Text(data['description']),
        //           );
        //         }).toList(),
        //       );
        //     },
        //   )
        // ),
        body: TabBarView(
          children: [
            Text("Feeds"),
            Text("Community")
          ],
        ),
      ),
    );
  }
}
