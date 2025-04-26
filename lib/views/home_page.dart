import 'package:flutter/material.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';
import 'package:real_estate/widgets/property_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<String> tabs = ['All', 'House', 'Flats', 'Villas'];
  int selectedIndex = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 243, 243),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: h4TitleStyleGrey.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "Lama Dayoub",
              style: h2TitleStyleBlack,
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBarWidget(),
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              isScrollable: true,
              tabs: tabs.map((tab) => Tab(text: tab)).toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: tabs.map((tab) {
                  return GridView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two items per row
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8, // Height to width ratio
                    ),
                    itemCount: 10, // For example, 10 items for each tab
                    itemBuilder: (context, index) {
                      return PropertyCard();
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: myBottomNavigationBar(),
    );
  }

  BottomNavigationBar myBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor,
      selectedLabelStyle: h4TitleStylePrimary,
      unselectedItemColor: greyText,
      unselectedLabelStyle: h4TitleStyleGrey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.message_outlined,
          ),
          label: "Messages",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border_outlined,
          ),
          label: "Favorites",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Account",
        ),
      ],
    );
  }

  Container searchBarWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 79, 76, 76),
            offset: Offset(2, 2),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Color.fromARGB(50, 79, 76, 76),
            offset: Offset(-2, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Search",
          hintStyle: h4TitleStyleGrey,
          contentPadding: const EdgeInsets.all(18),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: greyText),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined, color: greyText),
          ),
        ),
      ),
    );
  }
}
