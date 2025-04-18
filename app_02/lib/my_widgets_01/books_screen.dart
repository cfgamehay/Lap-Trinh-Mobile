// import 'package:flutter/material.dart';
// // import 'myWidget01/book_detail_screen.dart'; // Import màn hình chi tiết
//
// class BooksScreen extends StatelessWidget {
//   // Giả lập danh sách sách
//   final List<Map<String, String>> books = [
//     {
//       'title': 'Giáo trình lập trình trên thiết bị di động',
//       'author': 'Trường Đại Học Công Nghệ Đồng Nai',
//       'authorLink': 'https://www.dongnai.gov.vn', // Link giả lập
//     },
//     {
//       'title': 'Kiến trúc ứng dụng Flutter',
//       'author': 'Flutter Core',
//       'authorLink': 'https://flutter.dev', // Link giả lập
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF5E6F0), // Light pink background
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0, // No shadow
//         title: Text(
//           'Books',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.people, color: Colors.purple),
//             onPressed: () {
//               // Action for "Popular" tab
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.new_releases, color: Colors.purple),
//             onPressed: () {
//               // Action for "New" tab
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.menu, color: Colors.purple),
//             onPressed: () {
//               // Action for "All" tab
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(16.0),
//         itemCount: books.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               ListTile(
//                 title: Text(
//                   books[index]['title']!,
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//                 subtitle: Text(
//                   books[index]['author']!,
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                 ),
//                 onTap: () {
//                   // Điều hướng đến màn hình chi tiết khi nhấn vào item
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => BookDetailScreen(
//                         title: books[index]['title']!,
//                         author: books[index]['author']!,
//                         authorLink: books[index]['authorLink']!,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               Divider(),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }