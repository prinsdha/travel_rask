import 'package:flutter/material.dart';
import 'package:travelapp/ui/screen/item_detail/beach_detail_screen.dart';
import 'package:travelapp/core/const/app_color.dart';
import 'package:travelapp/core/const/app_icon.dart';
import 'package:travelapp/core/const/app_assets.dart';
import 'package:travelapp/core/data/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _isSelectedIndex = 0;

  set isSelectedIndex(int value) {
    _isSelectedIndex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 70,
          title: Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColor.primaryGrey,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Hello, Vineetha",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Image.asset(
                AppAssets.notification,
                height: 25,
              )
            ],
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
              horizontal: AppSettings.kdefaulpadding),
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Where do you \nwant to explore today?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(fontWeight: FontWeight.w500),
                fillColor: AppColor.primaryGrey.withOpacity(0.4),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            titleHeader("Choose Category"),
            const SizedBox(
              height: 30,
            ),
            category(),
            const SizedBox(
              height: 30,
            ),
            beachListView(),
            const SizedBox(
              height: 30,
            ),
            titleHeader("Popular Pacakge"),
            const SizedBox(
              height: 30,
            ),
            ...beachList
                .asMap()
                .map(
                    (index, value) => MapEntry(index, popularPackageBox(value)))
                .values
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget popularPackageBox(BeachResortModel beachResortModel) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.primaryGrey,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  beachResortModel.image,
                ),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    beachResortModel.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    beachResortModel.price,
                    style:
                        const TextStyle(color: Color(0xffFD5B1F), fontSize: 14),
                  ),
                  const SizedBox(height: 7),
                  Row(children: [
                    ...List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 15,
                        color: index < beachResortModel.rate.toInt()
                            ? Colors.yellow
                            : Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      beachResortModel.rate.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    beachResortModel.description,
                    maxLines: 2,
                    style: const TextStyle(
                        height: 1.5,
                        fontSize: 12,
                        color: Color(0xff767676),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          IconButton(
            icon: Center(
              child: beachResortModel.isFavourite
                  ? const Icon(
                      Icons.favorite,
                      size: 21,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      size: 21,
                      color: Colors.black,
                    ),
            ),
            onPressed: () {
              beachResortModel.isFavourite = !beachResortModel.isFavourite;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  SingleChildScrollView beachListView() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: beachResortList
            .asMap()
            .map((index, value) => MapEntry(
                index,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return BeachDetailScreen(
                          index: index,
                          onUpdate: () {
                            setState(() {});
                          },
                        );
                      }),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 240,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          value.image,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Center(
                                child: value.isFavourite
                                    ? const Icon(
                                        Icons.favorite,
                                        size: 21,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        size: 21,
                                        color: Colors.black,
                                      ),
                              ),
                            ),
                            onPressed: () {
                              value.isFavourite = !value.isFavourite;
                              setState(() {});
                            },
                          ),
                        ),
                        const Spacer(),
                        Text(
                          value.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AppAssets.location,
                              height: 23,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              value.location ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(children: [
                          ...List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              size: 15,
                              color: index < value.rate.toInt()
                                  ? Colors.yellow
                                  : Colors.grey.shade300,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            value.rate.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                )))
            .values
            .toList(),
      ),
    );
  }

  SingleChildScrollView category() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: beachCategoryList
              .asMap()
              .map((index, value) => MapEntry(
                  index,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          isSelectedIndex = index;
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: _isSelectedIndex == index
                                  ? Colors.green
                                  : AppColor.primaryGrey,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                value.image,
                                width: 50,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                value.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  )))
              .values
              .toList()),
    );
  }

  Widget titleHeader(String name) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, fontFamily: ""),
        ),
        const Spacer(),
        const Text(
          "See all",
          style: TextStyle(
            fontSize: 12,
            color: AppColor.primaryGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
