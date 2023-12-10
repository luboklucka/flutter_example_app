import 'package:app_example_flutter/src/utils/app_colors.dart';
import 'package:app_example_flutter/src/utils/font.dart';
import 'package:app_example_flutter/src/utils/images_urls.dart';
import 'package:app_example_flutter/src/features/universities/model/university.dart';
import 'package:flutter/widgets.dart';

class UniversityCell extends StatefulWidget {
  const UniversityCell({
    required this.university,
    this.bottomPadding,
    Key? key,
  }) : super(key: key);

  final University university;
  final double? bottomPadding;

  @override
  State<UniversityCell> createState() => _UniversityCellState();
}

class _UniversityCellState extends State<UniversityCell> {
  String _title = "";
  String _country = "";
  String _state = "";
  String _webPage = "";

  @override
  void initState() {
    super.initState();

    _title = widget.university.name ?? "Unknown university";
    _country = widget.university.country ?? "";
    _state = widget.university.stateProvince ?? "";
    _webPage = widget.university.webPages?.first ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 26, right: 26, top: 20, bottom: widget.bottomPadding ?? 0),
      padding: const EdgeInsets.only(left: 26, right: 26, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 0,
            blurRadius: 13,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
                height: 12, width: 14, AppImagesUrls.shared.arrowRight),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _title,
                style: Font.header16.copyWith(color: AppColors.darkGrey),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              Text(
                _country,
                maxLines: 6,
                overflow: TextOverflow.fade,
                style: Font.body14.copyWith(color: AppColors.darkGrey),
              ),
              if (_state.isNotEmpty)
                Row(
                  children: [
                    Text(
                      "StateProvince:  ",
                      style: Font.body12.copyWith(color: AppColors.grey),
                    ),
                    Text(
                      _state,
                      style: Font.body14.copyWith(color: AppColors.blue),
                    ),
                  ],
                ),
              if (_webPage.isNotEmpty)
                Text(
                  _webPage,
                  style: Font.body12.copyWith(color: AppColors.grey),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
