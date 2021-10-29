import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazzypay/utils/common/widgets/button.dart';
import 'package:lazzypay/utils/common/widgets/textfield.dart';
import 'package:lazzypay/utils/common_import.dart';
import 'package:lazzypay/utils/multi_value_listenable_builder.dart';
import 'package:lazzypay/widgets/textfield_with_file.dart';

class UserBioStepTwo extends StatefulWidget {
  final Function()? onPressContinue;

  const UserBioStepTwo({Key? key, this.onPressContinue}) : super(key: key);

  @override
  _UserBioStepTwoState createState() => _UserBioStepTwoState();
}

class _UserBioStepTwoState extends State<UserBioStepTwo> {
  ValueNotifier<int> selectedFile1 = ValueNotifier<int>(0);
  ValueNotifier<int> selectedFile2 = ValueNotifier<int>(0);
  ValueNotifier<int> selectedFile3 = ValueNotifier<int>(0);
  TextEditingController contryController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiValueListenableBuider(
        valueListenables: [selectedFile1, selectedFile2, selectedFile3],
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
                      getTranslate(
                          context, APPStrings.text_step_two_national_id)!,
                      style: AppFont.boldBlack_25,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        getTranslate(context,
                            APPStrings.text_please_fill_details_below)!,
                        style: AppFont.boldBlack64_14),
                    SizedBox(
                      height: Dimens.margin68,
                    ),
                    Text(
                      getTranslate(context,
                          APPStrings.text_upload_front_and_back_side_images)!,
                      style: AppFont.boldBlack64_14,
                    ),
                    SizedBox(
                      height: Dimens.margin38,
                    ),
                    InkWell(
                      onTap: () {
                        modalSheetUploadAction(2, 1);
                      },
                      child: selectedFile1.value == 0
                          ? CustomTextField(
                              obscureText: false,
                              hintText: getTranslate(context,
                                  APPStrings.text_click_to_upload_front_side)!,
                              labelText: getTranslate(context,
                                  APPStrings.text_click_to_upload_front_side)!,
                              isEnabled: false,
                              keyboardType: TextInputType.name,
                            )
                          : CustomTextFieldFile(
                              obscureText: false,
                              hintText: getTranslate(
                                  context, APPStrings.text_file_uploaded)!,
                              labelText: getTranslate(
                                  context, APPStrings.text_file_uploaded)!,
                              isEnabled: false,
                              keyboardType: TextInputType.name,
                            ),
                    ),
                    SizedBox(
                      height: Dimens.margin21,
                    ),
                    InkWell(
                        onTap: () {
                          modalSheetUploadAction(2, 2);
                        },
                        child: selectedFile2.value == 0
                            ? CustomTextField(
                                obscureText: false,
                                hintText: getTranslate(
                                    context,
                                    APPStrings
                                        .text_click_to_upload_front_side)!,
                                labelText: getTranslate(
                                    context,
                                    APPStrings
                                        .text_click_to_upload_front_side)!,
                                isEnabled: false,
                                keyboardType: TextInputType.name,
                              )
                            : CustomTextFieldFile(
                                obscureText: false,
                                hintText: getTranslate(
                                    context, APPStrings.text_file_uploaded)!,
                                labelText: getTranslate(
                                    context, APPStrings.text_file_uploaded)!,
                                isEnabled: false,
                                keyboardType: TextInputType.name,
                              )),
                    SizedBox(
                      height: Dimens.margin62,
                    ),
                    Text(
                      getTranslate(context, APPStrings.text_upload_a_selfie)!,
                      style: AppFont.boldBlack64_14,
                    ),
                    SizedBox(
                      height: Dimens.margin25,
                    ),
                    InkWell(
                        onTap: () {
                          modalSheetUploadAction(1, 3);
                        },
                        child: selectedFile3.value == 0
                            ? CustomTextField(
                                obscureText: false,
                                hintText: getTranslate(context,
                                    APPStrings.text_click_to_take_a_selfie)!,
                                labelText: getTranslate(context,
                                    APPStrings.text_click_to_take_a_selfie)!,
                                isEnabled: false,
                                keyboardType: TextInputType.name,
                              )
                            : CustomTextFieldFile(
                                obscureText: false,
                                hintText: getTranslate(
                                    context, APPStrings.text_file_uploaded)!,
                                labelText: getTranslate(
                                    context, APPStrings.text_file_uploaded)!,
                                isEnabled: false,
                                keyboardType: TextInputType.name,
                              )),
                    SizedBox(
                      height: Dimens.margin62,
                    ),
                    Text(
                      getTranslate(context, APPStrings.text_address)!,
                      style: AppFont.boldBlack64_14,
                    ),
                    SizedBox(
                      height: Dimens.margin25,
                    ),
                    Container(
                      height: Dimens.margin126,
                      child: TextField(
                          style: AppFont.semiBoldBlack1_16,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          expands: true,
                          decoration: InputDecoration(
                            hintText:
                                getTranslate(context, APPStrings.text_address)!,
                            labelStyle: AppFont.boldBlack54_14,
                            hintStyle: AppFont.boldBlack54_14,
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.colorGrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.colorGrey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.colorGrey),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.colorGrey),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: Dimens.margin45,
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

  void modalSheetUploadAction(int status, int index) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(Dimens.margin10),
                topRight: const Radius.circular(Dimens.margin10))),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return Container(
              height: Dimens.margin202,
              decoration: new BoxDecoration(
                  color: AppColors.colorPink1,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(Dimens.margin10),
                      topRight: const Radius.circular(Dimens.margin10))),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                color: AppColors.colorBlack2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: status == 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            left: Dimens.margin24, top: Dimens.margin20),
                        child: Text(
                          getTranslate(
                              context, APPStrings.text_select_an_option)!,
                          style: GoogleFonts.roboto(
                            textStyle: AppFont.semiBoldWhite_16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: status == 2 ? Dimens.margin20 : Dimens.margin40,
                    ),
                    Visibility(
                      visible: status == 1,
                      child: InkWell(
                        onTap: () {
                          if (index == 1) {
                            selectedFile1.value = 1;
                          } else if (index == 2) {
                            selectedFile2.value = 1;
                          } else {
                            selectedFile3.value = 1;
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: Dimens.margin76,
                            width: Dimens.margin170,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Dimens.margin8)),
                                color: AppColors.colorBlack3),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Dimens.margin40,
                                    height: Dimens.margin40,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      APPImages.ic_camera,
                                      height: Dimens.margin40,
                                      width: Dimens.margin40,
                                    ),
                                  ),
                                  Text(
                                    getTranslate(
                                        context, APPStrings.text_camera)!,
                                    style: GoogleFonts.roboto(
                                      textStyle: AppFont.semiBoldWhite56_13,
                                      decoration: TextDecoration.none,
                                    ),
                                  )
                                ])),
                      ),
                    ),
                    Visibility(
                      visible: status == 2,
                      child: Row(
                        children: [
                          SizedBox(
                            width: Dimens.margin24,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (index == 1) {
                                  selectedFile1.value = 1;
                                } else if (index == 2) {
                                  selectedFile2.value = 1;
                                } else {
                                  selectedFile3.value = 1;
                                }
                                Navigator.pop(context);
                              },
                              child: Container(
                                  height: Dimens.margin76,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Dimens.margin8)),
                                      color: AppColors.colorBlack3),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: Dimens.margin40,
                                          height: Dimens.margin40,
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            APPImages.ic_camera,
                                            height: Dimens.margin40,
                                            width: Dimens.margin40,
                                          ),
                                        ),
                                        Text(
                                          getTranslate(
                                              context, APPStrings.text_camera)!,
                                          style: GoogleFonts.roboto(
                                            textStyle:
                                                AppFont.semiBoldWhite56_13,
                                            decoration: TextDecoration.none,
                                          ),
                                        )
                                      ])),
                            ),
                          ),
                          SizedBox(
                            width: Dimens.margin39,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (index == 1) {
                                  selectedFile1.value = 1;
                                } else if (index == 2) {
                                  selectedFile2.value = 1;
                                } else {
                                  selectedFile3.value = 1;
                                }
                                Navigator.pop(context);
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: Dimens.margin76,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Dimens.margin8)),
                                      color: AppColors.colorBlack3),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: Dimens.margin40,
                                          height: Dimens.margin40,
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            APPImages.ic_gallery,
                                            height: Dimens.margin40,
                                            width: Dimens.margin40,
                                          ),
                                        ),
                                        Text(
                                          getTranslate(
                                              context,
                                              APPStrings
                                                  .text_upload_from_gallery)!,
                                          style: GoogleFonts.roboto(
                                            textStyle:
                                                AppFont.semiBoldWhite56_13,
                                            decoration: TextDecoration.none,
                                          ),
                                        )
                                      ])),
                            ),
                          ),
                          SizedBox(
                            width: Dimens.margin24,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
