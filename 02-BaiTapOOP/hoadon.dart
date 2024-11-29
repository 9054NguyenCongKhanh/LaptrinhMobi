import 'dienthoai.dart';

class HoaDon {
  // Thuộc tính private
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor đầy đủ tham số
  HoaDon(
    this._maHoaDon,
    this._ngayBan,
    this._dienThoai,
    this._soLuongMua,
    this._giaBanThucTe,
    this._tenKhachHang,
    this._soDienThoaiKhach,
  ) {
    if (!RegExp(r'^HD-\d{3}$').hasMatch(_maHoaDon)) {
      throw Exception("Mã hóa đơn không hợp lệ (VD: HD-001).");
    }
    if (_ngayBan.isAfter(DateTime.now())) {
      throw Exception("Ngày bán không thể sau ngày hiện tại.");
    }
    if (_soLuongMua <= 0 || _soLuongMua > _dienThoai.soLuongTonKho) {
      throw Exception("Số lượng mua phải lớn hơn 0 và không vượt quá tồn kho.");
    }
    if (_giaBanThucTe <= 0) {
      throw Exception("Giá bán thực tế phải lớn hơn 0.");
    }
    if (_tenKhachHang.isEmpty) {
      throw Exception("Tên khách hàng không được để trống.");
    }
    if (!RegExp(r'^\d{10,11}$').hasMatch(_soDienThoaiKhach)) {
      throw Exception("Số điện thoại không hợp lệ (chỉ chứa 10-11 số).");
    }
  }

  // Getter và Setter
  String get maHoaDon => _maHoaDon;

  DateTime get ngayBan => _ngayBan;

  DienThoai get dienThoai => _dienThoai;

  int get soLuongMua => _soLuongMua;

  double get giaBanThucTe => _giaBanThucTe;

  String get tenKhachHang => _tenKhachHang;

  String get soDienThoaiKhach => _soDienThoaiKhach;

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    return _soLuongMua * (_giaBanThucTe - _dienThoai.giaNhap);
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print("Mã hóa đơn: $_maHoaDon");
    print("Ngày bán: $_ngayBan");
    print("Khách hàng: $_tenKhachHang");
    print("Số điện thoại khách: $_soDienThoaiKhach");
    print("Điện thoại: ${_dienThoai.tenDienThoai}");
    print("Số lượng mua: $_soLuongMua");
    print("Giá bán thực tế: $_giaBanThucTe");
    print("Tổng tiền: ${tinhTongTien()}");
    print("Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}");
  }
}