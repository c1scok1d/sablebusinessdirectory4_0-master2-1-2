import 'dart:async';
import 'package:businesslistingapi/constant/ps_constants.dart';
import 'package:businesslistingapi/viewobject/common/ps_value_holder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:businesslistingapi/utils/utils.dart';

class PsSharedPreferences {
  PsSharedPreferences._() {
    Utils.psPrint('init PsSharePerference $hashCode');
    futureShared = SharedPreferences.getInstance();
    futureShared.then((SharedPreferences shared) {
      this.shared = shared;
      //loadUserId('Admin');
      loadValueHolder();
    });
  }

  Future<SharedPreferences> futureShared;
  SharedPreferences shared;

// Singleton instance
  static final PsSharedPreferences _singleton = PsSharedPreferences._();

  // Singleton accessor
  static PsSharedPreferences get instance => _singleton;

  final StreamController<PsValueHolder> _valueController =
      StreamController<PsValueHolder>();
  Stream<PsValueHolder> get psValueHolder => _valueController.stream;

  Future<dynamic> loadValueHolder() async{
    final String _loginUserId = shared.getString(PsConst.VALUE_HOLDER__USER_ID);
    final String _userIdToVerify =
        shared.getString(PsConst.VALUE_HOLDER__USER_ID_TO_VERIFY);
    final String _userNameToVerify =
        shared.getString(PsConst.VALUE_HOLDER__USER_NAME_TO_VERIFY);
    final String _userEmailToVerify =
        shared.getString(PsConst.VALUE_HOLDER__USER_EMAIL_TO_VERIFY);
    final String _userPasswordToVerify =
        shared.getString(PsConst.VALUE_HOLDER__USER_PASSWORD_TO_VERIFY);
    final String _notiToken =
        shared.getString(PsConst.VALUE_HOLDER__NOTI_TOKEN);
    final bool _notiSetting =
        shared.getBool(PsConst.VALUE_HOLDER__NOTI_SETTING);
    final bool _isToShowIntroSlider = 
        shared.getBool(PsConst.VALUE_HOLDER__SHOW_INTRO_SLIDER) ?? true;
    final String _overAllTaxLabel =
        shared.getString(PsConst.VALUE_HOLDER__OVERALL_TAX_LABEL);
    final String _overAllTaxValue =
        shared.getString(PsConst.VALUE_HOLDER__OVERALL_TAX_VALUE);
    final String _shippingTaxLabel =
        shared.getString(PsConst.VALUE_HOLDER__SHIPPING_TAX_LABEL);
    final String _shippingTaxValue =
        shared.getString(PsConst.VALUE_HOLDER__SHIPPING_TAX_VALUE);
    final String _shippingId =
        shared.getString(PsConst.VALUE_HOLDER__SHIPPING_ID);
    final String _messenger = shared.getString(PsConst.VALUE_HOLDER__MESSENGER);
    final String _whatsApp = shared.getString(PsConst.VALUE_HOLDER__WHATSAPP);
    final String _phone = shared.getString(PsConst.VALUE_HOLDER__PHONE);
    final String _appInfoVersionNo =
        shared.getString(PsConst.APPINFO_PREF_VERSION_NO);
    final bool _appInfoForceUpdate =
        shared.getBool(PsConst.APPINFO_PREF_FORCE_UPDATE);
    final String _appInfoForceUpdateTitle =
        shared.getString(PsConst.APPINFO_FORCE_UPDATE_TITLE);
    final String _appInfoForceUpdateMsg =
        shared.getString(PsConst.APPINFO_FORCE_UPDATE_MSG);
    final String _startDate =
        shared.getString(PsConst.VALUE_HOLDER__START_DATE);
    final String _endDate = shared.getString(PsConst.VALUE_HOLDER__END_DATE);

    final String _paypalEnabled =
        shared.getString(PsConst.VALUE_HOLDER__PAYPAL_ENABLED);
    final String _stripeEnabled =
        shared.getString(PsConst.VALUE_HOLDER__STRIPE_ENABLED);
    final String _codEnabled =
        shared.getString(PsConst.VALUE_HOLDER__COD_ENABLED);
    final String _bankEnabled =
        shared.getString(PsConst.VALUE_HOLDER__BANK_TRANSFER_ENABLE);
    final String _publishKey =
        shared.getString(PsConst.VALUE_HOLDER__PUBLISH_KEY);

    final String _standardShippingEnable =
        shared.getString(PsConst.VALUE_HOLDER__STANDART_SHIPPING_ENABLE);
    final String _zoneShippingEnable =
        shared.getString(PsConst.VALUE_HOLDER__ZONE_SHIPPING_ENABLE);
    final String _noShippingEnable =
        shared.getString(PsConst.VALUE_HOLDER__NO_SHIPPING_ENABLE);
    final String _cityId = shared.getString(PsConst.VALUE_HOLDER__CITY_ID);
    final String _cityName = shared.getString(PsConst.VALUE_HOLDER__CITY_NAME);
    final String _cityLat = shared.getString(PsConst.VALUE_HOLDER__CITY_LAT);
    final String _cityLng = shared.getString(PsConst.VALUE_HOLDER__CITY_LNG);
    final PsValueHolder _valueHolder = PsValueHolder(
      loginUserId: _loginUserId,
      userIdToVerify: _userIdToVerify,
      userNameToVerify: _userNameToVerify,
      userEmailToVerify: _userEmailToVerify,
      userPasswordToVerify: _userPasswordToVerify,
      deviceToken: _notiToken,
      notiSetting: _notiSetting,
      isToShowIntroSlider: _isToShowIntroSlider,
      overAllTaxLabel: _overAllTaxLabel,
      overAllTaxValue: _overAllTaxValue,
      shippingTaxLabel: _shippingTaxLabel,
      shippingTaxValue: _shippingTaxValue,
      messenger: _messenger,
      whatsApp: _whatsApp,
      phone: _phone,
      appInfoVersionNo: _appInfoVersionNo,
      appInfoForceUpdate: _appInfoForceUpdate,
      appInfoForceUpdateTitle: _appInfoForceUpdateTitle,
      appInfoForceUpdateMsg: _appInfoForceUpdateMsg,
      startDate: _startDate,
      endDate: _endDate,
      paypalEnabled: _paypalEnabled,
      stripeEnabled: _stripeEnabled,
      codEnabled: _codEnabled,
      bankEnabled: _bankEnabled,
      publishKey: _publishKey,
      shippingId: _shippingId,
      standardShippingEnable: _standardShippingEnable,
      zoneShippingEnable: _zoneShippingEnable,
      noShippingEnable: _noShippingEnable,
      cityId: _cityId,
      cityName: _cityName,
      cityLat: _cityLat,
      cityLng: _cityLng,
    );

    _valueController.add(_valueHolder);
  }

