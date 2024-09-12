import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orderfood1/widgets/search_result/search_result_body.dart';


class SearchResultScreen extends StatefulWidget {
  final String initialSearch;
  const SearchResultScreen({
    super.key,
    required this.initialSearch,
  });

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late TextEditingController _searchController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEEEEEE),
          title: TextFormField(
            controller: _searchController,
            textAlign: TextAlign.start,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black.withOpacity(0.9),
              fontFamily: "SF-PRO",
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/back-button.svg"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const SearchResultBody(),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialSearch);
  }
}
