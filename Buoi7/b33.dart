import 'dart:async';
//async await
//async dùng cho phương thức xử lý bất đồng bộ
//await sẽ làm những đoạn bất đồng bộ đó chạy đồng bộ

void main(List<String> args) {
  hamChinh2();
}

Future<String> layTen() async {
  return await "Nguen van a";
}

// khi nào await thực hiện xong thì mới tiếp tục thực thi mấy thằng khác

Future<String> taiDuLieu() async {
  return Future.delayed(Duration(seconds: 4), () => 'Du lieu da tai xong');
}

void hamChinh1() {
  print("Bat dau tai");
  Future<String> f = taiDuLieu();
  f.then((ketqua) {
    print(ketqua);
  });
  print('tiep tuc');
}

void hamChinh2() async {
  print("Bat dau tai");
  String f = await taiDuLieu();
  print(f);

  print('tiep tuc');
}
