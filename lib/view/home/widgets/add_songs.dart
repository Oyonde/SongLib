import 'package:flutter/material.dart';

import '../../../model/base/songext.dart';
import '../../../theme/theme_colors.dart';
import '../../../util/constants/utilities.dart';
import '../../../viewmodel/home/home_vm.dart';
import '../../../viewmodel/lists/list_view_vm.dart';
import '../../../widget/general/list_items.dart';

class AddSongs extends SearchDelegate<List> {
  final HomeVm homeVm;
  final ListViewVm listVm;
  final double? height;

  AddSongs(BuildContext context, this.homeVm, this.listVm, this.height);

  @override
  String get searchFieldLabel => "Search a Song";

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: ThemeColors.primary),
      textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, homeVm.songs!),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) => searchThis(context);

  @override
  Widget buildSuggestions(BuildContext context) => searchThis(context);

  Widget searchThis(BuildContext context) {
    List<SongExt> matchQuery = homeVm.songs!.where((s) {
      return (isNumeric(query) && s.songNo == int.parse(query)) ||
          s.title!.toLowerCase().contains(query.toLowerCase()) ||
          s.alias!.toLowerCase().contains(query.toLowerCase()) ||
          s.content!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      padding: EdgeInsets.all(height! * 0.015),
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return SongItem(
          song: result,
          height: height!,
          onTap: () {
            listVm.addSongToList(result);
            close(context, homeVm.songs!);
          },
        );
      },
    );
  }
}
