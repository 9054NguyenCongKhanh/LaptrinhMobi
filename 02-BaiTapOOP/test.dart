import 'cuahang.dart';
import 'dienthoai.dart';
import 'hoadon.dart';
void main() {
  // Tạo điện thoại
  DienThoai dt1 = DienThoai("DT-001", "iPhone 14", "Apple", 20000, 25000, 10, true);
  DienThoai dt2 = DienThoai("DT-002", "Galaxy S23", "Samsung", 15000, 20000, 5, true);
  DienThoai dt3 = DienThoai("DT-003", "Xiaomi Mi 13", "Xiaomi", 12000, 15000, 7, true);


  // Tạo cửa hàng
  CuaHang cuaHang = CuaHang("Cửa hàng A", "123 Đường ABC");
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);
  cuaHang.themDienThoai(dt3);
  // Hiển thị danh sách điện thoại
  print("Danh sách điện thoại:");
  cuaHang.hienThiDanhSachDienThoai();

  // Tạo hóa đơn
  HoaDon hd1 = HoaDon("HD-001", DateTime.now(), dt1, 2, 24000, "Nguyễn Văn A", "0123456789");
  cuaHang.taoHoaDon(hd1);

  // Hiển thị danh sách hóa đơn
  print("\nDanh sách hóa đơn:");
  cuaHang.hienThiDanhSachHoaDon();

  // Thống kê doanh thu và lợi nhuận
  print("\nThống kê doanh thu và lợi nhuận:");
  DateTime tuNgay = DateTime(2023, 1, 1);
  DateTime denNgay = DateTime(2024, 12, 31);
  print("Doanh thu: ${cuaHang.tinhTongDoanhThu(tuNgay, denNgay)}");
  print("Lợi nhuận: ${cuaHang.tinhTongLoiNhuan(tuNgay, denNgay)}");
}
