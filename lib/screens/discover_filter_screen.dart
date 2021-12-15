import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/data_manager.dart';
import 'package:movies/utils/flags.dart';
import 'package:movies/utils/url_manager.dart';
import 'package:movies/widgets/description_lable.dart';

class DiscoverFilter extends StatefulWidget {
  static TextEditingController name = TextEditingController();
  static var genre = DataManager.genres.first['id'];
  static var language = DataManager.languages.first['iso_639_1'];
  static var region = DataManager.regions.first['iso_3166_1'];
  static bool includeAdult = false;
  @override
  State<StatefulWidget> createState() => _DiscoverFilter();
}

class _DiscoverFilter extends State<DiscoverFilter> {
  bool isChange = false;
  @override
  void initState() {
    super.initState();
  }

  Future<bool> gotoBack() async {
    if (isChange) UrlManager.discover = 0;
    Navigator.of(context).pop(isChange);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: gotoBack,
      child: Scaffold(
        backgroundColor: Flags.background,
        appBar: AppBar(
          title: const Text("Filter"),
          actions: [
            if (isChange)
              Center(
                child: InkWell(
                  onTap: () => gotoBack(),
                  child: const Text(
                    "Search",
                    style: TextStyle(
                      fontFamily: "museo700",
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            const SizedBox(width: 10)
          ],
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: DiscoverFilter.name,
                    autofocus: false,
                    onSubmitted: (value) => FocusScope.of(context).unfocus(),
                    onChanged: (value) {
                      if (!isChange) setState(() => isChange = true);
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: "Movie Name",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const DescriptionLable(lable: "Laguage"),
                  DropdownButton(
                    value: DiscoverFilter.language,
                    isExpanded: true,
                    items: DataManager.languages
                        .map((e) => DropdownMenuItem(
                              child: Text(e['english_name']),
                              value: e['iso_639_1'],
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        DiscoverFilter.language = value;
                        isChange = true;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const DescriptionLable(lable: "Genre"),
                  DropdownButton(
                    value: DiscoverFilter.genre,
                    isExpanded: true,
                    items: DataManager.genres
                        .map((e) => DropdownMenuItem(
                              child: Text(e['name']),
                              value: e['id'],
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        DiscoverFilter.genre = value;
                        isChange = true;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const DescriptionLable(lable: "Region"),
                  DropdownButton(
                    value: DiscoverFilter.region,
                    isExpanded: true,
                    items: DataManager.regions
                        .map((e) => DropdownMenuItem(
                              child: Text(e['english_name']),
                              value: e['iso_3166_1'],
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        DiscoverFilter.region = value;
                        isChange = true;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const DescriptionLable(lable: "Include Adult"),
                      Checkbox(
                          value: DiscoverFilter.includeAdult,
                          onChanged: (value) {
                            setState(() {
                              DiscoverFilter.includeAdult = value!;
                              isChange = true;
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
