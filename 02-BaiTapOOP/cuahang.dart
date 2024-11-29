import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // Thêm điện thoại mới
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
  }

  // Cập nhật thông tin điện thoại
  void capNhatThongTinDienThoai(String maDienThoai, DienThoai dienThoaiMoi) {
    for (int i = 0; i < _danhSachDienThoai.length; i++) {
      if (_danhSachDienThoai[i].maDienThoai == maDienThoai) {
        _danhSachDienThoai[i] = dienThoaiMoi;
        return;
      }
    }
    throw Exception("Không tìm thấy điện thoại với mã $maDienThoai.");
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanh(String maDienThoai) {
    for (var dienThoai in _danhSachDienThoai) {
      if (dienThoai.maDienThoai == maDienThoai) {
        dienThoai.trangThai = false;
        return;
      }
    }
    throw Exception("Không tìm thấy điện thoại với mã $maDienThoai.");
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    for (var dienThoai in _danhSachDienThoai) {
      dienThoai.hienThiThongTin();
      print("-------------");
    }
  }

  // Tạo hóa đơn mới
  void taoHoaDon(HoaDon hoaDon) {
    if (!hoaDon.dienThoai.coTheBan()) {
      throw Exception("Điện thoại không khả dụng để bán.");
    }
    hoaDon.dienThoai.soLuongTonKho -= hoaDon.soLuongMua;
    _danhSachHoaDon.add(hoaDon);
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    for (var hoaDon in _danhSachHoaDon) {
      hoaDon.hienThiThongTinHoaDon();
      print("-------------");
    }
  }

  // Tính tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double doanhThu = 0.0;
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        doanhThu += hoaDon.tinhTongTien();
      }
    }
    return doanhThu;
  }

  // Tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    double loiNhuan = 0.0;
    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay)) {
        loiNhuan += hoaDon.tinhLoiNhuanThucTe();
      }
    }
    return loiNhuan;
  }
}
