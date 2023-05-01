import 'package:flutter/material.dart';

class AllPost extends StatefulWidget {
  const AllPost({Key? key}) : super(key: key);

  @override
  State<AllPost> createState() => _AllPostState();
}

class _AllPostState extends State<AllPost> {
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('${args[0].festivalName} Post'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
          backgroundColor: Colors.orange.shade900,
        ),
      backgroundColor: Colors.orange.shade50,
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        children: List.generate(args.length, (i) {
          return GestureDetector(
            onTap: () {
              // Navigator.of(context)
              //     .pushNamed('postEdit', arguments: args[i]);
            },
            child: Container(
              width: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    '${args[i].image}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
