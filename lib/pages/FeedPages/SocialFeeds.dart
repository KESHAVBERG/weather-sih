import "package:flutter/material.dart";

class SocailFeeds extends StatefulWidget {
  const SocailFeeds({super.key});

  @override
  State<SocailFeeds> createState() => _SocailFeedsState();
}

class _SocailFeedsState extends State<SocailFeeds> {
  Widget feedsCard(String img, location, description) {
    return Card(
      child: Container(
        height: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(img)),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on),
                  Text(
                    location,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 8, 8),
                child: Text(
                  description,
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: ListView(
        children: [
          feedsCard(
              "https://c.ndtvimg.com/2023-11/pqj18or8_chennai-waterlogging_120x90_26_November_23.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=738",
              "Kolathur",
              "45 km arterial road in the city, and the motorists were unable to drive their vehicles."),
          SizedBox(
            height: 20,
          ),
          feedsCard(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRnbGQ6klKr4KuX6giZXk2_JDi2csBJ0UAdA&s",
              "Sholinganallur",
              "45 km arterial road in the city, and the motorists were unable to drive their vehicles.")
        ],
      ),
    );
  }
}
