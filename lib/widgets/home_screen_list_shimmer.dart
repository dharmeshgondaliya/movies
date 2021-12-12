import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 175,
      child: Shimmer.fromColors(
        child: Container(
          margin: const EdgeInsets.only(right: 15),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 20,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              )
            ],
          ),
        ),
        baseColor: Colors.grey,
        highlightColor: Colors.white,
      ),
    );
  }
}