  Future<dynamic> replaceLoginUserId(String loginUserId) async {
    await shared.setString(PsConst.VALUE_HOLDER__USER_ID, loginUserId);

    loadValueHolder();
  }

  Future<dynamic> replaceLoginUserName(String loginUserName) async {
    await shared.setString(PsConst.VALUE_HOLDER__USER_NAME, loginUserName);

    loadValueHolder();
  }

  Future<dynamic> replaceNotiToken(String notiToken) async {
    await shared.setString(PsConst.VALUE_HOLDER__NOTI_TOKEN, notiToken);

    loadValueHolder();
  }

  Future<dynamic> replaceNotiSetting(bool notiSetting) async {
    await shared.setBool(PsConst.VALUE_HOLDER__NOTI_SETTING, notiSetting);

    loadValueHolder();
  }

  Future<dynamic> replaceIsToShowIntroSlider(bool doNotShowAgain) async {
    await shared.setBool(PsConst.VALUE_HOLDER__SHOW_INTRO_SLIDER, doNotShowAgain);

    loadValueHolder();
  }

  Future<dynamic> replaceNotiMessage(String message) async {
    await shared.setString(PsConst.VALUE_HOLDER__NOTI_MESSAGE, message);
  }

  Future<dynamic> replaceDate(String startDate, String endDate) async {
    await shared.setString(PsConst.VALUE_HOLDER__START_DATE, startDate);
    await shared.setString(PsConst.VALUE_HOLDER__END_DATE, endDate);

    loadValueHolder();
  }

  Future<dynamic> replaceVerifyUserData(
      String userIdToVerify,
      String userNameToVerify,
      String userEmailToVerify,
      String userPasswordToVerify) async {
    await shared.setString(
        PsConst.VALUE_HOLDER__USER_ID_TO_VERIFY, userIdToVerify);
    await shared.setString(
        PsConst.VALUE_HOLDER__USER_NAME_TO_VERIFY, userNameToVerify);
    await shared.setString(
        PsConst.VALUE_HOLDER__USER_EMAIL_TO_VERIFY, userEmailToVerify);
    await shared.setString(
        PsConst.VALUE_HOLDER__USER_PASSWORD_TO_VERIFY, userPasswordToVerify);

    loadValueHolder();
  }

