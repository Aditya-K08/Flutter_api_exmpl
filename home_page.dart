import 'package:flutter/material.dart';
import 'package:test1/models/post.dart';
import 'package:test1/service/post_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Welcome>? posts;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    posts = await PostService().getPst();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('posts')),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(posts![index].title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
