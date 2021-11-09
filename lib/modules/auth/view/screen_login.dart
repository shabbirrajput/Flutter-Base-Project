import 'package:flutterbase/modules/auth/bloc/login_bloc.dart';
import 'package:flutterbase/modules/auth/model/model_country_list.dart';
import 'package:flutterbase/modules/auth/view/widget/row_country.dart';
import 'package:flutterbase/utils/common_import.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  ValueNotifier<CountryList> selectedSectionIndex =
      ValueNotifier<CountryList>(CountryList());
  ValueNotifier<bool> mLoading = ValueNotifier<bool>(false);
  TextEditingController countryController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  loginEvent(var mMobile) async {
    if (await checkConnectivity()) {
      Map<String, dynamic> mBody = {
        AppConfig.paramEmail: 'test@gmail.com',
        AppConfig.paramPassword: '123456'
      };
      BlocProvider.of<LoginBloc>(context).add(UserLogin(body: mBody));
    } else {
      ToastController.showToast(
          getTranslate(context, APPStrings.notConnectedInternet)!);
    }
  }


  @override
  Widget build(BuildContext context) {
    return MultiValueListenableBuider(
        valueListenables: [selectedSectionIndex, mLoading],
        builder: (BuildContext context, values, Widget? child) {
          return SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: mLoading.value,
              color: Colors.transparent,
              progressIndicator: const CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.colorPrimary),
                  backgroundColor: Colors.transparent),
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoading) {
                    mLoading.value = true;
                  } else {
                    mLoading.value = false;
                  }
                  if (state is LoginLoadSuccess) {
                    // TODO New Screen
                  }
                  if (state is LoginFailure) {
                    ToastController.showToast(state.mError);
                  }
                },
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  bottomNavigationBar: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    margin: const EdgeInsets.only(bottom: 30.0),
                    child: Text.rich(
                      TextSpan(
                          text: getTranslate(
                              context, APPStrings.textTermAndConditionDesc)!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.colorGreyLight1,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: getTranslate(
                                  context, APPStrings.textTermAndCondition)!,
                              style: const TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                            TextSpan(
                              text: getTranslate(context, APPStrings.textAnd)!,
                              style: const TextStyle(decoration: TextDecoration.none),
                            ),
                            TextSpan(
                                text: getTranslate(
                                    context, APPStrings.textPrivacyPolicy)!,
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
                            getTranslate(context, APPStrings.textWelcomeNote)!,
                            style: AppFont.boldBlack_25,
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
                              hintText: getTranslate(
                                  context, APPStrings.textSelectCountry)!,
                              labelText: getTranslate(
                                  context, APPStrings.textSelectCountry)!,
                              isEnabled: false,
                              image: selectedSectionIndex.value.countryFlag !=
                                          null
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
                                    border:
                                        Border.all(color: AppColors.colorGrey),
                                  ),
                                  child: Text(
                                      selectedSectionIndex
                                                      .value.countryCode !=
                                                  null
                                          ? selectedSectionIndex
                                              .value.countryCode
                                              .toString()
                                          : '',
                                      style: AppFont.semiBoldBlack1_16),
                                )),
                            Flexible(
                              child: CustomTextField(
                                obscureText: false,
                                hintText: getTranslate(
                                    context, APPStrings.textEnterMobileNumber)!,
                                labelText: getTranslate(
                                    context, APPStrings.textEnterMobileNumber)!,
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
                              buttonText: getTranslate(
                                  context, APPStrings.textContinue)!,
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
          getTranslate(context, APPStrings.textSelectCountry)!);
      return;
    } else if (mNumber.isEmpty) {
      ToastController.showToast(
          getTranslate(context, ValidationString.validationMobileEmpty)!);
      return;
    } else if (!validatePhone(mNumber)) {
      ToastController.showToast(
          getTranslate(context, ValidationString.validationMobileValid)!);
      return;
    } else {
      loginEvent(mNumber);
    }
  }
}
