import 'package:addmob/AdHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedPage extends StatefulWidget {
  const RewardedPage({Key? key}) : super(key: key);

  @override
  State<RewardedPage> createState() => _RewardedPageState();
}

class _RewardedPageState extends State<RewardedPage> {
  late RewardedAd _rewardedAd;
  bool _isRewardedAdReady = false;
  @override
  void initState() {
    createRewardedAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(),
    );
  }

  @override
  void dispose() {
    _rewardedAd.dispose();
    super.dispose();
  }

  void createRewardedAd() {
    RewardedAd.load(
      adUnitId: AddHelper.rewardedId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                _isRewardedAdReady = false;
              });
              createRewardedAd();
            },
          );

          setState(() {
            _isRewardedAdReady = true;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
          setState(() {
            _isRewardedAdReady = false;
          });
        },
      ),
    );
  }
}
