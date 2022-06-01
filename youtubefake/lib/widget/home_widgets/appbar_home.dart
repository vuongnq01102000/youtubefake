import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarHome extends StatelessWidget {
  final Function func;
  const AppBarHome({
    required this.func,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //========================== Left Action =============================
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                      height: 40,
                      child: IconButton(
                          onPressed: () {
                            func.call();
                          },
                          icon: const Icon(Icons.menu))),
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(
                      height: 40,
                      child: InkWell(
                          child: SvgPicture.asset(
                        'assets/YouTubeLogo.svg',
                        alignment: Alignment.centerLeft,
                      ))),
                ),
              ],
            ),
          ),
          //============================ Mid Action ============================
          Expanded(
              flex: 8,
              child: SizedBox(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height,
                                decoration: const BoxDecoration(),
                                child: TextFormField(
                                  textAlign: TextAlign.start,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(left: 8.0),
                                      hintText: 'Tìm kiếm'),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(),
                                  ),
                                ),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    0, 62, 60, 60)),
                                        elevation:
                                            MaterialStateProperty.all<double>(
                                                0),
                                        shape: MaterialStateProperty.all<
                                                OutlinedBorder>(
                                            const RoundedRectangleBorder())),
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(
                          onPressed: () {},
                          splashRadius: 20,
                          icon: const Icon(
                            Icons.mic,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              )),
          //========================== Right Action ============================
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.video_call_outlined))),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none_rounded))),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.apps_outlined))),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              const BorderSide(width: 0.2)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white10),
                          elevation: MaterialStateProperty.all<double>(0.0),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              const CircleBorder())),
                      child: const FlutterLogo(),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