  Future<dynamic> replaceItemLocationData(
      String cityId, String cityName, String cityLat, String cityLng) async {
    await shared.setString(PsConst.VALUE_HOLDER__CITY_ID, cityId);
    await shared.setString(PsConst.VALUE_HOLDER__CITY_NAME, cityName);
    await shared.setString(PsConst.VALUE_HOLDER__CITY_LAT, cityLat);
    await shared.setString(PsConst.VALUE_HOLDER__CITY_LNG, cityLng);

    loadValueHolder();
  }

  Future<dynamic> replaceVersionForceUpdateData(bool appInfoForceUpdate) async {
    await shared.setBool(PsConst.APPINFO_PREF_FORCE_UPDATE, appInfoForceUpdate);

    loadValueHolder();
  }

  Future<dynamic> replaceAppInfoData(
      String appInfoVersionNo,
      bool appInfoForceUpdate,
      String appInfoForceUpdateTitle,
      String appInfoForceUpdateMsg) async {
    await shared.setString(PsConst.APPINFO_PREF_VERSION_NO, appInfoVersionNo);
    await shared.setBool(PsConst.APPINFO_PREF_FORCE_UPDATE, appInfoForceUpdate);
    await shared.setString(
        PsConst.APPINFO_FORCE_UPDATE_TITLE, appInfoForceUpdateTitle);
    await shared.setString(
        PsConst.APPINFO_FORCE_UPDATE_MSG, appInfoForceUpdateMsg);

    loadValueHolder();
  }

  // Future<dynamic> replaceShopInfoValueHolderData(
  //   String overAllTaxLabel,
  //   String overAllTaxValue,
  //   String shippingTaxLabel,
  //   String shippingTaxValue,
  //   String shippingId,
  //   String cityId,
  //   String messenger,
  //   String whatsapp,
  //   String phone,
  // ) async {
  //   await shared.setString(
  //       PsConst.VALUE_HOLDER__OVERALL_TAX_LABEL, overAllTaxLabel);
  //   await shared.setString(
  //       PsConst.VALUE_HOLDER__OVERALL_TAX_VALUE, overAllTaxValue);
  //   await shared.setString(
  //       PsConst.VALUE_HOLDER__SHIPPING_TAX_LABEL, shippingTaxLabel);
  //   await shared.setString(
  //       PsConst.VALUE_HOLDER__SHIPPING_TAX_VALUE, shippingTaxValue);
  //   await shared.setString(PsConst.VALUE_HOLDER__SHIPPING_ID, shippingId);
  //   await shared.setString(PsConst.VALUE_HOLDER__SHOP_ID, cityId);
  //   await shared.setString(PsConst.VALUE_HOLDER__MESSENGER, messenger);
  //   await shared.setString(PsConst.VALUE_HOLDER__WHATSAPP, whatsapp);
  //   await shared.setString(PsConst.VALUE_HOLDER__PHONE, phone);

  //   loadValueHolder();
  // }

  Future<dynamic> replaceCheckoutEnable(
      String paypalEnabled,
      String stripeEnabled,
      String codEnabled,
      String bankEnabled,
      String standardShippingEnable,
      String zoneShippingEnable,
      String noShippingEnable) async {
    await shared.setString(PsConst.VALUE_HOLDER__PAYPAL_ENABLED, paypalEnabled);
    await shared.setString(PsConst.VALUE_HOLDER__STRIPE_ENABLED, stripeEnabled);
    await shared.setString(PsConst.VALUE_HOLDER__COD_ENABLED, codEnabled);
    await shared.setString(
        PsConst.VALUE_HOLDER__BANK_TRANSFER_ENABLE, bankEnabled);
    await shared.setString(
        PsConst.VALUE_HOLDER__STANDART_SHIPPING_ENABLE, standardShippingEnable ?? '');
    await shared.setString(
        PsConst.VALUE_HOLDER__ZONE_SHIPPING_ENABLE, zoneShippingEnable ?? '');
    await shared.setString(
        PsConst.VALUE_HOLDER__NO_SHIPPING_ENABLE, noShippingEnable ?? '');

    loadValueHolder();
  }

  Future<dynamic> replacePublishKey(String pubKey) async {
    await shared.setString(PsConst.VALUE_HOLDER__PUBLISH_KEY, pubKey);

    loadValueHolder();
  }


}
