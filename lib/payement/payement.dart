/* // ignore_for_file: must_be_immutable

import 'dart:convert';


import 'package:connectivity/connectivity.dart';

import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

const double _bottomPaddingForButton = 150.0;
const double _buttonHeight = 56.0;
const double _buttonWidth = 200.0;
const double _pagePadding = 16.0;
const double _pageBreakpoint = 768.0;
const double _heroImageHeight = 250.0;
const Color _lightThemeShadowColor = Color(0xFFE4E4E4);
const Color _darkThemeShadowColor = Color(0xFF121212);
const Color _darkSabGradientColor = Color(0xFF313236);
//MARGIN
const double spacingControl = 4.0;
const double spacingStandard = 8.0;
const double spacingContainer = 16.0;
const double spacingLarge = 32.0;
const double buttonHeight = 60.0;
const double spacingControlHalf = 4.0;
//FONTS
const textSizeSmall = 12.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 16.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeLarge = 2.0;
const textSizeXLarge = 30.0;
const double textRadius = 50.0;
const double editTextRadius = 6.0;
const double keyboardRadius = 40.0;
const double elevation = 6.0;
const double borderWidth = 5.0;
const double itemSpacing = 22.0;
const kTabletBreakpoint = 1024;
const kDesktopBreakPoint = 1366;

class AppColor {
  static const itemBackgroundColor = Color(0xFFD1D1D1);
}

const accentColor = Color(0xFFbb74ed);
const accentSecondary = Color(0xFF353436);
const primaryColor = Color.fromARGB(252, 181, 17, 17);
const primaryTextColor = Color(0xFF1d2a3a);
const secondaryTextColor = Color(0xFF515151);
const textBackgroundColor = Color(0xFFEDEDED);
const itemBackgroundColor = Color(0xFFD1D1D1);
const editTextBackgroundColor = Color(0xFFf5f5f5);
const editTextHintColor = Color(0xFFcbcbcb);
const btnBgTextColor = Color(0xFF707070);
const btnBgColor = Color(0xFF1d2a3a);
const backgroundColor = Colors.white;
const toastTextColor = Colors.white;
const error = Color(0xFFD9534F);
const success = Color(0xFF5CB85C);
const warning = Color(0xFFE89E35);
const info = Color(0xFF59BFDD);
final appBarStyle = GoogleFonts.quicksand(
  color: primaryColor,
  fontSize: textSizeLarge,
  fontWeight: FontWeight.bold,
);
final hintTextStyle = GoogleFonts.quicksand(
  color: Colors.grey.withOpacity(0.9),
  fontSize: textSizeSMedium,
  fontWeight: FontWeight.normal,
);
final errorTextStyle = GoogleFonts.roboto(
  color: Colors.red,
  fontSize: textSizeSmall,
  fontWeight: FontWeight.normal,
);
//Font Size Small and Color White
final smallNormalTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeSMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3);
final smallMediumTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeSMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3);
final smallBoldTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeSMedium,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3);
//Font Size Normal and Color White
final normalTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3);
final mediumTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3);
final boldTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeMedium,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3);
//Font Size Large and Color White
final normalLargeTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeLargeMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3);
final mediumLargeTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeLargeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3);
final mediumLargeTextStyle2 = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeLarge,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3);
final mediumLargeTextStylewhite = GoogleFonts.quicksand(
    color: Colors.white,
    fontSize: textSizeLargeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3);
final boldLargeTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeLargeMedium,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3);
final semiSubTitleTextStyle = GoogleFonts.quicksand(
    fontSize: textSizeSMedium,
    letterSpacing: 0.3,
    color: secondaryTextColor,
    fontWeight: FontWeight.w400); // Semi sub title with regular



class Payement extends StatelessWidget {
  TextEditingController codeaccess = TextEditingController();
  TextEditingController phone = TextEditingController(text: "");
  String phonetxt = "";
  int price;
  String sujet;

  String userphone;
  AsyncCallback callback;

  Payement(
      {Key? key,
      required this.price,
      required this.sujet,
      required this.userphone,
      required this.callback})
      : super(key: key);
  void createDialogue(BuildContext context, String code, String banner, String appId, bool isOrange) {
  try {
    WoltModalSheet.show<void>(
      pageIndexNotifier: pageIndexNotifier,
      context: context,
      pageListBuilder: (modalSheetContext) {
        final textTheme = Theme.of(context).textTheme;
        return [
          page1(modalSheetContext, textTheme, code, banner),
          page2(modalSheetContext, textTheme, code, banner, appId, isOrange),
        ];
      },
      modalTypeBuilder: (context) {
        final size = MediaQuery.of(context).size.width;
        if (size < _pageBreakpoint) {
          return WoltModalType.bottomSheet;
        } else {
          return WoltModalType.dialog;
        }
      },
     
      onModalDismissedWithBarrierTap: () {
        debugPrint('Closed modal sheet with barrier tap');
        Navigator.of(context).pop();
        pageIndexNotifier.value = 0;
      },
      maxDialogWidth: Get.width,
      minDialogWidth: 400,
      minPageHeight: 0.0,
      maxPageHeight: 0.9,
    );
  } catch (e, stackTrace) {
    // Gérer l'erreur ici
    print('Une erreur s\'est produite : $e');
    print('StackTrace : $stackTrace');
  }
}


  final pageIndexNotifier = ValueNotifier(0);
  WoltModalSheetPage page1(BuildContext modalSheetContext, TextTheme textTheme,
      String code, String banner) {
    return WoltModalSheetPage(
      backgroundColor: Colors.white,
      hasSabGradient: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            Image.asset(
              banner,
              width: 250,
            ),
            Row(
              children: [
                Text(
                  "price: ",
                  style: mediumLargeTextStyle,
                ),
                Text(
                  "$price XOF",
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Entrez ou cliquez sur le code ci-dessous pour effectuer le paiement de la transaction et appuyez sur Continuer une fois terminé",
              style: smallMediumTextStyle,
            ),
            Center(
              child: TextButton(
                child: Text(
                  "code :${code}",
                  style: mediumLargeTextStyle.copyWith(
                      color: primaryColor,
                      decoration: TextDecoration.underline),
                ),
                onPressed: () async {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: code,
                  );
                  await launchUrl(launchUri, mode: LaunchMode.platformDefault);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width * 0.6,
              child: CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.green,
                  onPressed: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: code,
                    );
                    await launchUrl(launchUri,
                        mode: LaunchMode.platformDefault);
                    pageIndexNotifier.value = 1;
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      Text(
                        "Faire la transaction",
                        style: mediumLargeTextStylewhite,
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: Get.width * 095,
              child: CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: primaryColor,
                  onPressed: () async {
                    pageIndexNotifier.value = 1;
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      Text(
                        "Paiement déjà effectué ? continuer",
                        style: mediumLargeTextStylewhite,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
      topBarTitle:
          Text("Code à composez pour l'achat", style: textTheme.titleSmall),
      isTopBarLayerAlwaysVisible: true,
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.close),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
    );
    
  }

  WoltModalSheetPage page2(BuildContext modalSheetContext, TextTheme textTheme,
      String code, String banner, String appId, bool isOrange) {
    return WoltModalSheetPage(
      backgroundColor: Colors.white,
      enableDrag: true,
      stickyActionBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(
            _pagePadding, _pagePadding / 4, _pagePadding, _pagePadding),
        child: CupertinoButton(
          onPressed: () async {
            await ConnectionUtils.checkInternetConnection();
            if (true) {
              EasyLoading.show(
                  indicator: Column(
                children: [
                  CircularProgressIndicator(),
                  Text(
                    "Vérification des paiements",
                    style: mediumLargeTextStylewhite,
                  )
                ],
              ));
              try {
                
                //print(phone.text);
                var headers = {'Content-Type': 'application/json'};
                var data = json.encode({
                  "api_key": "2pKOZHdl8SC-_6g4WO94nhmZD2vWfIth",
                  "app_id": appId,
                  "amount": price,
                  "phonenumber": phone.text,
                  "orange": isOrange
                });
                var dio = Dio();
                var response = await dio.request(
                  'https://shark-app-xeyhn.ondigitalocean.app/pay/control/phone_number',
                  options: Options(
                    method: 'POST',
                    headers: headers,
                  ),
                  data: data,
                );
                if (response.statusCode == 200) {
                 // print(json.encode(response.data));
                  if (response.data['success']) {
                    EasyLoading.showSuccess("Paiement confirmé");
                    await callback();
                  } else {
                    EasyLoading.showError(
                        "Paiement non valide, S'il s'agit d'une transaction que vous venez d'effectuer, veuillez patienter et réessayer");
                    Get.back();
                  }
                } else {
                  EasyLoading.showError(
                      "S'il s'agit d'une transaction que vous venez d'effectuer, veuillez patienter et réessayer");
                }
              } catch (e) {
               // print(e);
                EasyLoading.showError(
                    "S'il s'agit d'une transaction que vous venez d'effectuer, veuillez patienter et réessayer");
              }
            }
          },
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: primaryColor,
          child: Text(
            "Confirmer le Paiement",
            style: mediumLargeTextStylewhite,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              banner,
              width: 250,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Entrez le numéro de téléphone que vous utilisez pour effectuer le paiement",
              style: mediumLargeTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width * 0.9,
              child: TextField(
                style: mediumLargeTextStyle,
                keyboardType: TextInputType.number,
                maxLength: 8,
                controller: phone,
                decoration: InputDecoration(
                    label: Text(
                      "Numéro de telephone",
                      style: mediumLargeTextStyle,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide())),
              ),
            ),
            // Text('NB: Ce code est different de votre code De connexion à L\'application'),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                EasyLoading.show(
                    indicator: LoadingAnimationWidget.twistingDots(
                      leftDotColor: Color.fromARGB(255, 255, 255, 255),
                      rightDotColor: primaryColor,
                      size: 25,
                    ),
                    dismissOnTap: false);
                var whatsapp = "+22660356506";
                var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=Salut j'ai rencontré une difficulte pour payer mon ticket";
                var whatAppURLIOS =
                    "https://wa.me/$whatsapp?text=${Uri.parse("Salut j'ai rencontré une difficulte pour payer ma commande")}";
                // for iOS phone only
                try {
                  await launchUrlString(
                    whatAppURLIOS,
                  );
                } catch (e) {
                  ScaffoldMessenger.of(modalSheetContext).showSnackBar(
                      const SnackBar(content: Text("Whatsapp non installé")));
                }
                EasyLoading.dismiss();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/whatsapp.png',
                    height: 25,
                    width: 25,
                  ),
                  Text(
                    "Contacter l'assistance",
                    style: smallBoldTextStyle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      leadingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () => pageIndexNotifier.value = pageIndexNotifier.value - 1,
      ),
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.of(modalSheetContext).pop();
          pageIndexNotifier.value = 0;
        },
      ),
    );
    
  }

  Widget build(BuildContext context) {
    String codeOrange = "*144*10*57232067*$price#";

    String codeMoov = "*144*10*05690560*$price#";
    String orangeBanner = "lib/images/Orange_Money-Logo.wine.png";
    String moovBanner = "lib/images/moov-money-removebg-preview.png";
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: const Color.fromARGB(255, 255, 255, 255)),
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          "Payer votre Formation",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text("Motif de la transaction : Formation en $sujet",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 4,
            ),
            Text("price total : $price Franc CFA",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Divider(color: Color.fromARGB(255, 211, 211, 211)),
            SizedBox(
              height: 15,
            ),
            Text(
              "Payer avec :",
              style: mediumLargeTextStyle,
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //bouton
                  InkWell(
                    onTap: () {
                      try {
      createDialogue(context, codeOrange, orangeBanner, "7c9b5783-afea-4b07-a58f-8f77c3571a8c", true);
    } catch (e) {
      print('Une erreur s\'est produite lors de la création du dialogue : $e');
    
    }
                    },
                    child: Card(
                      child: Container(
                        width: 475 * 0.3,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image:
                              DecorationImage(image: AssetImage(orangeBanner)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      createDialogue(context, codeMoov, moovBanner,
                          "e877509b-21b8-43d9-b906-2ed6919ef373", false);
                    },
                    child: Card(
                      child: Container(
                        width: 475 * 0.3,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage(moovBanner)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class ConnectionUtils {
  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}
 */

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

