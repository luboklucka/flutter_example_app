import 'package:flutter_example_app/src/common_widgets/image_button.dart';
import 'package:flutter_example_app/src/utils/app_colors.dart';
import 'package:flutter_example_app/src/utils/font.dart';
import 'package:flutter_example_app/src/utils/images_urls.dart';
import 'package:flutter_example_app/src/features/universities/model/university.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;

class UniversityDetailsScreen extends StatefulWidget {
  const UniversityDetailsScreen({
    required this.university,
    Key? key,
  }) : super(key: key);

  final University university;

  @override
  State<UniversityDetailsScreen> createState() =>
      _UniversityDetailsScreenState();
}

class _UniversityDetailsScreenState extends State<UniversityDetailsScreen> {
  String title = "Universities details";
  final double _horizontalMargin = 20.0;

  @override
  void initState() {
    super.initState();

    title =
        (widget.university.name != null && widget.university.name!.isNotEmpty)
            ? widget.university.name!
            : "Unknown University";
  }

  void _goBack() {
    Navigator.pop(context);
  }

  Widget _navigationBar() {
    return Container(
      height: MediaQuery.of(context).padding.top + 80,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      color: AppColors.white,
      child: Column(
        children: [
          const Expanded(child: material.SizedBox(width: 10)),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageButton(
                  height: 40,
                  width: 40,
                  imageUrl: AppImagesUrls.shared.backIconBlue,
                  action: () {
                    _goBack();
                  },
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.only(right: 0.0),
                  width: MediaQuery.of(context).size.width - 102,
                  child: Text(
                    title,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: Font.header20.copyWith(color: AppColors.blue),
                  ),
                ),
                const Expanded(child: SizedBox(height: 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _highlightsContainer() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15,
        left: _horizontalMargin,
        right: _horizontalMargin,
        top: 20,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Font.header16,
          ),
          const SizedBox(height: 16),
          Text(
            widget.university.country ?? "Unknown country",
            style: Font.body14SemiBold,
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 26,
        left: _horizontalMargin,
        right: _horizontalMargin,
        top: 0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                const EdgeInsets.only(bottom: 18, top: 16, left: 14, right: 14),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.university.webPages?.first ?? "",
                      style: Font.body14SemiBold.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                    if ((widget.university.stateProvince ?? "").isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          widget.university.stateProvince!,
                          style: Font.body12light.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                  ],
                ),
                const Expanded(child: SizedBox(height: 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return material.Material(
      color: AppColors.dirtyWhite,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: _navigationBar(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    80,
                width: MediaQuery.of(context).size.width,
                child: CustomScrollView(shrinkWrap: false, slivers: [
                  SliverToBoxAdapter(
                    child: _highlightsContainer(),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: _body(),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
