import 'package:flutterbase/modules/auth/model/model_country_list.dart';
import 'package:flutterbase/modules/auth/view/widget/row_country.dart';
import 'package:flutterbase/modules/core/utils/common_import.dart';
import '../bloc/auth_bloc.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  ScreenLoginState createState() => ScreenLoginState();
}

class ScreenLoginState extends State<ScreenLogin> {
  ValueNotifier<CountryList> selectedSectionIndex =
      ValueNotifier<CountryList>(CountryList());
  ValueNotifier<bool> mLoading = ValueNotifier<bool>(false);
  TextEditingController countryController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  ///[loginEvent] this method is used to connect to login api
  loginEvent() async {
    if (await checkConnectivity()) {
      Map<String, dynamic> mBody = {
        AppConfig.paramEmail: 'test@gmail.com',
        AppConfig.paramPassword: '123456'
      };
      BlocProvider.of<AuthBloc>(context).add(AuthUser(body: mBody, url: ''));
    } else {
      ToastController.showToast(
          ValidationString.validationNoInternetFound, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiValueListenableBuilder(
        valueListenables: [selectedSectionIndex, mLoading],
        builder: (BuildContext context, values, Widget? child) {
          return SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: mLoading.value,
              color: Colors.transparent,
              progressIndicator: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                  backgroundColor: Colors.transparent),
              child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    mLoading.value = true;
                  } else {
                    mLoading.value = false;
                  }
                  if (state is AuthResponse) {
                    // TODO New Screen
                  }
                  if (state is AuthFailure) {
                    ToastController.showToast(state.mError, false);
                  }
                },
                child: Scaffold(
                  backgroundColor: Theme.of(context).backgroundColor,
                  appBar: AppBar(
                    elevation: 0,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: Theme.of(context).cardColor),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    backgroundColor: Theme.of(context).backgroundColor,
                  ),
                  bottomNavigationBar: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    margin: const EdgeInsets.only(bottom: 30.0),
                    child: Text.rich(
                      TextSpan(
                          text: getTranslate(
                              APPStrings.textTermAndConditionDesc)!,
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).canvasColor,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: getTranslate(
                                  APPStrings.textTermAndCondition)!,
                              style: const TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                            TextSpan(
                              text: getTranslate(APPStrings.textAnd)!,
                              style: const TextStyle(
                                  decoration: TextDecoration.none),
                            ),
                            TextSpan(
                                text:
                                    getTranslate(APPStrings.textPrivacyPolicy)!,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline)),
                          ]),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: Dimens.margin48),
                          child: Image.asset(
                            APPImages.icPlaceholder,
                            height: Dimens.margin150,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.margin48, top: Dimens.margin10),
                          child: Text(
                            getTranslate(APPStrings.textWelcomeNote)!,
                            style: getTextStyle(
                                Theme.of(context).primaryTextTheme.headline1!,
                                Dimens.margin24,
                                FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: Dimens.margin105),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimens.margin30,
                              vertical: Dimens.margin15),
                          child: InkWell(
                            onTap: () {
                              showAlertDialog(context);
                            },
                            child: CustomTextFieldImage(
                              obscureText: false,
                              hintText:
                                  getTranslate(APPStrings.textSelectCountry)!,
                              labelText:
                                  getTranslate(APPStrings.textSelectCountry)!,
                              isEnabled: false,
                              image:
                                  selectedSectionIndex.value.countryFlag != null
                                      ? selectedSectionIndex.value.countryFlag
                                          .toString()
                                      : '',
                              controller: countryController,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  showAlertDialog(context);
                                },
                                child: Container(
                                  height: Dimens.margin50,
                                  width: Dimens.margin70,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.fromLTRB(
                                      Dimens.margin30,
                                      Dimens.margin15,
                                      Dimens.margin15,
                                      Dimens.margin15),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.margin4),
                                    border: Border.all(
                                        color: Theme.of(context).canvasColor),
                                  ),
                                  child: Text(
                                      selectedSectionIndex.value.countryCode !=
                                              null
                                          ? selectedSectionIndex
                                              .value.countryCode
                                              .toString()
                                          : '',
                                      style: getTextStyle(
                                          Theme.of(context)
                                              .primaryTextTheme
                                              .headline1!,
                                          Dimens.margin24,
                                          FontWeight.w600)),
                                )),
                            Flexible(
                              child: CustomTextField(
                                obscureText: false,
                                hintText: getTranslate(
                                    APPStrings.textEnterMobileNumber)!,
                                labelText: getTranslate(
                                    APPStrings.textEnterMobileNumber)!,
                                isEnabled: true,
                                controller: mobileNumberController,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: Dimens.margin30),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimens.margin30),
                          child: GestureDetector(
                            onTap: () {
                              loginValidation();
                            },
                            child: CustomButton(
                              buttonText:
                                  getTranslate(APPStrings.textContinue)!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  showAlertDialog(BuildContext context) {
    final rootContext =
        context.findRootAncestorStateOfType<NavigatorState>()!.context;
    showDialog(
        context: rootContext,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: Dimens.margin340,
              padding: const EdgeInsets.only(top: Dimens.margin5),
              width: MediaQuery.of(context).size.width - Dimens.margin30,
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return RowCountry(
                        mIndex: index,
                        onPress: (selectedCountry) {
                          countryController.text = selectedCountry.countryName!;
                          selectedSectionIndex.value = selectedCountry;
                          setState(() {});
                          Navigator.pop(context);
                        });
                  }),
            ),
          );
        });
  }

  void loginValidation() async {
    String mNumber = mobileNumberController.text.toString().trim();
    if (countryController.text.toString().isEmpty) {
      ToastController.showToast(
          getTranslate(APPStrings.textSelectCountry)!, false);
      return;
    } else if (mNumber.isEmpty) {
      ToastController.showToast(
          getTranslate(ValidationString.validationMobileEmpty)!, false);
      return;
    } else if (!validatePhone(mNumber)) {
      ToastController.showToast(
          getTranslate(ValidationString.validationMobileValid)!, false);
      return;
    } else {
      loginEvent();
    }
  }
}
