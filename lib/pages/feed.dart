import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather/pages/FeedPages/SocialFeeds.dart';


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
        body: TabBarView(
          children: [
            SocailFeeds(),
            Text("Community")
          ],
        ),
      ),
    );
  }
}
