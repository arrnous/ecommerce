import 'package:ecommerce/Core/Class/statusrequest.dart';
import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(AppImageAsset.noConnection))
            : statusRequest == StatusRequest.serverfailure
                ? Center(child: Lottie.asset(AppImageAsset.noConnection))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImageAsset.empty, repeat: false))
                    : widget;
  }
}

class HandlingDataViewReq extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataViewReq(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, height: 100, width: 100))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(AppImageAsset.noConnection))
            : statusRequest == StatusRequest.serverfailure
                ? Center(child: Lottie.asset(AppImageAsset.noConnection))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImageAsset.empty, repeat: false))
                    : widget;
  }
}
