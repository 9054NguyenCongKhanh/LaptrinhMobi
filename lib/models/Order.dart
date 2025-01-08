import 'food.dart';

class Order {
  String id; // ID của đơn hàng
  String userId; // ID của người dùng
  List<OrderItem> items; // Danh sách các món ăn trong đơn hàng
  double totalAmount; // Tổng giá trị đơn hàng
  String status; // Trạng thái đơn hàng (e.g., 'pending', 'completed', 'cancelled')
  DateTime createdAt; // Thời gian tạo đơn hàng
  DateTime? completedAt; // Thời gian hoàn thành đơn hàng

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    this.completedAt,
  });
}

class OrderItem {
  Food food; // Món ăn
  int quantity; // Số lượng món ăn
  List<Addon> addons; // Các addon đã chọn

  OrderItem({
    required this.food,
    required this.quantity,
    required this.addons,
  });
}
