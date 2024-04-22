import '../models/file_data_model.dart';

class FileRepository {
  List<FileDataModel> files = [
    FileDataModel(
      iconPath:
          "https://p.kindpng.com/picc/s/159-1595798_python-computer-icons-programmer-javascript-programming-python-logo.png",
      fileName: "PythonBooks",
      fileUrl: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
      categoryName: 'Dasturlash',
    ),
    FileDataModel(
      iconPath:
          "https://png.pngtree.com/png-vector/20220812/ourlarge/pngtree-flutter-logo-icon-png-image_6108134.png",
      fileName: "Flutter",
      fileUrl: "https://s3.amazonaws.com/ebooks.syncfusion.com/downloads/flutter-succinctly/flutter-succinctly.pdf",
      categoryName: 'Dasturlash',
    ),
  ];
}

/*
Dasturlash
Sarguzasht
Maktab Darsliklari
Ertaklar
Badiiy
Hajviy
 */
