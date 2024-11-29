class DienThoai {
  // Thuộc tính private
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  // Constructor
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTonKho, this._trangThai);

  // Getter và Setter với validation
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String maDienThoai) {
    if (RegExp(r'^DT-\d{3}$').hasMatch(maDienThoai)) {
      _maDienThoai = maDienThoai;
    } else {
      throw Exception("Mã điện thoại không hợp lệ (VD: DT-001).");
    }
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String tenDienThoai) {
    if (tenDienThoai.isNotEmpty) {
      _tenDienThoai = tenDienThoai;
    } else {
      throw Exception("Tên điện thoại không được rỗng.");
    }
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String hangSanXuat) {
    if (hangSanXuat.isNotEmpty) {
      _hangSanXuat = hangSanXuat;
    } else {
      throw Exception("Hãng sản xuất không được rỗng.");
    }
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double giaNhap) {
    if (giaNhap > 0) {
      _giaNhap = giaNhap;
    } else {
      throw Exception("Giá nhập phải lớn hơn 0.");
    }
  }

  double get giaBan => _giaBan;
  set giaBan(double giaBan) {
    if (giaBan > _giaNhap) {
      _giaBan = giaBan;
    } else {
      throw Exception("Giá bán phải lớn hơn giá nhập.");
    }
  }

  int get soLuongTonKho => _soLuongTonKho;
  set soLuongTonKho(int soLuongTonKho) {
    if (soLuongTonKho >= 0) {
      _soLuongTonKho = soLuongTonKho;
    } else {
      throw Exception("Số lượng tồn kho phải >= 0.");
    }
  }

  bool get trangThai => _trangThai;
  set trangThai(bool trangThai) => _trangThai = trangThai;

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return _giaBan - _giaNhap;
  }

  // Phương thức kiểm tra có thể bán không
  bool coTheBan() {
    return _trangThai && _soLuongTonKho > 0;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print("Mã điện thoại: $_maDienThoai");
    print("Tên điện thoại: $_tenDienThoai");
    print("Hãng sản xuất: $_hangSanXuat");
    print("Giá nhập: $_giaNhap");
    print("Giá bán: $_giaBan");
    print("Số lượng tồn kho: $_soLuongTonKho");
    print("Trạng thái: ${_trangThai ? 'Đang kinh doanh' : 'Ngừng kinh doanh'}");
    print("Lợi nhuận dự kiến: ${tinhLoiNhuan()}");
  }
}
