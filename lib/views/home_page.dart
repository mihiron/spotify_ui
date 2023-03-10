import 'package:flutter/material.dart';
import 'package:spotify_ui/models/album.dart';
import 'package:spotify_ui/models/category.dart';
import 'package:spotify_ui/routes/app_routes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Album> albums = [
    Album(
      imagePath: 'assets/images/sample1.jpeg',
      title: 'capture419',
      artist: 'ペトロールズ',
      playtime: const Duration(minutes: 6, seconds: 20),
    ),
    Album(
      imagePath: 'assets/images/sample2.jpeg',
      title: '無罪モラトリアム',
      artist: '椎名林檎',
      playtime: const Duration(minutes: 5, seconds: 30),
    ),
    Album(
      imagePath: 'assets/images/sample3.jpg',
      title: 'FEEL GOOD',
      artist: 'SIRUP',
      playtime: const Duration(minutes: 4, seconds: 40),
    ),
  ];

  final List<Category> categories = [
    Category(name: 'クラシック', color: Colors.purple),
    Category(name: 'カントリー', color: Colors.yellow),
    Category(name: 'ポップ', color: Colors.pink),
    Category(name: 'ロック', color: Colors.blue),
    Category(name: 'ジャズ', color: Colors.green),
    Category(name: 'パンク', color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ホーム'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'あなたへのおすすめ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 8),
                    itemExtent: 160,
                    itemCount: albums.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.player,
                            arguments: albums[index],
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    albums[index].imagePath,
                                  ),
                                ),
                              ),
                              Text(
                                albums[index].title,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[300],
                                ),
                              ),
                              Text(
                                albums[index].artist,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'カテゴリー',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 240,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight,
                            colors: [categories[index].color, Colors.black],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          categories[index].name,
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '検索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            label: 'プレイリスト',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'アカウント',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
      ),
    );
  }
}
