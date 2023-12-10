import 'package:flutter_example_app/src/common_widgets/tactile.dart';
import 'package:flutter_example_app/src/features/universities/model/university.dart';
import 'package:flutter_example_app/src/features/universities/view/university_cell.dart';
import 'package:flutter_example_app/src/features/universities/view_model/universities_view_model.dart';
import 'package:flutter_example_app/src/features/universities/view/university_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

class Universities extends StatefulWidget {
  const Universities({
    Key? key,
  }) : super(key: key);

  @override
  State<Universities> createState() => _UniversitiesState();
}

class _UniversitiesState extends State<Universities> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    Future.microtask(() => fetchData());

    super.initState();
  }

  void fetchData() {
    final viewModel =
        Provider.of<UniversitiesViewModel>(context, listen: false);
    viewModel.fetchSortedUniversities();
  }

  void _uniSelected({required University item}) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => UniversityDetailsScreen(university: item),
      ),
    );
  }

  Widget _universityListCell({
    required University university,
    double? bottomPadding,
  }) {
    return Tactile(
      onPressed: () {
        _uniSelected(item: university);
      },
      child: UniversityCell(
        university: university,
        bottomPadding: bottomPadding,
        key: UniqueKey(),
      ),
    );
  }

  Widget _loadingIndicator() {
    return Container(
      alignment: Alignment.center,
      child: const Padding(
        padding: EdgeInsets.only(top: 50),
        child: SizedBox(
          height: 30,
          width: 30,
          child: material.CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _errorStateWidget({required String errorMessage}) {
    return Container(
      alignment: Alignment.center,
      child: Text(errorMessage),
    );
  }

  Widget _universitiesList({required List<University> universities}) {
    return ListView.builder(
      controller: _scrollController,
      padding:
          EdgeInsets.only(bottom: 150, top: MediaQuery.of(context).padding.top),
      itemCount: universities.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return _universityListCell(
          university: universities[index],
          bottomPadding: index == universities.length ? 150 : 0,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UniversitiesViewModel>(
      builder: (_, viewModel, child) {
        if (viewModel.universities.isEmpty && viewModel.isLoading) {
          return _loadingIndicator();
        } else if (viewModel.universities.isEmpty &&
            viewModel.fetchErrorMessage.isNotEmpty) {
          return _errorStateWidget(errorMessage: viewModel.fetchErrorMessage);
        } else {
          return _universitiesList(universities: viewModel.universities);
        }
      },
    );
  }
}
