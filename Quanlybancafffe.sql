CREATE DATABASE QuanLybanCaffe;
GO

USE QuanLybanCaffe;
GO

CREATE TABLE NhanVien (
    TenNV NVARCHAR(255),
    MaNV VARCHAR(50) PRIMARY KEY,
    DiaChi NVARCHAR(255),
    SDT INT,
    VaiTro NVARCHAR(50), 
    Gmail VARCHAR(255),
    GioiTinh BIT
);

CREATE TABLE TaiKhoan (
    [User] VARCHAR(50) PRIMARY KEY,
    [Password] VARCHAR(50)
);

CREATE TABLE NhaCungCap (
    MaNCC VARCHAR(50) PRIMARY KEY,
    TenNCC NVARCHAR(255),
    DiaChi NVARCHAR(255),
    SDT INT,
    Email VARCHAR(255)
);

CREATE TABLE SanPham (
    MaSP VARCHAR(50) PRIMARY KEY,
    TenSP NVARCHAR(255),
    SoLuong INT,
    DonGia FLOAT,
    MaNV VARCHAR(50),
    MaNCC VARCHAR(50),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
);

CREATE TABLE ChiTietPhieuXuat (
    MaPX VARCHAR(50),
    MaSP VARCHAR(50),
    SoLuong INT,
    DonGia FLOAT,
    ThanhTien FLOAT,
    PRIMARY KEY (MaPX, MaSP),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

CREATE TABLE HoaDon (
    MaHD VARCHAR(50) PRIMARY KEY,
    SoLuong INT,
    NgayMua DATE,
    ThanhTien FLOAT,
    MaNV VARCHAR(50),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

INSERT INTO NhanVien (TenNV, MaNV, DiaChi, SDT, VaiTro, Gmail, GioiTinh) 
VALUES 
('Lionel Messi', 'NV001', '123 ABC Street', 123456789, N'pha chế', 'messi@example.com', 1),
('Cristiano Ronaldo', 'NV002', '456 DEF Street', 987654321, N'phục vụ', 'ronaldo@example.com', 1),
('Neymar Jr', 'NV003', '789 GHI Street', 112233445, N'thu ngân', 'neymar@example.com', 1),
('Kylian Mbappe', 'NV004', '321 JKL Street', 223344556, N'pha chế', 'mbappe@example.com', 1),
('Kevin De Bruyne', 'NV005', '654 MNO Street', 334455667, N'quản lý', 'debruyne@example.com', 1),
('Robert Lewandowski', 'NV006', '987 PQR Street', 445566778, N'phục vụ', 'lewandowski@example.com', 1),
('Sergio Ramos', 'NV007', '741 STU Street', 556677889, N'pha chế', 'ramos@example.com', 1);

INSERT INTO TaiKhoan ([User], [Password])
VALUES 
('messi', 'passmessi'),
('ronaldo', 'passronaldo'),
('neymar', 'passneymar'),
('mbappe', 'passmbappe'),
('debruyne', 'passdebruyne'),
('lewandowski', 'passlewandowski'),
('ramos', 'passramos');

INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, SDT, Email)
VALUES 
('NCC001', N'Nhà cung cấp 1', '123 XYZ Street', 111222333, 'ncc1@example.com'),
('NCC002', N'Nhà cung cấp 2', '456 LMN Street', 444555666, 'ncc2@example.com'),
('NCC003', N'Nhà cung cấp 3', '789 OPQ Street', 777888999, 'ncc3@example.com'),
('NCC004', N'Nhà cung cấp 4', '321 RST Street', 101112131, 'ncc4@example.com'),
('NCC005', N'Nhà cung cấp 5', '654 UVW Street', 141516171, 'ncc5@example.com'),
('NCC006', N'Nhà cung cấp 6', '987 DEF Street', 181920212, 'ncc6@example.com'),
('NCC007', N'Nhà cung cấp 7', '741 GHI Street', 232425262, 'ncc7@example.com');

INSERT INTO SanPham (MaSP, TenSP, SoLuong, DonGia, MaNV, MaNCC) 
VALUES 
('SP001', 'Cafe Đen', 100, 15000.50, 'NV001', 'NCC001'),
('SP002', 'Cafe Sữa', 200, 20000.75, 'NV002', 'NCC002'),
('SP003', 'Latte', 150, 25000.00, 'NV003', 'NCC003'),
('SP004', 'Cappuccino', 120, 18000.30, 'NV004', 'NCC004'),
('SP005', 'Espresso', 170, 22000.80, 'NV005', 'NCC005'),
('SP006', 'Americano', 130, 19000.50, 'NV006', 'NCC006'),
('SP007', 'Mocha', 160, 21000.70, 'NV007', 'NCC007');

INSERT INTO ChiTietPhieuXuat (MaPX, MaSP, SoLuong, DonGia, ThanhTien) 
VALUES 
('PX001', 'SP001', 10, 15000.50, 150005),
('PX002', 'SP002', 20, 20000.75, 400015),
('PX003', 'SP003', 15, 25000.00, 375000),
('PX004', 'SP004', 12, 18000.30, 216003.6),
('PX005', 'SP005', 17, 22000.80, 374013.6),
('PX006', 'SP006', 13, 19000.50, 247006.5),
('PX007', 'SP007', 16, 21000.70, 336011.2);

INSERT INTO HoaDon (MaHD, SoLuong, NgayMua, ThanhTien, MaNV) 
VALUES 
('HD001', 10, '2024-07-10', 150005, 'NV001'),
('HD002', 20, '2024-07-11', 400015, 'NV002'),
('HD003', 15, '2024-07-12', 375000, 'NV003'),
('HD004', 12, '2024-07-13', 216003.6, 'NV004'),
('HD005', 17, '2024-07-14', 374013.6, 'NV005'),
('HD006', 13, '2024-07-15', 247006.5, 'NV006'),
('HD007', 16, '2024-07-16', 336011.2, 'NV007');
