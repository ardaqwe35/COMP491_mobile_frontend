import 'dart:convert';

import 'package:comp491_mobile_frontend/constants/routes.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:http/http.dart' as http;

class MetamaskController extends GetxController {
  Rx<SessionStatus> currentSessionStatus =
      SessionStatus(chainId: -1, accounts: []).obs;
  Rx<WalletStatus> isWalletConnected = WalletStatus.disconnected.obs;
  Rx<String> walletAdress = "".obs;
  Rx<double> walletBalance = 0.0.obs;

  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'ZATE Metamask Connection',
          description: 'ZATE',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  loginUsingMetamask() async {
    isWalletConnected.value = WalletStatus.hasCurrency;
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          var _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        currentSessionStatus.value = session;
        isWalletConnected.value = WalletStatus.connected;
        //check balance and update status
      } catch (exp) {
        print(exp);
      }
    }
  }

  void connectMetamaskTapped() {
    loginUsingMetamask();
  }

  void continueTapped() {
    Get.offAllNamed(Routes.signUpScreen);
  }

  Future<void> fetchData() async {
    String wallet = walletAdress.value == ""
        ? "0x3A17045d7db4d825477CeF64cbb9b9a903F93031"
        : walletAdress.value;
    // Make the HTTP request
    final response = await http
        .get(Uri.parse('http://109.123.240.10:3000/balance?address=$wallet'));

    // Check the status code of the response
    if (response.statusCode == 200) {
      // API call was successful
      final responseData = json.decode(response.body);
      walletBalance.value = responseData["balance"] ?? 0;
    } else {
      // API call failed
      print('API request failed with status code: ${response.statusCode}');
    }
  }
}

enum WalletStatus { disconnected, connected, hasCurrency }

String walletStatusToString(WalletStatus status) {
  if (status == WalletStatus.disconnected) {
    return "Disconnected";
  } else if (status == WalletStatus.connected) {
    return "Connected";
  } else if (status == WalletStatus.hasCurrency) {
    return "Connected and Verified!";
  } else {
    return "error";
  }
}
