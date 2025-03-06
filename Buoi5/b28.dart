void main(List<String> args) {
  int x = 100;

  if (x is int) {
    print("dayla1conso");
  } else if (x % 2 == 0) {
    print('Day la so chan');
  } else {
    print('day la so le');
  }

  switch (x) {
    case 10:
      print(1);
      print(2);
    case 2:

      break;
    default:
  }
}
