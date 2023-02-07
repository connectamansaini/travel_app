import 'package:flutter/material.dart';
import 'package:travel_app/src/home/views/detail_view.dart';
import 'package:travel_app/src/model/packages_model.dart';

import '../../core/constants.dart';
import '../../core/size_config.dart';
import '../../core/star_rating.dart';
import 'components/category_button.dart';
import 'components/tour_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _indexChooseCategory = 1;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(child: buildBody()),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.sizedBox10Height,
          appBar(),
          headline(),
          Constants.sizedBoxDefaultHeight,
          searchBar(),
          Constants.sizedBoxDefaultHeight,
          titleWithSeeAllRow('Choose Category'),
          Constants.sizedBoxDefaultHeight,
          categoryCardRow(),
          Constants.sizedBoxDefaultHeight,
          buildTourCardRow(),
          Constants.sizedBoxDefaultHeight,
          titleWithSeeAllRow('Popular Package'),
          Constants.sizedBoxDefaultHeight,
          buildPopularPackageCard(0),
          Constants.sizedBoxDefaultHeight,
          buildPopularPackageCard(1),
          Constants.sizedBoxDefaultHeight,
        ],
      ),
    );
  }

  Row appBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 16,
              ),
              SizedBox(width: 12),
              Text(
                'Hello, Vineetha',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          // const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black54,
              size: 26,
            ),
          ),
          // const SizedBox(width: 1),
        ],
      );

  GestureDetector buildPopularPackageCard(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(
              packages: packages[index],
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              size: 24,
              color: Colors.red,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: SizeConfig.screenWidth,
            height: SizeConfig.blockSizeVertical! * 22,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(100, 196, 196, 196),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  height: double.infinity,
                  width: SizeConfig.safeBlockVertical! * 13,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(packages[index].image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        packages[index].title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '₹${packages[index].price}',
                        style: const TextStyle(color: Colors.red),
                      ),
                      StarRating(
                        rating: packages[index].rating,
                        iconSize: 18,
                        color: Colors.black,
                      ),
                      Text(
                        packages[index].description,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildTourCardRow() {
    return SizedBox(
      height: SizeConfig.safeBlockHorizontal! * 60,
      width: SizeConfig.screenWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: packages.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailView(
                    packages: packages[index],
                  ),
                ),
              );
            },
            child: TourCard(
              packages: packages[index],
            ),
          );
        },
      ),
    );
  }

  Row categoryCardRow() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            _indexChooseCategory = 1;
          }),
          child: CategoryButton(
            image: 'assets/images/beach.png',
            color: _indexChooseCategory == 1
                ? const Color.fromRGBO(93, 199, 32, 1)
                : const Color.fromRGBO(218, 218, 218, 1),
            title: 'Beach',
          ),
        ),
        Constants.sizedBoxDefaultWidth,
        GestureDetector(
          onTap: () => setState(() {
            _indexChooseCategory = 2;
          }),
          child: CategoryButton(
            image: 'assets/images/mountain.png',
            color: _indexChooseCategory == 2
                ? const Color.fromRGBO(93, 199, 32, 1)
                : const Color.fromRGBO(218, 218, 218, 1),
            title: 'Mountain',
          ),
        ),
      ],
    );
  }

  Row titleWithSeeAllRow(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        const Text(
          'See all',
          style: TextStyle(
            // fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(70, 0, 0, 0),
          ),
        )
      ],
    );
  }

  TextFormField searchBar() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
        // contentPadding: const EdgeInsets.all(0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: const Color.fromARGB(10, 0, 0, 0),
        filled: true,
      ),
    );
  }

  Text headline() {
    return const Text(
      'Where do you \nwant to explore today?',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
    );
  }

  SliverAppBar buildAppBar() {
    return SliverAppBar(
      toolbarTextStyle: const TextStyle(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: const [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 16,
          ),
          SizedBox(width: 12),
          Text(
            'Hello, Aman',
          ),
        ],
      ),
      floating: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: Colors.black54,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
