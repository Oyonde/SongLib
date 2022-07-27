import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// The controller for the Home screen
class HomeController extends GetxController {
  final GetStorage userData = GetStorage();

  final ScrollController listsScroller =
      ScrollController(initialScrollOffset: 0);

  final ScrollController likesScroller =
      ScrollController(initialScrollOffset: 0);

  final ScrollController songScroller =
      ScrollController(initialScrollOffset: 0);

  final ScrollController notesScroller =
      ScrollController(initialScrollOffset: 0);

  bool isTab1Busy = false,
      isTab2Busy = false,
      isTab3Busy = false,
      isTab4Busy = false;
  String selectedBooks = "";
  int mainBook = 0;

  List<Book>? books = [];
  List<Song>? searches = [], songs = [], likes = [];

  List<Listed>? listeds = [];
  List<Draft>? drafts = [];

  BookDaoStorage? bookDao;
  DraftDaoStorage? draftDao;
  HistoryDaoStorage? historyDao;
  ListedDaoStorage? listedDao;
  SearchDaoStorage? searchDao;
  SongDaoStorage? songDao;

  String? title, content;
  TextEditingController? titleController, contentController;

  @override
  void onInit() {
    super.onInit();
    bookDao = Get.find<BookDaoStorage>();
    draftDao = Get.find<DraftDaoStorage>();
    historyDao = Get.find<HistoryDaoStorage>();
    listedDao = Get.find<ListedDaoStorage>();
    searchDao = Get.find<SearchDaoStorage>();
    songDao = Get.find<SongDaoStorage>();

    titleController = TextEditingController();
    contentController = TextEditingController();

    selectedBooks = userData.read(PrefKeys.selectedBooks);
    var bookids = selectedBooks.split(",");
    mainBook = int.parse(bookids[0]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// Get the lists data
  Future<void> fetchListData() async {
    isTab1Busy = true;
    update();

    listeds = await listedDao!.getAllListeds();

    isTab1Busy = false;
    update();
  }

  /// Get the songs data
  Future<void> fetchSongData() async {
    isTab2Busy = true;
    update();

    books = await bookDao!.getAllBooks();
    likes = await songDao!.getLikedSongs();
    songs = searches = await songDao!.getAllSongs();
    songs!.removeWhere((ik) => ik.book != mainBook);

    isTab2Busy = false;
    update();
  }

  /// Get the drafts data
  Future<void> fetchDraftsData() async {
    isTab3Busy = true;
    update();

    drafts = await draftDao!.getAllDrafts();

    isTab3Busy = false;
    update();
  }

  // function to validate creds
  bool validateInput() {
    bool validated = false;
    if (titleController!.text.isNotEmpty) {
      title = titleController!.text;
      content = contentController!.text;

      validated = true;
    } else {
      validated = false;
    }
    return validated;
  }

  Future<void> confirmCancel(BuildContext context) async {
    if (validateInput()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Just a Minute',
            style: titleTextStyle.copyWith(fontSize: 18),
          ),
          content: Text(
            'Are you sure you want to close without saving your changes of the list: ${titleController!.text}?',
            style: normalTextStyle.copyWith(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                saveListed();
              },
              child: const Text("SAVE"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Get.back();
              },
              child: const Text("DON'T SAVE"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CANCEL"),
            ),
          ],
        ),
      );
    } else {
      Get.back();
    }
  }

  /// Save changes for a liste be it a new one or simply updating an old one
  Future<bool?> saveListed() async {
    bool? success;

    if (validateInput()) {
      isTab1Busy = true;
      update();

      Listed listed = Listed(
        objectId: '',
        title: titleController!.text,
        description: contentController!.text,
      );
      listedDao!.createListed(listed);

      isTab1Busy = false;
      update();
    }

    return success;
  }
}
