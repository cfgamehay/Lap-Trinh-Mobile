import 'dart:async';
import 'dart:io';

void viduStreamDemSo() {
  print("Bắt đầu đếm");
  Stream<int> stream = Stream.periodic(
    Duration(seconds: 1),
    (x) => x += 5,
  ).take(5);

  //lắng nghe
  stream.listen(
    (x) => print(x),
    onDone: () => print("Ai không trốn bị bắt ráng chịu"),
    onError: (err) => print("Hold on"),
  );
}

// Ví dụ 2: Tạo và điều khiển stream với StreamController
void viDuStreamController() {
  print("=== Ví dụ 3: Stream Controller ===");

  // Tạo bộ điều khiển stream
  StreamController<String> controller = StreamController<String>();
  // Lắng nghe stream
  controller.stream.listen(
    (tinNhan) => print("Tin nhắn mới: $tinNhan"),
    onDone: () => print("Không còn tin nhắn nào nữa"),
  );

  // Gửi tin nhắn vào stream
  print("Đang gửi tin nhắn đầu tiên...");
  controller.add("Xin chào!");

  // Gửi thêm tin nhắn sau 2 giây
  Future.delayed(Duration(seconds: 2), () {
    print("Đang gửi tin nhắn thứ hai...");
    controller.add("Bạn khỏe không?");
  });

  // Gửi tin nhắn cuối và đóng stream sau 4 giây
  Future.delayed(Duration(seconds: 4), () {
    print("Đang gửi tin nhắn cuối...");
    controller.add("Tạm biệt!");
    controller.close();
  });
}

void main() async {
  // viduStreamDemSo();
  // viDuStreamController();

  StreamController<String> controller = StreamController<String>();

  controller.stream.listen(
    (tinNhan) => print("Tin nhắn mới: $tinNhan"),
    onDone: () => print("Không còn tin nhắn nào nữa"),
  );
  String message = '';
  do {
    var message = stdin.readLineSync() ?? '';
    controller.add(message);
    print(message != 'exit');
  } while (message != '0');
}
