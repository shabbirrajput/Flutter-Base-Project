import 'package:flutterbase/modules/auth/model/model_country_list.dart';
import 'package:flutterbase/modules/core/utils/common_import.dart';

class RowCountry extends StatefulWidget {
  final int? mIndex;
  final Function(CountryList)? onPress;

  const RowCountry({Key? key, this.mIndex, this.onPress}) : super(key: key);

  @override
  RowCountryState createState() => RowCountryState();
}

class RowCountryState extends State<RowCountry> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (widget.mIndex! % 2 == 0) {
              CountryList mCountryList = CountryList();
              mCountryList.countryCode = '567';
              mCountryList.countryFlag =
                  'https://cdn.ip2location.com/assets/img/flags/re.png';
              mCountryList.countryName = 'Saudi Arabia';
              widget.onPress!(mCountryList);
            } else {
              CountryList mCountryList = CountryList();
              mCountryList.countryCode = '987';
              mCountryList.countryFlag =
                  'https://cdn.ip2location.com/assets/img/flags/qa.png';
              mCountryList.countryName = 'Qatar';
              widget.onPress!(mCountryList);
            }
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.only(
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
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimens.margin4))),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    widget.mIndex! % 2 == 0 ? 'Saudi Arabia' : 'Qatar',
                    style: getTextStyle(
                        Theme.of(context).primaryTextTheme.headline1!,
                        Dimens.margin16,
                        FontWeight.w600),
                  ),
                ),
                SizedBox(
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
          margin: const EdgeInsets.only(
              left: Dimens.margin48, right: Dimens.margin18),
          color: AppColors.colorGreyExtraLight,
        )
      ],
    );
  }
}
