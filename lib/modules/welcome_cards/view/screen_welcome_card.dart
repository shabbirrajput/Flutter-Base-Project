import 'package:flutterbase/modules/core/utils/common_import.dart';
import 'package:flutterbase/modules/core/utils/print_log.dart';

class ScreenWelcomeCard extends StatefulWidget {
  const ScreenWelcomeCard({Key? key}) : super(key: key);

  @override
  ScreenWelcomeCardState createState() => ScreenWelcomeCardState();
}

class ScreenWelcomeCardState extends State<ScreenWelcomeCard> {
  int pos = 0;
  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void setCurrentPos(int data) {
    setState(() {
      pos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    Widget image() {
      return Center(
        child: Image.asset(
          APPImages.icPlaceholder,
          height: 233,
          width: 286,
        ),
      );
    }

    Widget page() {
      return Column(
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
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => setState(() {
                            pos = pages.length - pos > 1 ? pos + 1 : pos;
                          }),
                          child: Text(
                            getTranslate(APPStrings.textNext)!,
                            style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                                Dimens.margin20, FontWeight.w400),
                          ),
                        ),
                      ),
                    if (pos == pages.length - 1)
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.routesLogin);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor,
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(getTranslate(APPStrings.textGetStarted)!,
                              style: getTextStyle(Theme.of(context).primaryTextTheme.headline2!,
                                  Dimens.margin20, FontWeight.w500)),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    Drawer mDrawer() {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Page 1'),
              onTap: () {
                setCurrentPos(0);
              },
            ),
            ListTile(
              title: const Text('Page 2'),
              onTap: () {
                setCurrentPos(1);
              },
            ),
            ListTile(
              title: const Text('Page 3'),
              onTap: () {
                setCurrentPos(2);
              },
            ),
            ListTile(
              title: const Text('Page 4'),
              onTap: () {
                setCurrentPos(3);
              },
            ),
          ],
        ),
      );
    }

    return Material(
      color: Theme.of(context).backgroundColor,
      child: Responsive(
        mobile: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState!.openDrawer(),
            ),
          ),
          drawer: mDrawer(),
          body: Column(
            children: [
              Expanded(
                child: image(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  height: 0,
                  thickness: 0,
                  color: Theme.of(context).canvasColor,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: page(),
              ),
            ],
          ),
        ),
        desktop: Row(
          children: [
            mDrawer(),
            Expanded(
              child: image(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                height: 0,
                thickness: 0,
                color: Theme.of(context).canvasColor,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: page(),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomIndicator extends StatelessWidget {
  final int length;
  final int pos;

  const BottomIndicator({Key? key, required this.length, required this.pos}) : super(key: key);

  //TODO: Nested items or single container
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        length,
        (index) => Flexible(
          flex: index == pos ? 2 : 1,
          child: AnimatedContainer(
            color: index == pos ? Theme.of(context).primaryColor : AppColors.colorGreyExtraLight,
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
      getTranslate(APPStrings.textWelcomeNote)!,
      style: Responsive.isDesktop(context)
          ? getTextStyle(
              Theme.of(context).primaryTextTheme.headline3!, Dimens.margin25, FontWeight.w600)
          : getTextStyle(
              Theme.of(context).primaryTextTheme.headline1!, Dimens.margin25, FontWeight.w600),
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
          getTranslate(APPStrings.textWelcomeNote)!,
          style: getTextStyle(
              Theme.of(context).primaryTextTheme.headline1!, Dimens.margin25, FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
          child: Text(
            getTranslate(APPStrings.textWelcomeNoteDesc)!,
            style: getTextStyle(
                Theme.of(context).primaryTextTheme.headline1!, Dimens.margin20, FontWeight.w600),
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
          getTranslate(APPStrings.textWelcomeNote)!,
          style: getTextStyle(
              Theme.of(context).primaryTextTheme.headline1!, Dimens.margin25, FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
          child: Text(
            getTranslate(APPStrings.textWelcomeNoteDesc)!,
            style: getTextStyle(
                Theme.of(context).primaryTextTheme.headline1!, Dimens.margin20, FontWeight.w600),
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
          getTranslate(APPStrings.textWelcomeNote)!,
          style: getTextStyle(
              Theme.of(context).primaryTextTheme.headline1!, Dimens.margin25, FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
          child: Text(
            getTranslate(APPStrings.textWelcomeNoteDesc)!,
            style: getTextStyle(
                Theme.of(context).primaryTextTheme.headline1!, Dimens.margin20, FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
