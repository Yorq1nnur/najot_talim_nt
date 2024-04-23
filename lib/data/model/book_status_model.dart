class BookStatusModel {
  final bool isExist;
  final String fileLocation;

  BookStatusModel({
    required this.fileLocation,
    required this.isExist,
  });

  BookStatusModel copyWith({bool? isExist, String? newFileLocation}) =>
      BookStatusModel(
        fileLocation: newFileLocation ?? fileLocation,
        isExist: isExist ?? this.isExist,
      );
}
