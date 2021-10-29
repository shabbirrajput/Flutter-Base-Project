import 'package:flutter/material.dart';
import 'package:flutterbase/utils/common/common_service.dart';
import 'package:flutterbase/utils/common_import.dart';

class ScreenWelcomeCard extends StatefulWidget {
  const ScreenWelcomeCard({Key? key}) : super(key: key);

  @override
  _ScreenWelcomeCardState createState() => _ScreenWelcomeCardState();
}

class _ScreenWelcomeCardState extends State<ScreenWelcomeCard> {
  int pos = 0;
  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                APPImages.ic_placeholder,
                height: 233,
                width: 286,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              height: 0,
              thickness: 0,
              color: AppColors.colorGreyLight1,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(44, 60, 44, 0),
                  child: pages[pos],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: BottomIndicator(length: pages.length, pos: pos),
                ),
                Container(
                  height: 110,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: SafeArea(
                    // left: false,
                    // right: false,
                    // bottom: true,
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: pos != 0,
                            child: InkWell(
                              onTap: () => setState(() {
                                pos = pos > 0 ? pos - 1 : pos;
                              }),
                              child: const Icon(Icons.arrow_back),
                            ),
                          ),
                          const Spacer(),
                          if (pos < pages.length - 1)
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () => setState(() {
                                  pos = pages.length - pos > 1 ? pos + 1 : pos;
                                }),
                                child: Text(
                                  getTranslate(context, APPStrings.text_next)!,
                                  style: AppFont.regularBlack_20,
                                ),
                              ),
                            ),
                          if (pos == pages.length - 1)
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(AppRoutes.routes_login);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.colorPrimary,
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Text(getTranslate(context, APPStrings.text_get_started)!,
                                    style: AppFont.mediumBoldWhite_20),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomIndicator extends StatelessWidget {
  final int length;
  final int pos;

  const BottomIndicator({Key? key, required this.length, required this.pos})
      : super(key: key);

  //TODO: Nested items or single container
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        length,
        (index) => Flexible(
          flex: index == pos ? 2 : 1,
          child: AnimatedContainer(
            color: index == pos
                ? Theme.of(context).primaryColor
                : AppColors.colorGreyExtraLight,
            margin: EdgeInsets.only(right: index + 1 < length ? 10 : 0),
            duration: const Duration(milliseconds: 350),
            height: 1.8,
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      getTranslate(context, APPStrings.text_welcome_note)!,
      style: AppFont.boldBlack_25,
      textAlign: TextAlign.center,
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getTranslate(context, APPStrings.text_welcome_note)!,
          style: AppFont.boldBlack_25,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
          child: Text(
            getTranslate(context, APPStrings.text_welcome_note_desc)!,
            style: AppFont.mediumBoldBlack_20,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getTranslate(context, APPStrings.text_welcome_note)!,
          style: AppFont.boldBlack_25,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
          child: Text(
            getTranslate(context, APPStrings.text_welcome_note_desc)!,
            style: AppFont.mediumBoldBlack_20,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getTranslate(context, APPStrings.text_welcome_note)!,
          style: AppFont.boldBlack_25,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
          child: Text(
            getTranslate(context, APPStrings.text_welcome_note_desc)!,
            style: AppFont.mediumBoldBlack_20,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
