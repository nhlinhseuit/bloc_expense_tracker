library expense_repository;

//? Định nghĩa một thư viện có tên là expense_repository.
//? Dùng để tổ chức code trong các package lớn, giúp dễ dàng import các file liên quan mà không cần chỉ định chi tiết từng file.
//? Hữu ích khi tạo package Dart hoặc Flutter để sử dụng lại trong nhiều dự án.

export 'src/entities/entities.dart';
export 'src/models/models.dart';
export 'src/expense_repo.dart';
export 'src/firebase_expense_repo.dart';

//? Khi một file Dart sử dụng export, nó cho phép các file khác trong package có thể truy cập nội dung của các file được export mà không cần import trực tiếp chúng.
//? => Giúp người dùng import thư viện dễ dàng hơn. => Giấu đi cấu trúc thư mục bên trong, chỉ cần import mỗi file expense_repository tại nơi cần sd