const double _bottomPaddingForButton = 150.0;
const double _buttonHeight = 56.0;
const double _buttonWidth = 200.0;
const double _pagePadding = 16.0;
const double _pageBreakpoint = 768.0;
const double _heroImageHeight = 250.0;
const Color _lightThemeShadowColor = Color(0xFFE4E4E4);
const Color _darkThemeShadowColor = Color(0xFF121212);
const Color _darkSabGradientColor = Color(0xFF313236);

//MARGIN
const double spacingControl = 4.0;
const double spacingStandard = 8.0;
const double spacingContainer = 16.0;
const double spacingLarge = 32.0;
const double buttonHeight = 60.0;
const double spacingControlHalf = 4.0;

//FONTS
const textSizeSmall = 12.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 16.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeLarge = 2.0;
const textSizeXLarge = 30.0;

const double textRadius = 50.0;
const double editTextRadius = 6.0;
const double keyboardRadius = 40.0;

const double elevation = 6.0;
const double borderWidth = 5.0;

const double itemSpacing = 22.0;

const kTabletBreakpoint = 1024;
const kDesktopBreakPoint = 1366;

class AppColor {
  static const itemBackgroundColor = Color(0xFFD1D1D1);
}

const accentColor = Color(0xFFbb74ed);
const accentSecondary = Color(0xFF353436);
const primaryColor = Color.fromARGB(252, 181, 17, 17);
const primaryTextColor = Color(0xFF1d2a3a);
const secondaryTextColor = Color(0xFF515151);
const textBackgroundColor = Color(0xFFEDEDED);
const itemBackgroundColor = Color(0xFFD1D1D1);
const editTextBackgroundColor = Color(0xFFf5f5f5);
const editTextHintColor = Color(0xFFcbcbcb);
const btnBgTextColor = Color(0xFF707070);
const btnBgColor = Color(0xFF1d2a3a);

