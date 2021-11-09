import 'package:flutterbase/utils/common_import.dart';

class AppFont {
  static final regular = GoogleFonts.roboto(
      fontWeight: FontWeight.w400, color: AppColors.colorBlack);
  static final bold = GoogleFonts.roboto(
      fontWeight: FontWeight.w700, color: AppColors.colorBlack);
  static final semiBold = GoogleFonts.roboto(
      fontWeight: FontWeight.w600, color: AppColors.colorBlack);
  static final mediumBold = GoogleFonts.roboto(
      fontWeight: FontWeight.w500, color: AppColors.colorBlack);

  //-------REGULAR-------------
  //colorGray4
  static final regularBlack = regular.copyWith(color: AppColors.colorBlack);
  static final regularBlack_10 =
      regularBlack.copyWith(fontSize: Dimens.textSize10);
  static final regularBlack_14 =
      regularBlack.copyWith(fontSize: Dimens.textSize14);
  static final regularBlack_20 =
  regularBlack.copyWith(fontSize: Dimens.textSize20);

  //colorWhite-------
  static final colorWhite = bold.copyWith(color: AppColors.colorWhite);
  static final colorWhite_14 =
  colorWhite.copyWith(fontSize: Dimens.textSize14);

  //-------BOLD-------------
  //colorBlack-------

  static final boldBlack = bold.copyWith(color: AppColors.colorBlack);
  static final boldBlack_10 = boldBlack.copyWith(fontSize: Dimens.textSize10);
  static final boldBlack_12 = boldBlack.copyWith(fontSize: Dimens.textSize12);
  static final boldBlack_25 = boldBlack.copyWith(fontSize: Dimens.textSize25);


  static final boldBlack54 = bold.copyWith(color: AppColors.colorBlack54);
  static final boldBlack54_14 = boldBlack54.copyWith(fontSize: Dimens.textSize14);
  //-------mediumBold-------------

  //colorBlack-------
  static final mediumBoldBlack = mediumBold.copyWith(color: AppColors.colorBlack);
  static final mediumBoldBlack_10 = mediumBoldBlack.copyWith(fontSize: Dimens.textSize10);
  static final mediumBoldBlack_20 = mediumBoldBlack.copyWith(fontSize: Dimens.textSize20);
  static final mediumBoldBlack_25 = mediumBoldBlack.copyWith(fontSize: Dimens.textSize25);

  //colorWhite-------
  static final mediumBoldWhite = mediumBold.copyWith(color: AppColors.colorWhite);
  static final mediumBoldWhite_20 = mediumBoldWhite.copyWith(fontSize: Dimens.textSize20);


  //-------semiBold-------------

  //colorBlack-------
  static final semiBoldBlack1 = semiBold.copyWith(color: AppColors.colorBlack1);
  static final semiBoldBlack1_16 =
  semiBoldBlack1.copyWith(fontSize: Dimens.textSize16);
}
