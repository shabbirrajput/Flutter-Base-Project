import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazzypay/utils/common/widgets/button.dart';
import 'package:lazzypay/utils/common_import.dart';
import 'package:lazzypay/utils/multi_value_listenable_builder.dart';
import 'package:lazzypay/widgets/textfield_card.dart';

class UserBioStepThree extends StatefulWidget {
  final Function()? onPressContinue;

  const UserBioStepThree({Key? key, this.onPressContinue}) : super(key: key);

  @override
  _UserBioStepThreeState createState() => _UserBioStepThreeState();
}

class _UserBioStepThreeState extends State<UserBioStepThree> {
  ValueNotifier<int> selectedSectionIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiValueListenableBuider(
        valueListenables: [selectedSectionIndex],
        builder: (BuildContext context, values, Widget? child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      getTranslate(context, APPStrings.text_connect_your_card)!,
                      style: AppFont.boldBlack_25,
                    ),
                    const SizedBox(
                      height: Dimens.margin45,
                    ),
                    Text(
                        getTranslate(
                            context,
                            APPStrings
                                .text_enter_your_debit_credit_card_details)!,
                        style: AppFont.boldBlack64_14),
                    SizedBox(
                      height: Dimens.margin30,
                    ),
                    Text(
                      getTranslate(context, APPStrings.text_accepted_cards)!,
                      style: AppFont.boldBlack64_14,
                    ),
                    SizedBox(
                      height: Dimens.margin13,
                    ),
                    Container(
                      child: Image.asset(
                        APPImages.ic_cart_list,
                        height: Dimens.margin28,
                      ),
                    ),
                    SizedBox(
                      height: Dimens.margin38,
                    ),
                    CustomTextFieldCard(
                      obscureText: false,
                      hintText:
                          getTranslate(context, APPStrings.text_card_number)!,
                      labelText:
                          getTranslate(context, APPStrings.text_card_number)!,
                      isEnabled: true,
                      inputFormattersType: 0,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: Dimens.margin33,
                    ),
                    Row(
                      children: [
                        Container(
                          width: Dimens.margin113,
                          child: CustomTextFieldCard(
                            obscureText: false,
                            hintText:
                                getTranslate(context, APPStrings.text_ex_date)!,
                            labelText:
                                getTranslate(context, APPStrings.text_ex_date)!,
                            isEnabled: true,
                            inputFormattersType: 1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: Dimens.margin28,
                        ),
                        Container(
                          width: Dimens.margin113,
                          child: CustomTextFieldCard(
                            obscureText: false,
                            hintText:
                                getTranslate(context, APPStrings.text_cvv)!,
                            labelText:
                                getTranslate(context, APPStrings.text_cvv)!,
                            isEnabled: true,
                            inputFormattersType: 2,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimens.margin62,
                    ),
                    Text(
                      getTranslate(context, APPStrings.text_amount_equivalent)!,
                      style: AppFont.boldBlack64_14,
                    ),
                    SizedBox(
                      height: Dimens.margin44,
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.onPressContinue!();
                      },
                      child: CustomButton(
                        buttontext:
                            getTranslate(context, APPStrings.text_continue)!,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