const backgroundColor = Colors.white;
const toastTextColor = Colors.white;

const error = Color(0xFFD9534F);
const success = Color(0xFF5CB85C);
const warning = Color(0xFFE89E35);
const info = Color(0xFF59BFDD);
final appBarStyle = GoogleFonts.quicksand(
  color: primaryColor,
  fontSize: textSizeLarge,
  fontWeight: FontWeight.bold,
);

final hintTextStyle = GoogleFonts.quicksand(
  color: Colors.grey.withOpacity(0.9),
  fontSize: textSizeSMedium,
  fontWeight: FontWeight.normal,
);

final errorTextStyle = GoogleFonts.roboto(
  color: Colors.red,
  fontSize: textSizeSmall,
  fontWeight: FontWeight.normal,
);

//Font Size Small and Color White
final smallNormalTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeSMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3);
final smallMediumTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeSMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3);
final smallBoldTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeSMedium,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3);

//Font Size Normal and Color White
final normalTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3);
final mediumTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3);
final boldTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeMedium,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3);

//Font Size Large and Color White
final normalLargeTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeLargeMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3);
final mediumLargeTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeLargeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3);
final mediumLargeTextStyle2 = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeLarge,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3);
final mediumLargeTextStylewhite = GoogleFonts.quicksand(
    color: Colors.white,
    fontSize: textSizeLargeMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3);
