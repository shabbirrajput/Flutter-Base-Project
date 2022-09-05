import 'package:flutterbase/modules/core/utils/common_import.dart';

///[BaseTextFieldErrorIndicator] This class is use to Base TextField Error Indicator
class BaseTextFieldErrorIndicator extends StatelessWidget {
  final String? errorText;

  const BaseTextFieldErrorIndicator({Key? key, this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.info_outline_rounded,
          color: Colors.red,
        ),
        const SizedBox(
          width: Dimens.margin10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: (errorText != null && errorText != '') ? Dimens.margin2 : Dimens.margin0,
              ),
              Text(
                errorText ?? '',
                style: getTextStyle(Theme.of(context).primaryTextTheme.headline1!,
                    Dimens.textSize12, FontWeight.w300),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
