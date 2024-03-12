import 'package:flutter/material.dart';
import 'package:najot_talim_nt/screens/widgets/screen_two_categories.dart';
import 'package:najot_talim_nt/size/app_size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 235.getH(),
            elevation: 0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.getW()),
                child: Column(
                  children: [
                    SizedBox(height: 50.getH()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 250.getW(),
                          height: 120.getH(),
                          child: RichText(
                            text: TextSpan(
                              text: "Hello ",
                              style: TextStyle(
                                fontSize: 25.getW(),
                                color: Colors.black45,
                              ),
                              children: [
                                TextSpan(
                                  text: "Fahmi \n",
                                  style: TextStyle(
                                    fontSize: 25.getW(),
                                    color: Colors.orange,
                                  ),
                                ),
                                TextSpan(
                                  text: "Find the Right One For A Healthy Body",
                                  style: TextStyle(
                                    fontSize: 25.getW(),
                                    color: Colors.brown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ZoomTapAnimation(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50.getH(),
                            width: 50.getW(),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.orange,
                                width: 1.getW(),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.notifications_none,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.getH()),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50.getH(),
                            child: TextField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.orange,
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.search),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.9),
                                  fontSize: 14.getW(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.getW()),
                        Container(
                          height: 50.getH(),
                          width: 50.getW(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.orange,
                              width: 1.getW(),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.format_line_spacing_sharp,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.getH()),
                  ],
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: CategoriesViewScreenTwo(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 15.getH()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.getW()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Best Deal",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.getW(),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            // color: Colors.red,
                            padding: EdgeInsets.only(top: 20.getH()),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.getW()),
                                color: Colors.orangeAccent,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.getW(),
                                vertical: 15.getH(),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "#SimpleKitchen",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.getW(),
                                    ),
                                  ),
                                  SizedBox(height: 20.getH()),
                                  SizedBox(
                                    width: 140.getW(),
                                    child: Text(
                                      "Soup Package",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35.getW(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.getH()),
                                  SizedBox(
                                    width: 190.getW(),
                                    child: Text(
                                      "No Need to think about ingredients anymore let's fins your menu today",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.getW(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.getH()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.getH()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Best Price",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.getW(),
                            ),
                          ),
                          Text(
                            "Show All",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.getW(),
                            ),
                          ),
                        ],
                      ),
                      GridView.count(
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.7,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: List.generate(
                          imagesPath.length,
                          (index) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.getW()),
                              border: Border.all(
                                width: 1.getW(),
                                color: Colors.grey,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.getW()),
                              child: Image.network(
                                imagesPath[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // BottomNavigationBar(
                //   items: const [
                //     BottomNavigationBarItem(
                //       icon: Icon(Icons.home),
                //       label: 'Home',
                //     ),
                //     BottomNavigationBarItem(
                //       icon: Icon(Icons.search),
                //       label: 'Search',
                //     ),
                //     BottomNavigationBarItem(
                //       icon: Icon(Icons.settings),
                //       label: 'Settings',
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
