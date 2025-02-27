void main(List<String> args) {
  Runes smilyFace = Runes('😀');

  String smilyFaceString = String.fromCharCodes(smilyFace);

  print(smilyFace);
  print(smilyFaceString);
}
//Runes trong Dart được sử dụng để biểu diễn chuỗi Unicode. Mỗi Runes là một tập hợp của các ký tự Unicode và được sử dụng khi bạn cần làm việc với các ký tự đặc biệt hoặc emoji.