import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:serumswap/coin_market.dart';
import 'package:serumswap/phantom.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:serumswap/providers/wallet_state_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final Phantom phantom;
  const Home({super.key, required this.phantom});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List dropdownItemList = [
    {
      "label": "SOL",
      "value": "SOL",
      "tokenSymbol": "SOL",
      "mintAddress": "So11111111111111111111111111111111111111112",
      "tokenName": "Solana",
      "icon": SizedBox(
          key: UniqueKey(),
          width: 20,
          height: 20,
          child: Image.network(
            "https://cryptologos.cc/logos/solana-sol-logo.png?v=023"))
    },
    {
      "label": "USDC",
      "value": "USDC",
      "tokenSymbol": "USDC",
      "mintAddress": "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",
      "tokenName": "USDC",
      "icon": SizedBox(
          key: UniqueKey(),
          width: 20,
          height: 20,
          child: Image.network(
              "https://cryptologos.cc/logos/usd-coin-usdc-logo.png?v=023"))
    },
    {
      "label": "STR",
      "value": "STR",
      "tokenSymbol": "STR",
      "mintAddress": "5P3giWpPBrVKL8QP8roKM7NsLdi3ie1Nc2b5r9mGtvwb",
      "tokenName": "Stream Token",
      "icon": SizedBox(
          key: UniqueKey(),
          width: 20,
          height: 20,
          child: Image.network(
              "https://i.imgur.com/ipYWwIu.png?v=023"))
    },
    {
      "label": "USDT",
      "value": "USDT",
      "tokenSymbol": "USDT",
      "mintAddress": "Es9vMFrzaCERmJfrF4H2FYD4KCoNkY11McCe8BenwNYB",
      "tokenName": "USDT",
      "icon": SizedBox(
          key: UniqueKey(),
          width: 20,
          height: 20,
          child: Image.network(
              "https://cryptologos.cc/logos/tether-usdt-logo.png?v=023"))
    },
    {
      "label": "SRM",
      "value": "SRM",
      "tokenSymbol": "SRM",
      "mintAddress": "SRMuApVNdxXokk5GT7XD5cUUgXMBCoAz2LHeuAoKWRt",
      "tokenName": "SRM",
      "icon": SizedBox(
          key: UniqueKey(),
          width: 20,
          height: 20,
          child: Image.network(
              "https://cryptologos.cc/logos/serum-srm-logo.png?v=023"))
    },
    {
      "label": "BTC",
      "value": "BTC",
      "tokenSymbol": "BTC",
      "mintAddress": "9n4nbM75f5Ui33ZbPYXn59EwSgE8CGsHtAeTH5YFeJ9E",
      "tokenName": "SRM",
      "icon": SizedBox(
          key: UniqueKey(),
          width: 20,
          height: 20,
          child: Image.network(
              "https://cryptologos.cc/logos/bitcoin-btc-logo.png?v=023"))
    },
    {
      "label": "ETH",
      "value": "ETH",
      "tokenSymbol": "ETH",
      "mintAddress": "2FPyTwcZLUg1MDrwsyoP4D6s1tM7hAkHYRjkNb5w6Pxk",
      "tokenName": "ETH",
      "icon": SizedBox(
          key: UniqueKey(),
          width: 20,
          height: 20,
          child: Image.network(
              "https://cryptologos.cc/logos/ethereum-eth-logo.png?v=023"))
    },
  ];
  late Map<String, dynamic> price;

  final CoinMarket coinMarket = CoinMarket();

  String first = "SOL";
  String second = "USDC";
  String mint1 = "";
  String mint2 = "";
  Map data = {};
  double input = 0;
  final _firsController = TextEditingController();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    coinMarket.toUSDC(first, second).then((value) => setState(() {
          data = value;
        }));
    _firsController.addListener(
      () {
        // ignore: avoid_print
        print(_firsController.text);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _firsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WalletStateProvider>(context, listen: true);
    return Center(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              // gradient:
              //     const LinearGradient(begin: Alignment.topCenter, colors: [
              //   Color.fromARGB(255, 46, 34, 46),
              //   Color.fromARGB(255, 39, 35, 43),
              //   Color.fromARGB(255, 36, 35, 42),
              //   Color.fromARGB(255, 34, 36, 41),
              // ]),
              // color: Color.fromARGB(255, 25, 27, 31),
              borderRadius: BorderRadius.circular(15.0)),
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 33, 36, 41),
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Swap",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Container(
                  height: 20,
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 64, 68, 79),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    // border: Border.all(width: 2),
                                    color:
                                        const Color.fromARGB(255, 64, 68, 79),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 150,
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        if (value != "") {
                                          input = double.parse(value);
                                        } else {
                                          input = 0;
                                        }
                                        _firsController.text =
                                            "${input * data[first][second]}";
                                      });
                                    },
                                    controller: _controller,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                    decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        hintText: "0.0",
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 178, 185, 210),
                                          fontSize: 22,
                                        ),
                                        border: InputBorder.none,
                                        focusColor: Colors.white),
                                  ),
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    value: first,
                                    isExpanded: true,
                                    items: dropdownItemList
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item['tokenSymbol'],
                                              child: Row(
                                                children: [
                                                  item['icon'],
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    item['tokenSymbol'],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) async {
                                      setState(() {
                                        first = value as String;
                                      });
                                      data = await coinMarket.toUSDC(
                                        first,
                                        second,
                                      );
                                      setState(() {
                                        data = data;
                                      });
                                      _firsController.text =
                                          "${input * data[first][second]}";
                                    },
                                    icon: const Icon(
                                      Icons.expand_more,
                                    ),
                                    iconSize: 20,
                                    iconEnabledColor: Colors.white,
                                    iconDisabledColor: Colors.grey,
                                    buttonHeight: 50,
                                    buttonWidth: 130,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      color: const Color.fromARGB(
                                          255, 80, 80, 100),
                                    ),
                                    buttonElevation: 2,
                                    itemHeight: 40,
                                    itemPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    dropdownMaxHeight: 200,
                                    dropdownWidth: 130,
                                    dropdownPadding: null,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color:
                                          const Color.fromARGB(255, 64, 68, 79),
                                    ),
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    // scrollbarAlwaysShow: true,
                                    // offset: const Offset(-20, 0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 64, 68, 79),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                      // border: Border.all(width: 2),
                                      color:
                                          const Color.fromARGB(255, 64, 68, 79),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 150,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: _firsController,
                                    enabled: false,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 22),
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      hintText: "0.0",
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 178, 185, 210),
                                        fontSize: 22,
                                      ),
                                      border: InputBorder.none,
                                      focusColor: Colors.white,
                                    ),
                                  ),
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    items: dropdownItemList
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item['tokenSymbol'],
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  item['icon'],
                                                  const SizedBox(width: 7),
                                                  Text(
                                                    item['tokenSymbol'],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                    value: second,
                                    onChanged: (value) async {
                                      setState(() {
                                        second = value as String;
                                      });
                                      data = await coinMarket.toUSDC(
                                        first,
                                        second,
                                      );
                                      setState(() {
                                        data = data;
                                      });
                                      _firsController.text =
                                          "${input * data[first][second]}";
                                    },
                                    icon: const Icon(
                                      Icons.expand_more,
                                    ),
                                    iconSize: 20,
                                    iconEnabledColor: Colors.white,
                                    iconDisabledColor: Colors.grey,
                                    buttonHeight: 50,
                                    buttonWidth: 130,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      color: const Color.fromARGB(
                                          255, 80, 80, 100),
                                    ),
                                    buttonElevation: 2,
                                    itemHeight: 40,
                                    itemPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    dropdownMaxHeight: 200,
                                    dropdownWidth: 130,
                                    dropdownPadding: null,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color:
                                          const Color.fromARGB(255, 64, 68, 79),
                                    ),
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    // scrollbarAlwaysShow: true,
                                    // offset: const Offset(-20, 0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 75,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            String? temp = first;
                            String temp2 = _firsController.text;
                            setState(() {
                              first = second;
                              second = temp;
                              _firsController.text = _controller.text;
                              _controller.text = temp2;
                            });
                            data = await coinMarket.toUSDC(first, second);
                            setState(() {
                              data = data;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 64, 68, 79),
                                borderRadius: BorderRadius.circular(20),
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  const BoxShadow(
                                    color: Color.fromARGB(255, 33, 36, 41),
                                    spreadRadius: 5,
                                  )
                                ]),
                            child: const Icon(
                              Icons.arrow_downward_sharp,
                              size: 25,
                              color: Color.fromARGB(255, 207, 198, 198),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // data.isEmpty
                //     ? Text("")
                //     : Container(
                //         padding: EdgeInsets.only(right: 40, top: 10),
                //         alignment: Alignment.topRight,
                //         child: Text("1 $first = ${data[first]?["USD"]} USD",
                //             style: TextStyle(color: Colors.red)),
                //       ),

                // data.isEmpty
                //     ? Text("")
                //     : Container(
                //         padding: EdgeInsets.only(right: 30, top: 10),
                //         alignment: Alignment.topRight,
                //         child: Text("1 $second = ${data[second]?["USD"]} USD",
                //             style: TextStyle(color: Colors.red)),
                //       ),
                // Container(margin: const EdgeInsets.all(20)),
                const SizedBox(
                  height: 30,
                ),
                data[first]?[second] == null
                    ? LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white, size: 20)
                    : Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "1 $first = ${data[first][second]} $second",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                Container(margin: const EdgeInsets.all(10)),
                provider.isConnected
                    ? TextButton(
                        onPressed: () async {
                          await widget.phantom.swap(first, second, input);
                          // if (widget.phantom.tswap == 1) {
                          //   QuickAlert.show(
                          //     context: context,
                          //     type: QuickAlertType.success,
                          //     titleColor: Colors.white,
                          //     text: 'swap Completed Successfully!',
                          //     textColor: Colors.white,
                          //     backgroundColor:
                          //         const Color.fromARGB(255, 68, 90, 117),
                          //     confirmBtnColor: Colors.blue,
                          //     confirmBtnText: "view on Solscan",
                          //     onCancelBtnTap: () {},
                          //     onConfirmBtnTap: () async => await launchUrl(
                          //         Uri.parse(widget.phantom.sigurl),
                          //         mode: LaunchMode.inAppWebView),
                          //   );
                          //   widget.phantom.tswap = 0;
                          //   widget.phantom.nswap = 0;
                          // }
                          // if (widget.phantom.nswap == 1) {
                          //   QuickAlert.show(
                          //     context: context,
                          //     type: QuickAlertType.error,
                          //     titleColor: Colors.white,
                          //     text: 'swap failed',
                          //     textColor: Colors.white,
                          //     backgroundColor:
                          //         const Color.fromARGB(255, 68, 90, 117),
                          //     confirmBtnColor: Colors.blue,
                          //   );
                          //   widget.phantom.tswap = 0;
                          //   widget.phantom.nswap = 0;
                          // }
                          // if (await widget.phantom.swap(first, second, input)) {
                          //   QuickAlert.show(
                          //     context: context,
                          //     type: QuickAlertType.success,
                          //     titleColor: Colors.white,
                          //     text: 'swap success',
                          //     textColor: Colors.white,
                          //     backgroundColor:
                          //         const Color.fromARGB(255, 68, 90, 117),
                          //     confirmBtnColor: Colors.blue,
                          //   );
                          // }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 23, 42, 66),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                "Swap",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () async {
                          if (!widget.phantom.connected) {
                            widget.phantom.connect();
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 23, 42, 66),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                "Connect Wallet",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 76, 137, 224),
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
