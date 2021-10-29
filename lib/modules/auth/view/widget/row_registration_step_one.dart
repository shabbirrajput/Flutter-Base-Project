import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lazzypay/utils/common/widgets/button.dart';
import 'package:lazzypay/utils/common/widgets/custom_switch.dart';
import 'package:lazzypay/utils/common/widgets/show_cupertino_date_picker.dart';
import 'package:lazzypay/utils/common/widgets/textfield.dart';
import 'package:lazzypay/utils/common_import.dart';
import 'package:lazzypay/utils/multi_value_listenable_builder.dart';

class RowRegistrationStepOne extends StatefulWidget {
  final Function()? onPressContinue;

  const RowRegistrationStepOne({Key? key, this.onPressContinue})
      : super(key: key);

  @override
  _RowRegistrationStepOneState createState() => _RowRegistrationStepOneState();
}

class _RowRegistrationStepOneState extends State<RowRegistrationStepOne> {
  ValueNotifier<int> selectedSectionIndex = ValueNotifier<int>(0);
  DateTime? pickedDate;
  TextEditingController dateController = TextEditingController();
  TextEditingController contryController = TextEditingController();

  @override
  void initState() {
    pickedDate = DateTime.now();
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
                    Text(
                      getTranslate(context,
                          APPStrings.text_finish_registration_simple_steps)!,
                      style: AppFont.boldBlack64_14,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      getTranslate(
                          context, APPStrings.text_step_one_basic_details)!,
                      style: AppFont.boldBlack_25,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        getTranslate(context,
                            APPStrings.text_please_fill_in_the_details_below)!,
                        style: AppFont.boldBlack64_14),
                    Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: CustomTextField(
                            obscureText: false,
                            isEnabled: true,
                            hintText: getTranslate(
                                context, APPStrings.text_first_name)!,
                            labelText: getTranslate(
                                context, APPStrings.text_first_name)!,
                            keyboardType: TextInputType.name,
                          )),
                          SizedBox(
                            width: Dimens.margin40,
                          ),
                          Expanded(
                            child: CustomTextField(
                              hintText: getTranslate(
                                  context, APPStrings.text_last_name)!,
                              labelText: getTranslate(
                                  context, APPStrings.text_last_name)!,
                              isEnabled: true,
                              keyboardType: TextInputType.name,
                              obscureText: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    CustomTextField(
                      hintText: getTranslate(context, APPStrings.text_email)!,
                      labelText: getTranslate(context, APPStrings.text_email)!,
                      isEnabled: true,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    InkWell(
                      onTap: () {
                        final now = new DateTime.now();
                        var dateTime = DateTime(now.year, now.month, now.day);
                        var selectedTime = DateTime(pickedDate!.year,
                            pickedDate!.month, pickedDate!.day);
                        showCupertinoDatePicker(context,
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: selectedTime,
                            backgroundColor: AppColors.colorBlack,
                            useText: true,
                            leftHanded: false,
                            maximumYear: DateTime.now().year,
                            minimumDate:
                                DateTime.now().subtract(Duration(days: 18250)),
                            maximumDate: dateTime,
                            onDateTimeChanged: (DateTime time) {
                          // DateTime result;
                          setDate(time);
                        });
                      },
                      child: CustomTextField(
                        hintText: getTranslate(
                            context, APPStrings.text_date_of_birth)!,
                        labelText: getTranslate(
                            context, APPStrings.text_date_of_birth)!,
                        isEnabled: false,
                        controller: dateController,
                        keyboardType: TextInputType.datetime,
                        obscureText: false,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: Dimens.margin38, bottom: Dimens.margin36),
                      child: Row(
                        children: [
                          Text(
                            getTranslate(context, APPStrings.text_male)!,
                            style: AppFont.boldBlack54_14,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: Dimens.margin16),
                            child: CustomSwitch(
                              activeColor: AppColors.colorPrimary,
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                  //status = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            getTranslate(context, APPStrings.text_female)!,
                            style: AppFont.boldBlack54_14,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        var result = await Navigator.of(context)
                            .pushNamed(AppRoutes.routes_country_selection);
                        if (result != null) {
                          contryController.text = result.toString();
                          setState(() {});
                        }
                      },
                      child: CustomTextField(
                        obscureText: false,
                        controller: contryController,
                        hintText:
                            getTranslate(context, APPStrings.text_nationality)!,
                        labelText:
                            getTranslate(context, APPStrings.text_nationality)!,
                        isEnabled: false,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(
                      height: Dimens.margin40,
                    ),
                    Text(
                      getTranslate(context, APPStrings.text_national_id_card)!,
                      style: AppFont.boldBlack_25,
                    ),
                    SizedBox(
                      height: Dimens.margin19,
                    ),
                    Text(
                      getTranslate(context, APPStrings.text_enter_national_id)!,
                      style: AppFont.boldBlack64_14,
                    ),
                    SizedBox(
                      height: Dimens.margin54,
                    ),
                    CustomTextField(
                      obscureText: false,
                      hintText: getTranslate(context, APPStrings.text_national_id_number)!,
                      labelText: getTranslate(
                          context, APPStrings.text_national_id_number)!,
                      isEnabled: true,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: Dimens.margin57,
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

  setDate(DateTime date) {
    if (date != null)
      setState(() {
        pickedDate = date;
        var newFormatter = new DateFormat('MMM - dd - yyyy');
        String newFormatted = newFormatter.format(pickedDate!);
        dateController.text = newFormatted;
      });
  }
}
