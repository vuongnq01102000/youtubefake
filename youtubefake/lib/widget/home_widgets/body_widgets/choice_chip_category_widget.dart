import 'package:flutter/material.dart';
import 'package:youtubefake/models/item_model.dart';

class ChoiceChipCategoryHomePage extends StatelessWidget {
  final Function funcDeres;
  final Function funcIncre;
  final ScrollController scrollController;
  final List<ItemModel> list;
  const ChoiceChipCategoryHomePage({
    Key? key,
    required this.scrollController,
    required this.funcDeres,
    required this.funcIncre,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Row(
                  children: List.generate(
                      list.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Chip(
                                backgroundColor: list[index] == list.first
                                    ? Colors.black45
                                    : Colors.black12,
                                label:
                                    Text(list[index].snippet.title ?? 'Title')),
                          )),
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: -5,
            child: ElevatedButton(
              onPressed: () => funcDeres(),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(const CircleBorder())),
              child: const Icon(
                Icons.chevron_left,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: -5,
            child: ElevatedButton(
              onPressed: () => funcIncre(),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(const CircleBorder())),
              child: const Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
