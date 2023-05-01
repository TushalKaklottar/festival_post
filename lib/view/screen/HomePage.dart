import 'package:festival_post/Festival_model/model.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Post List"),
        centerTitle: true,
        backgroundColor: Colors.orange.shade900,
      ),
      backgroundColor: Colors.orange.shade50,
      body: Scrollbar(
        radius: Radius.circular(10),
        thickness: 5,
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(right: 15,left: 15,top: 15,bottom: 25),
            itemCount: allPost.length,
            separatorBuilder: (context,i){
              return SizedBox(height: 10);
            },
          itemBuilder: (context, i) {
              return post(festivalPost: allPost[i]);
          },
        ),
      ),
    );
  }

  Widget post({required List festivalPost,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${festivalPost[0].festivalName}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade900,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('allPost',arguments: festivalPost);
              },
              child: Text(
                'See more',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: festivalPost.length,
            separatorBuilder: (context, i) {
              return SizedBox(width: 20);
    },
    itemBuilder: (context, i) {
      return GestureDetector(
        onTap: () {
        },
        child: Container(
          width: 170,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                '${festivalPost[i].image}',
              ),
              fit: BoxFit.cover
            )
          ),
        ),
      );
    }
    )
    )

]


    );
  }
}
