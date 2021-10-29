

import 'package:flutterbase/modules/auth/model/model_country_list.dart';
import 'package:flutterbase/utils/common_import.dart';

class RowCountry extends StatefulWidget {
  final int? mIndex;
  final Function(CountryList)? onPress;

  const RowCountry({Key? key, this.mIndex, this.onPress}) : super(key: key);

  @override
  _RowCountryState createState() => _RowCountryState();
}

class _RowCountryState extends State<RowCountry> {
  @override
  Widget build(BuildContext context) {
    return  Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  if (widget.mIndex! % 2 == 0) {
                    CountryList mCountryList = new CountryList();
                    mCountryList.countryCode = "567";
                    mCountryList.countryFlag =
                        "https://cdn.ip2location.com/assets/img/flags/re.png";
                    mCountryList.countryName = "Saudi Arabia";
                    widget.onPress!(mCountryList);
                  } else {
                    CountryList mCountryList = new CountryList();
                    mCountryList.countryCode = "987";
                    mCountryList.countryFlag =
                        "https://cdn.ip2location.com/assets/img/flags/qa.png";
                    mCountryList.countryName = "Qatar";
                    widget.onPress!(mCountryList);
                  }
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimens.margin17,
                      bottom: Dimens.margin17,
                      left: Dimens.margin20,
                      right: Dimens.margin20),
                  child: Row(
                    children: [
                      Container(
                        height: Dimens.margin8,
                        width: Dimens.margin8,
                        decoration: BoxDecoration(
                            color: AppColors.colorGreyLight,
                            border: Border.all(
                              color: AppColors.colorGreyLight,
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimens.margin4))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          widget.mIndex! % 2 == 0 ? "Saudi Arabia" : "Qatar",
                          style: AppFont.semiBoldBlack1_16,
                        ),
                      ),
                      Container(
                        height: Dimens.margin20,
                        width: Dimens.margin35,
                        child: Image.network(
                          widget.mIndex! % 2 == 0
                              ? 'https://cdn.ip2location.com/assets/img/flags/re.png'
                              : 'https://cdn.ip2location.com/assets/img/flags/qa.png',
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                margin: EdgeInsets.only(
                    left: Dimens.margin48, right: Dimens.margin18),
                color: AppColors.colorGreyExtraLight,
              )
            ],
          ),
        );
  }
}
