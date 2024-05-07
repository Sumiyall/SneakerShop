import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color.fromARGB(255, 128, 21, 138),
            title: Text(
              "Төрлүүд",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            floating: true,
            pinned: true,
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CategoryItem(
                  imageUrl: categories[index]['imageUrl'],
                  title: categories[index]['title'],
                );
              },
              childCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String? imageUrl;
  final String? title;

  const CategoryItem({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        elevation: 4, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 1, 
                child: imageUrl != null
                    ? Image.network(
                        imageUrl!,
                        fit: BoxFit.cover, 
                      )
                    : const SizedBox.shrink(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: title != null
                    ? Text(
                        title!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const categories = [
  {
    'imageUrl':
        'https://static.nike.com/a/images/f_auto/dpr_2.6,cs_srgb/w_300,c_limit/caba075b-1d7f-43cf-ba81-94735d60ed04/nike-running.jpg',
    'title': 'Basketball',
  },
  {
    'imageUrl':
        'https://static.nike.com/a/images/f_auto/dpr_2.6,cs_srgb/w_300,c_limit/caba075b-1d7f-43cf-ba81-94735d60ed04/nike-running.jpg',
    'title': 'Running',
  },
  {
    'imageUrl':
        'https://static.nike.com/a/images/f_auto/dpr_2.6,cs_srgb/w_300,c_limit/caba075b-1d7f-43cf-ba81-94735d60ed04/nike-running.jpg',
    'title': 'Boots',
  },
  {
    'imageUrl':
        'https://static.nike.com/a/images/f_auto/dpr_2.6,cs_srgb/w_300,c_limit/caba075b-1d7f-43cf-ba81-94735d60ed04/nike-running.jpg',
    'title': 'Slides',
  },
];