final boldLargeTextStyle = GoogleFonts.quicksand(
    color: primaryTextColor,
    fontSize: textSizeLargeMedium,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3);

final semiSubTitleTextStyle = GoogleFonts.quicksand(
    fontSize: textSizeSMedium,
    letterSpacing: 0.3,
    color: secondaryTextColor,
    fontWeight: FontWeight.w400);
// Semi sub title with regular

@immutable
class PayementScreen extends StatelessWidget {
  final TextEditingController codeaccess;
  final TextEditingController phone;
  final String phonetxt;
  final int price;
  final String userphone;
  final AsyncCallback callback;
  final String sujet;
  PayementScreen(
      {Key? key,
      required this.sujet,
      required this.price,
      required this.userphone,
      required this.callback})
      : codeaccess = TextEditingController(),
        phone = TextEditingController(text: ""),
        phonetxt = "",
        super(key: key);
  createDialogue(BuildContext context, String code, String banner,
      String app_id, bool is_orange) {
    WoltModalSheet.show<void>(
      pageIndexNotifier: pageIndexNotifier,
      context: context,
      pageListBuilder: (modalSheetContext) {
        final textTheme = Theme.of(context).textTheme;
        return [
          page1(modalSheetContext, textTheme, code, banner),
          page2(modalSheetContext, textTheme, code, banner, app_id, is_orange),
        ];
      },
      modalTypeBuilder: (context) {
        final size = MediaQuery.of(context).size.width;
        if (size < _pageBreakpoint) {
          return WoltModalType.bottomSheet;
        } else {
          return WoltModalType.dialog;
        }
      },
      onModalDismissedWithBarrierTap: () {
        debugPrint('Closed modal sheet with barrier tap');
        Navigator.of(context).pop();
        pageIndexNotifier.value = 0;
      },
      maxDialogWidth: Get.width,
      minDialogWidth: 400,
      minPageHeight: 0.0,
      maxPageHeight: 0.9,
    );
  }

