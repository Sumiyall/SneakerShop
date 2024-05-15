import 'package:flutter/material.dart';
import 'hi1.dart';
import 'proddetail.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String selectedChoice = "Men's";
  String? selectedCategory;

  void onChoiceSelected(String choice) {
    setState(() {
      selectedChoice = choice;
      selectedCategory = null;
    });
  }

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
  backgroundColor: Color.fromARGB(255, 128, 21, 138),
  title: Text(
    "Sneaker Shop",
    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
  ),
  floating: true,
  pinned: true,
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(55),
    child: Container(
      color: Color.fromARGB(255, 128, 21, 138),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.search, color: Colors.black, size: 24),
          contentPadding: EdgeInsets.symmetric(vertical: 0),
        ),
        style: TextStyle(color: Colors.black, fontSize: 12),
      ),
    ),
  ),
  automaticallyImplyLeading: false,
),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        ChoiceChip(
                          label: Text(
                            "Men's",
                            style: TextStyle(
                              color: selectedChoice == "Men's"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          selected: selectedChoice == "Men's",
                          onSelected: (selected) => onChoiceSelected("Men's"),
                          backgroundColor: Colors.grey[300],
                          selectedColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 2,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        SizedBox(width: 8),
                        ChoiceChip(
                          label: Text(
                            "Women's",
                            style: TextStyle(
                              color: selectedChoice == "Women's"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          selected: selectedChoice == "Women's",
                          onSelected: (selected) => onChoiceSelected("Women's"),
                          backgroundColor: Colors.grey[300],
                          selectedColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 2,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        SizedBox(width: 8),
                        ChoiceChip(
                          label: Text(
                            "Kid's",
                            style: TextStyle(
                              color: selectedChoice == "Kid's"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          selected: selectedChoice == "Kid's",
                          onSelected: (selected) => onChoiceSelected("Kid's"),
                          backgroundColor: Colors.grey[300],
                          selectedColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 2,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        SizedBox(width: 8),
                        ChoiceChip(
                          label: Text(
                            "Brands",
                            style: TextStyle(
                              color: selectedChoice == "Brands"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          selected: selectedChoice == "Brands",
                          onSelected: (selected) => onChoiceSelected("Brands"),
                          backgroundColor: Colors.grey[300],
                          selectedColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 2,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  if ((selectedChoice == "Men's" ||
                        selectedChoice == "Women's" ||
                        selectedChoice == "Kid's") &&
                    selectedCategory == null)
                    CategoryGrid(
                      categories: [
                        {
                          'name': 'Basketball',
                          'imageUrl':
                              'https://www.rockstaracademy.com/lib/images/news/basketball.jpeg',
                        },
                        {
                          'name': 'Sale',
                          'imageUrl': 'https://i.ebayimg.com/images/g/1~8AAOSwvKtY~XTY/s-l1200.jpg',
                        },
                        {
                          'name': 'New',
                          'imageUrl': 'https://www.jiomart.com/images/product/original/rvue2fhoxv/azeraa-fashion-shoes-for-mens-latest-design-partywear-new-model-trendy-stylish-sneaker-shoe-fashion-shoes-for-mens-high-heel-latest-design-partywear-new-model-trendy-stylish-sneaker-shoe-mens-sneakers-for-men-_803_black_uk-6-product-images-rvue2fhoxv-0-202211070019.jpg',
                        },
                        {
                          'name': 'Top Selling',
                          'imageUrl':
                              'https://img.buzzfeed.com/buzzfeed-static/complex/images/Y19jcm9wLGhfMTA2NSx3XzE4OTMseF81MSx5XzY2Mg==/jczrzgiymddftgcdheiu/nike-air-force-1-low-terror-squad-fj5756-100-pair.jpg',
                        },
                      ],
                      onCategorySelected: onCategorySelected,
                    )
                  else
                    SneakerCart(
                      selectedChoice: selectedChoice,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final Function(String) onCategorySelected;

  const CategoryGrid({
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () => onCategorySelected(category['name']),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Image.network(
                    category['imageUrl'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Text(
                      category['name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SneakerCart extends StatelessWidget {
  final String selectedChoice;
  final String? selectedCategory;

  SneakerCart({required this.selectedChoice, this.selectedCategory});

  final List<Map<String, dynamic>> sneakers = [
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'category': 'Basketball',
      'price': 250000,
      'imageUrl':
          'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Adidas Superstar',
      'type': 'Эрэгтэй',
      'category': 'Basketball',
      'price': 180000,
      'imageUrl':
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/61f87dec481e4512823ea7fb0080ba1a_9366/Superstar_Shoes_White_C77124_01_standard.jpg',
    },
    {
      'name': 'Nike Air Max 90',
      'type': 'Эрэгтэй',
      'category': 'Sale',
      'price': 200000,
      'imageUrl':
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/a0a300da-2e16-4483-ba64-9815cf0598ac/air-max-90-mens-shoes-6n3vKB.png',
    },
    {
      'name': 'Puma Suede Classic',
      'type': 'Эрэгтэй',
      'category': 'Sale',
      'price': 120000,
      'imageUrl':
          'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/352634/03/sv01/fnd/PNA/fmt/png/Suede-Classic+-Sneakers',
    },
    {
      'name': 'Adidas Ultraboost 21',
      'type': 'Эрэгтэй',
      'category': 'New',
      'price': 320000,
      'imageUrl':
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/9c7058d8677742ac8519ac3f009cdcf4_9366/Ultraboost_21_Shoes_White_FY0306_01_standard.jpg',
    },
    {
      'name': 'Nike Zoom Freak 3',
      'type': 'Эрэгтэй',
      'category': 'New',
      'price': 280000,
      'imageUrl':
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/ceb498b5-1609-4aae-9917-0b9e6fa53b0b/freak-3-basketball-shoes-B9NrxN.png',
    },
    {
      'name': 'Nike Air Jordan 1',
      'type': 'Эрэгтэй',
      'category': 'Top Selling',
      'price': 350000,
      'imageUrl':
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/ceb498b5-1609-4aae-9917-0b9e6fa53b0b/freak-3-basketball-shoes-B9NrxN.png',
    },
    {
      'name': 'Adidas Stan Smith',
      'type': 'Эрэгтэй',
      'category': 'Top Selling',
      'price': 150000,
      'imageUrl':
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/ceb498b5-1609-4aae-9917-0b9e6fa53b0b/freak-3-basketball-shoes-B9NrxN.png',
    },
    {
      'name': 'Nike Air Max 270',
      'type': 'Эмэгтэй',
      'category': 'Basketball',
      'price': 220000,
      'imageUrl':
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/i1-6b66deef-8c5a-42ff-8781-be141b989bb2/air-max-270-womens-shoes-Pgb94t.png',
    },
    {
      'name': 'Adidas NMD_R1',
      'type': 'Эмэгтэй',
      'category': 'Sale',
      'price': 190000,
      'imageUrl':
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/edd3c94e2f3b4e678095aa4a0106abb6_9366/NMD_R1_Shoes_Pink_FV1788_01_standard.jpg',
    },
    {
      'name': 'Puma Cali Sport Mix',
      'type': 'Эмэгтэй',
      'category': 'New',
      'price': 160000,
      'imageUrl':
          'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/374667/01/sv01/fnd/PNA/fmt/png/Cali-Sport-Mix-Women\'s-Sneakers',
    },
    {
      'name': 'New Balance 574',
      'type': 'Эмэгтэй',
      'category': 'Top Selling',
      'price': 180000,
      'imageUrl':
          'https://nb.scene7.com/is/ima',
    },

    // Kid's sneakers
    {
      'name': 'Nike Air Max 90',
      'type': 'Хүүхэд',
      'category': 'Basketball',
      'price': 150000,
      'imageUrl':
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/5b158218-9c65-4309-8635-7b58f3a71b63/air-max-90-older-shoes-1wzwJM.png',
    },
    {
      'name': 'Adidas Superstar',
      'type': 'Хүүхэд',
      'category': 'Sale',
      'price': 120000,
      'imageUrl':
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/17b5ea4849b147788d97ac1e0121abe9_9366/Superstar_Shoes_White_FU7714_01_standard.jpg',
    },
    {
      'name': 'Puma Suede Classic XXI',
      'type': 'Хүүхэд',
      'category': 'New',
      'price': 100000,
      'imageUrl':
          'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/381173/06/sv01/fnd/PNA/fmt/png/Suede-Classic-XXI-Kids\'-Sneakers',
    },
    {
      'name': 'New Balance 997H',
      'type': 'Хүүхэд',
      'category': 'Top Selling',
      'price': 130000,
      'imageUrl':
          'fmt=webp&wid=472&hei=472',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    if (selectedChoice == "Brands") {
      // Display brand logos or cards
      return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          BrandCard(
            brandName: "Nike",
            logoUrl:
                "https://purepng.com/public/uploads/large/purepng.com-nike-logologobrand-logoiconslogos-251519940082eoxxs.png",
          ),
          BrandCard(
            brandName: "Adidas",
            logoUrl:
                "https://purepng.com/public/uploads/large/21502362475r8bjrgyzs78go6s1hjhf8hfz22xjolzbtlkj7loqtg18wsxpb6l72dmqxhn1regqpjjscyuppavtcnacyuummijt8cmz7wj1ehjx.png",
          ),
          BrandCard(
            brandName: "Parker",
            logoUrl:
                "https://purepng.com/public/uploads/large/purepng.com-parker-hannifin-logologobrand-logoiconslogos-2515199387710dv6x.png",
          ),
        ],
      );
    } else {
      List<Map<String, dynamic>> filteredSneakers = sneakers.where((sneaker) {
        bool matchesChoice = selectedChoice == "Men's" &&
                sneaker['type'] == 'Эрэгтэй' ||
            selectedChoice == "Women's" && sneaker['type'] == 'Эмэгтэй' ||
            selectedChoice == "Kid's" && sneaker['type'] == 'Хүүхэд';
        return matchesChoice;
      }).toList();

      return GridView.count(
  crossAxisCount: 2,
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  children: filteredSneakers.map((sneaker) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                child: Image.network(
                  sneaker['imageUrl']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sneaker['name']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    sneaker['type']!,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  sneaker['price'] != null
                      ? Text(
                          '${sneaker['price']}₮',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          'More Details',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: sneaker),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text('  More Details'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }).toList(),
);

    }
  }
}

class BrandCard extends StatelessWidget {
  final String brandName;
  final String logoUrl;

  const BrandCard({required this.brandName, required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              logoUrl,
              height: 80,
              width: 80,
            ),
            SizedBox(width: 16),
            Text(
              brandName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}