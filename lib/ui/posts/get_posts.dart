import 'package:api_testing/ui/posts/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: Consumer<PostProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('get posts'),
          ),
          body: Column(
            children: [
              FutureBuilder(
                  future: model.getPostsData(),
                  builder: (context, snapshot) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: model.postList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('${model.postList[index].title}'),
                              subtitle: Text('${model.postList[index].body}'),
                            );
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