  final pageIndexNotifier = ValueNotifier(0);

  WoltModalSheetPage page1(BuildContext modalSheetContext, TextTheme textTheme,
      String code, String banner) {
    return WoltModalSheetPage(
      backgroundColor: Colors.white,
      hasSabGradient: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            Image.asset(
              banner,
              width: 250,
            ),
            Row(
              children: [
                Text(
                  "price: ",
                  style: mediumLargeTextStyle,
                ),
                Text(
                  "$price XOF",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Entrez ou cliquez sur le code ci-dessous pour effectuer le paiement de la transaction et appuyez sur Continuer une fois terminé",
              style: smallMediumTextStyle,
            ),
            Center(
              child: TextButton(
                child: Text(
                  "code :${code}",
                  style: mediumLargeTextStyle.copyWith(
                      color: primaryColor,
                      decoration: TextDecoration.underline),
                ),
                onPressed: () async {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: code,
                  );
                  await launchUrl(launchUri, mode: LaunchMode.platformDefault);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width * 0.6,
              child: CupertinoButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      Text(
                        "Faire la transaction",
                        style: mediumLargeTextStylewhite,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.green,
                  onPressed: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: code,
                    );
                    await launchUrl(launchUri,
                        mode: LaunchMode.platformDefault);
                    pageIndexNotifier.value = 1;
                  }),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: Get.width * 095,
              child: CupertinoButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      Text(
                        "Paiement déjà effectué ? continuer",
                        style: mediumLargeTextStylewhite,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: primaryColor,
                  onPressed: () async {
                    pageIndexNotifier.value = 1;
                  }),
            )
          ],
        ),
      ),
      topBarTitle:
          Text("Code à composez pour l'achat", style: textTheme.titleSmall),
      isTopBarLayerAlwaysVisible: true,
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.close),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
    );
  }

  WoltModalSheetPage page2(BuildContext modalSheetContext, TextTheme textTheme,
      String code, String banner, String app_id, bool is_orange) {
    return WoltModalSheetPage(
      backgroundColor: Colors.white,
      enableDrag: true,
      stickyActionBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(
            _pagePadding, _pagePadding / 4, _pagePadding, _pagePadding),
        child: CupertinoButton(
          onPressed: () async {
            // bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
            if (true) {
              EasyLoading.show(
                  indicator: Column(
                children: [
                  CircularProgressIndicator(),
                  Text(
                    "Vérification des paiements",
                    style: mediumLargeTextStylewhite,
                  )
                ],
              ));
              try {
                print(phone.text);
                var headers = {'Content-Type': 'application/json'};
                var data = json.encode({
                  "api_key": "2pKOZHdl8SC-_6g4WO94nhmZD2vWfIth",
                  "app_id": app_id,
                  "amount": price,
                  "phonenumber": phone.text,
                  "orange": is_orange
                });
                var dio = Dio();
                var response = await dio.request(
                  'https://shark-app-xeyhn.ondigitalocean.app/pay/control/phone_number',
                  options: Options(
                    method: 'POST',
                    headers: headers,
                  ),
                  data: data,
                );

                if (response.statusCode == 200) {
                  print(json.encode(response.data));
                  if (response.data['success']) {
                    EasyLoading.showSuccess("Paiement confirmé");
                    await callback();
                  } else {
                    EasyLoading.showError(
                        "Paiement non valide, S'il s'agit d'une transaction que vous venez d'effectuer, veuillez patienter et réessayer");
                    Get.back();
                  }
                } else {
                  EasyLoading.showError(
                      "S'il s'agit d'une transaction que vous venez d'effectuer, veuillez patienter et réessayer");
                }
              } catch (e) {
                print(e);
                EasyLoading.showError(
                    "S'il s'agit d'une transaction que vous venez d'effectuer, veuillez patienter et réessayer");
              }
            }
          },
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Confirmer le Paiement",
            style: mediumLargeTextStylewhite,
          ),
          color: primaryColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              banner,
              width: 250,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Entrez le numéro de téléphone que vous utilisez pour effectuer le paiement",
              style: mediumLargeTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width * 0.9,
              child: TextField(
                style: mediumLargeTextStyle,
                keyboardType: TextInputType.number,
                maxLength: 8,
                controller: phone,
                decoration: InputDecoration(
                    label: Text(
                      "Numéro de telephone",
                      style: mediumLargeTextStyle,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide())),
              ),
            ),

            // Text('NB: Ce code est different de votre code De connexion à L\'application'),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                EasyLoading.show(
                    indicator: LoadingAnimationWidget.twistingDots(
                      leftDotColor: Color.fromARGB(255, 255, 255, 255),
                      rightDotColor: primaryColor,
                      size: 25,
                    ),
                    dismissOnTap: false);
                var whatsapp = "+22660356506";
                var whatsappURlAndroid = "whatsapp://send?phone=" +
                    whatsapp +
                    "&text=Salut j'ai rencontré une difficulte pour payer mon ticket";
                /*  var whatAppURLIOS =
                    "https://wa.me/$whatsapp?text=${Uri.parse("Salut j'ai rencontré une difficulte pour payer ma commande")}";
 */
                // for iOS phone only
                try {
                  await launchUrlString(
                    whatsappURlAndroid,
                  );
                } catch (e) {
                  ScaffoldMessenger.of(modalSheetContext).showSnackBar(
                      const SnackBar(content: Text("Whatsapp non installé")));
                }

                EasyLoading.dismiss();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/whatsapp.png',
                    height: 25,
                    width: 25,
                  ),
                  Text(
                    "Contacter l'assistance",
                    style: smallBoldTextStyle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      leadingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () => pageIndexNotifier.value = pageIndexNotifier.value - 1,
      ),
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.of(modalSheetContext).pop();
          pageIndexNotifier.value = 0;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String codeOrange = "144*10*05690560$price#";
    String codeMoov = "555*4*1*03301404$price#";
    String orangeBanner = "assets/images/Orange_Money-Logo.wine.png";
    String moovBanner = "assets/images/moov-money-removebg-preview.png";
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Payer votre Commande",
          style: mediumLargeTextStyle,
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: SingleChildScrollView(
            child: Container(
              width: Get.width,
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Motif de la transaction :",
                    style: mediumLargeTextStyle,
                  ),
                  Divider(color: Color.fromARGB(255, 211, 211, 211)),
                  Text(
                    sujet,
                    style: mediumLargeTextStyle,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text("price total : $price Franc CFA",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Divider(color: Color.fromARGB(255, 211, 211, 211)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Payer avec :",
                    style: mediumLargeTextStyle,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              createDialogue(context, codeOrange, orangeBanner,
                                  "96e38740-08c8-4f22-8a87-e7d39c42edd8", true);
                            },
                            child: Card(
                              child: Container(
                                width: Get.width * 0.4,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(orangeBanner)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              createDialogue(
                                  context,
                                  codeMoov,
                                  moovBanner,
                                  "93c75751-d545-4070-b5b4-06554f2a9e04",
                                  false);
                            },
                            child: Card(
                              child: Container(
                                width: Get.width * 0.4,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(moovBanner)),
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                  //                 Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: SizedBox(
                  //     width: Get.width,
                  //     child: SingleChildScrollView(
                  //       scrollDirection: Axis.horizontal,
                  //       child: Row(
                  //         children: [
                  //           Icon(Icons.security),
                  //           Text("Futurix ",style: mediumLargeTextStyle,),
                  //           Text("Pay",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        )),
      ),
      bottomNavigationBar: SizedBox(
        width: Get.width > 475 ? 475 : Get.width,
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.security),
            Text("Sécurisé par "),
            Text(
              "Futurix ",
              style: mediumLargeTextStyle,
            ),
            Text(
              "Pay",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
