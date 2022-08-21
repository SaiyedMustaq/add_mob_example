import 'dart:developer';

import 'package:addmob/AdHelper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAddPage extends StatefulWidget {
  const BannerAddPage({Key? key}) : super(key: key);

  @override
  State<BannerAddPage> createState() => _BannerAddPageState();
}

class _BannerAddPageState extends State<BannerAddPage> {
  late BannerAd bannerAd;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AddHelper.bannerAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: ((ad) {
            setState(() {
              isLoading = true;
            });
            log('Banner Add Loaded');
          }),
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
        request: const AdRequest());

    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banner Ad"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? Container(
                    height: 50,
                    child: AdWidget(ad: bannerAd),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
