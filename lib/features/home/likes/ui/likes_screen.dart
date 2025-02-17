import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/data/models/book.dart';
import '../../../../common/data/models/songext.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/widgets/list_items/search_song_item.dart';
import '../../../../common/widgets/progress/general_progress.dart';
import '../../../presentor/ui/presentor_screen.dart';
import '../../common/bloc/home_bloc.dart';

class LikesScreen extends StatelessWidget {
  final List<Book> books;

  const LikesScreen({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeFilteredState && state.likes.isNotEmpty) {
          return ListView.builder(
            itemCount: state.likes.length,
            itemBuilder: (context, index) {
              final SongExt like = state.likes[index];
              return SearchSongItem(
                song: like,
                height: 50,
                onTap: () {
                  Book book = books[0];
                  try {
                    book = books.firstWhere((b) => b.bookId == like.book);
                  } catch (e) {
                    logger('Failed to get the book: $e');
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PresentorScreen(
                        song: like,
                        book: book,
                        songs: state.songs,
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else {
          return EmptyState(
            title: 'You have not liked a song yet.',
          );
        }
      },
    );
  }
}
