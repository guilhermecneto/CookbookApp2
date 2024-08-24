import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/post.dart';

class PostSection extends StatelessWidget {
  final List<Post> posts;


  PostSection(this.posts);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Posts",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];

              return SizedBox(
                width: 300,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                child: Image.asset(
                                  posts.profileImageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                  top: 4.0,
                                  right: 4.0,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite,
                                    ),
                                    iconSize: 30,
                                    color: Colors.redAccent,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          posts.name,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: Text(
                          posts.comment,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        onTap: () {
                          print("Clicou em ${posts.name}");
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

extension on List<Post> {
  String get profileImageUrl => this.profileImageUrl;

  String get name => this.name;

  String get comment => this.comment;
}
