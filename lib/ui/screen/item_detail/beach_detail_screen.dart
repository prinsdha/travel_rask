import 'package:flutter/material.dart';
import 'package:travelapp/core/const/app_icon.dart';
import 'package:travelapp/core/data/dummy_data.dart';

class BeachDetailScreen extends StatefulWidget {
  final int index;
  final Function() onUpdate;
  const BeachDetailScreen(
      {Key? key, required this.index, required this.onUpdate})
      : super(key: key);

  @override
  State<BeachDetailScreen> createState() => _BeachDetailScreenState();
}

class _BeachDetailScreenState extends State<BeachDetailScreen> {
  BeachResortModel get beachResortModel => beachResortList[widget.index];

  set setBeachResortModel(BeachResortModel v) {
    beachResortList[widget.index] = v;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              beachResortModel.isFavourite = !beachResortModel.isFavourite;
              setBeachResortModel = beachResortModel;
              widget.onUpdate();
              setState(() {});
            },
            icon: beachResortModel.isFavourite
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
          const SizedBox(
            width: 7,
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            beachResortModel.image,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(0.6),
                  Colors.black,
                ],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
              ).createShader(bounds),
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Row(
                  children: [
                    Text(
                      beachResortModel.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Image.asset(
                      AppAssets.location,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      beachResortModel.location ?? "",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  beachResortModel.description,
                  maxLines: 4,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                        color: Colors.white),
                  )
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "${beachResortModel.price}/person",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Container(
                      height: 45,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xffFCD240),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: const Center(
                          child: Text(
                        "Book Now",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
