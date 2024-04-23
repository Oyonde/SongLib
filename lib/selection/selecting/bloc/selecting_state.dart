part of 'selecting_bloc.dart';

final class SelectingState extends Equatable {
  const SelectingState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.books = const [],
    this.feedback = '',
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final List<Book> books;
  final String feedback;
  final bool isValid;

  SelectingState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Password? password,
    List<Book>? books,
    String? feedback,
    bool? isValid,
  }) {
    return SelectingState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      books: books ?? this.books,
      feedback: feedback ?? this.feedback,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, username, password, books, feedback];
}
