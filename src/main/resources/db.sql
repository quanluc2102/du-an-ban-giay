﻿--create database ShopShoe
--use ShopShoe
--drop database ShopShoe
CREATE TABLE tai_khoan (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  username NVARCHAR(255) NOT NULL,
  email NVARCHAR(255) NOT NULL,
  ten NVARCHAR(255) NOT NULL,
  dia_chi NVARCHAR(255) NOT NULL,
  ngay_tao DATETIME,
  ngay_cap_nhat DATETIME,
  password NVARCHAR(255) NOT NULL,
  anh NVARCHAR(255),
  sdt NVARCHAR(255) NOT NULL,
  trang_thai BIT NOT NULL
);
-- Create vai_tro table
CREATE TABLE quyen (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  ten NVARCHAR(255) NOT NULL,
  trang_thai BIT NOT NULL
);
-- Create phan_quyen table
CREATE TABLE phan_quyen (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  tai_khoan_id BIGINT,
  quyen_id BIGINT,
  FOREIGN KEY (tai_khoan_id) REFERENCES tai_khoan(id),
  FOREIGN KEY (quyen_id) REFERENCES quyen(id)
);



-- Create kich_thuoc table
CREATE TABLE kich_thuoc (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  gia_tri INT NOT NULL,
  trang_thai BIT NOT NULL
);

-- Create danh_muc table
CREATE TABLE danh_muc (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  ten NVARCHAR(255) NOT NULL,
  trang_thai BIT NOT NULL
);

-- Create kich_thuocmau_sacchi_tiet table


-- Create mau_sac table
CREATE TABLE mau_sac (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  gia_tri INT NOT NULL,
  ten NVARCHAR(255) NOT NULL,
  trang_thai BIT NOT NULL
);


-- Create thanh_toan table
CREATE TABLE thanh_toan (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  ten NVARCHAR(255) NOT NULL,
  trang_thai NVARCHAR(255) NOT NULL
);

-- Create thuong_hieu table
CREATE TABLE thuong_hieu (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  ten NVARCHAR(255) NOT NULL,
  trang_thai BIT NOT NULL
);

-- Create thong_tin_nguoi_dung table
CREATE TABLE thong_tin_nguoi_dung (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  dia_chi NVARCHAR(255) NOT NULL,
  ngay_sinh DATE NOT NULL,
  sdt NVARCHAR(255) NOT NULL,
  ten NVARCHAR(255) NOT NULL,
  ngay_cap_nhat DATETIME,
  tai_khoan_id BIGINT,
  FOREIGN KEY (tai_khoan_id) REFERENCES tai_khoan(id)
);

-- Create san_pham table
CREATE TABLE san_pham (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  ngay_tao DATE NOT NULL,
  gia_nhap float NOT NULL,
  ten NVARCHAR(255) NOT NULL,
  gia_ban float NOT NULL,
  so_luong INT NOT NULL,
  trang_thai INT NOT NULL,	
 ngay_cap_nhat DATETIME,
 mo_ta NVARCHAR(255) NOT NULL
 
);

CREATE TABLE kich_thuoc_mau_sac (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  so_luong INT NOT NULL,
  trang_thai INT NOT NULL,
  mau_sac_id BIGINT,
  san_pham_id BIGINT,
  kich_thuoc_id BIGINT,
  FOREIGN KEY (mau_sac_id) REFERENCES mau_sac(id),
  FOREIGN KEY (san_pham_id) REFERENCES san_pham(id),
  FOREIGN KEY (kich_thuoc_id) REFERENCES kich_thuoc(id)
);
--hoa don
CREATE TABLE hoa_don (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  ngay_tao DATE NOT NULL,
  ghi_chu NVARCHAR(255) NOT NULL,
  ngay_cap_nhat DATETIME,
  trang_thai INT NOT NULL,
  tai_khoan_id BIGINT,
  thanh_toan_id BIGINT,
  FOREIGN KEY (tai_khoan_id) REFERENCES tai_khoan(id),

  FOREIGN KEY (thanh_toan_id) REFERENCES thanh_toan(id)
);

CREATE TABLE gio_hang (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  ngay_tao DATE NOT NULL,
  ghi_chu NVARCHAR(255) NOT NULL,
  ngay_cap_nhat DATETIME,
  trang_thai INT NOT NULL,
  tai_khoan_id BIGINT,

  FOREIGN KEY (tai_khoan_id) REFERENCES tai_khoan(id),

);
-- Create hoa_donchi_tiet table
CREATE TABLE hoa_don_chi_tiet (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  ghi_chu NVARCHAR(255),

  so_luong INT NOT NULL,
  hoa_don_id BIGINT,
  san_pham_id BIGINT,

  FOREIGN KEY (hoa_don_id) REFERENCES hoa_don(id),
  FOREIGN KEY (san_pham_id) REFERENCES san_pham(id),
 
)

-- Create san_pham_danh_muc table
CREATE TABLE san_pham_danh_muc (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  san_pham_id BIGINT,
  danh_muc_id BIGINT,
  FOREIGN KEY (san_pham_id) REFERENCES san_pham(id),
  FOREIGN KEY (danh_muc_id) REFERENCES danh_muc(id)
);

-- Create san_pham_thuong_hieu table

CREATE TABLE san_pham_thuong_hieu (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  san_pham_id BIGINT,
  thuong_hieu_id BIGINT,
  FOREIGN KEY (san_pham_id) REFERENCES san_pham(id),
  FOREIGN KEY (thuong_hieu_id) REFERENCES thuong_hieu(id)
);

-- Create san_pham_anh table
CREATE TABLE san_pham_anh (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  san_pham_id BIGINT,
  anh NVARCHAR(255),
  FOREIGN KEY (san_pham_id) REFERENCES san_pham(id)
);
-- Create gio_hang table
CREATE TABLE gio_hang_chi_tiet (
id BIGINT PRIMARY KEY IDENTITY(1,1),
gio_hang_id BIGINT,
san_pham_id BIGINT,
so_luong INT NOT NULL,

 FOREIGN KEY (gio_hang_id) REFERENCES gio_hang(id),
FOREIGN KEY (san_pham_id) REFERENCES san_pham(id)
);
CREATE TABLE khuyen_mai (
  id BIGINT PRIMARY KEY IDENTITY(1,1),
  ten VARCHAR(255) NOT NULL,
  mo_ta VARCHAR(255),
  bat_dau DATE NOT NULL,
  ket_thuc DATE NOT NULL,
  giam_gia FLOAT NOT NULL,
 
);



-- Create san_pham_khuyen_mai table
CREATE TABLE san_pham_khuyen_mai (
id BIGINT PRIMARY KEY IDENTITY(1,1),
san_pham_id BIGINT,
khuyen_mai_id BIGINT,
FOREIGN KEY (san_pham_id) REFERENCES san_pham(id),
FOREIGN KEY (khuyen_mai_id) REFERENCES khuyen_mai(id)
);

-- Create hoa_don_khuyen_mai table
CREATE TABLE hoa_don_khuyen_mai (
id BIGINT PRIMARY KEY IDENTITY(1,1),
hoa_don_id BIGINT,
khuyen_mai_id BIGINT,
FOREIGN KEY (hoa_don_id) REFERENCES hoa_don,
FOREIGN KEY (khuyen_mai_id) REFERENCES khuyen_mai(id)
);

use shopShoe

ALTER TABLE khuyen_mai
    ADD  kieu_khuyen_mai int not null;

INSERT INTO quyen (ten, trang_thai)
VALUES
  ('Quyền 1', 1),
  ('Quyền 2', 1),
  ('Quyền 3', 1),
  ('Quyền 4', 1),
  ('Quyền 5', 1);
INSERT INTO tai_khoan (username, email, ten, dia_chi, ngay_tao, ngay_cap_nhat, password, anh, sdt, trang_thai)
VALUES
  ('user1', 'user1@example.com', 'User 1', 'Địa chỉ 1', GETDATE(), GETDATE(), 'password1', 'anh1.jpg', '123456789', 1),
  ('user2', 'user2@example.com', 'User 2', 'Địa chỉ 2', GETDATE(), GETDATE(), 'password2', 'anh2.jpg', '987654321', 1),
  ('user3', 'user3@example.com', 'User 3', 'Địa chỉ 3', GETDATE(), GETDATE(), 'password3', 'anh3.jpg', '456123789', 1),
  ('user4', 'user4@example.com', 'User 4', 'Địa chỉ 4', GETDATE(), GETDATE(), 'password4', 'anh4.jpg', '789123456', 1),
  ('user5', 'user5@example.com', 'User 5', 'Địa chỉ 5', GETDATE(), GETDATE(), 'password5', 'anh5.jpg', '321987654', 1);
INSERT INTO phan_quyen (tai_khoan_id, quyen_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);
INSERT INTO danh_muc (ten, trang_thai)
VALUES
  ('Danh mục 1', 1),
  ('Danh mục 2', 1),
  ('Danh mục 3', 1),
  ('Danh mục 4', 1),
  ('Danh mục 5', 1);
INSERT INTO mau_sac (gia_tri, ten, trang_thai)
VALUES
  (1, 'Màu 1', 1),
  (2, 'Màu 2', 1),
  (3, 'Màu 3', 1),
  (4, 'Màu 4', 1),
  (5, 'Màu 5', 1);
  INSERT INTO kich_thuoc (gia_tri, trang_thai)
VALUES
  (36, 1),
  (37, 1),
  (38, 1),
  (39, 1),
  (40, 1);

INSERT INTO thanh_toan (ten, trang_thai)
VALUES
  ('Thanh toán 1', 'Trạng thái 1'),
  ('Thanh toán 2', 'Trạng thái 2'),
  ('Thanh toán 3', 'Trạng thái 3'),
  ('Thanh toán 4', 'Trạng thái 4'),
  ('Thanh toán 5', 'Trạng thái 5');
INSERT INTO thuong_hieu (ten, trang_thai)
VALUES
  ('Thương hiệu 1', 1),
  ('Thương hiệu 2', 1),
  ('Thương hiệu 3', 1),
  ('Thương hiệu 4', 1),
  ('Thương hiệu 5', 1);
INSERT INTO thong_tin_nguoi_dung (dia_chi, ngay_sinh, sdt, ten, ngay_cap_nhat, tai_khoan_id)
VALUES
  ('Địa chỉ 1', '1990-01-01', '123456789', 'Người dùng 1', GETDATE(), 1),
  ('Địa chỉ 2', '1990-02-02', '987654321', 'Người dùng 2', GETDATE(), 2),
  ('Địa chỉ 3', '1990-03-03', '456123789', 'Người dùng 3', GETDATE(), 3),
  ('Địa chỉ 4', '1990-04-04', '789123456', 'Người dùng 4', GETDATE(), 4),
  ('Địa chỉ 5', '1990-05-05', '321987654', 'Người dùng 5', GETDATE(), 5);
INSERT INTO san_pham (ngay_tao, gia_nhap, ten, gia_ban, so_luong, trang_thai, ngay_cap_nhat, mo_ta)
VALUES
  (GETDATE(), 100, 'Sản phẩm 1', 200, 10, 1, GETDATE(), 'Mô tả sản phẩm 1'),
  (GETDATE(), 150, 'Sản phẩm 2', 250, 15, 1, GETDATE(), 'Mô tả sản phẩm 2'),
  (GETDATE(), 200, 'Sản phẩm 3', 300, 20, 1, GETDATE(), 'Mô tả sản phẩm 3'),
  (GETDATE(), 250, 'Sản phẩm 4', 350, 25, 1, GETDATE(), 'Mô tả sản phẩm 4'),
  (GETDATE(), 300, 'Sản phẩm 5', 400, 30, 1, GETDATE(), 'Mô tả sản phẩm 5');
INSERT INTO kich_thuoc_mau_sac (so_luong, trang_thai, mau_sac_id, san_pham_id, kich_thuoc_id)
VALUES
  (2, 1, 1, 1, 1),
  (3, 1, 2, 2, 2),
  (4, 1, 3, 3, 3),
  (5, 1, 4, 4, 4),
  (6, 1, 5, 5, 5);
  INSERT INTO hoa_don (ngay_tao, ghi_chu, ngay_cap_nhat, trang_thai, tai_khoan_id, thanh_toan_id)
VALUES
  (GETDATE(), 'Ghi chú 1', GETDATE(), 1, 1, 1),
  (GETDATE(), 'Ghi chú 2', GETDATE(), 1, 2, 2),
  (GETDATE(), 'Ghi chú 3', GETDATE(), 1, 3, 3),
  (GETDATE(), 'Ghi chú 4', GETDATE(), 1, 4, 4),
  (GETDATE(), 'Ghi chú 5', GETDATE(), 1, 5, 5);
INSERT INTO gio_hang (ngay_tao, ghi_chu, ngay_cap_nhat, trang_thai, tai_khoan_id)
VALUES
  (GETDATE(), 'Ghi chú 1', GETDATE(), 1, 1),
  (GETDATE(), 'Ghi chú 2', GETDATE(), 1, 2),
  (GETDATE(), 'Ghi chú 3', GETDATE(), 1, 3),
  (GETDATE(), 'Ghi chú 4', GETDATE(), 1, 4),
  (GETDATE(), 'Ghi chú 5', GETDATE(), 1, 5);
INSERT INTO hoa_don_chi_tiet (ghi_chu, so_luong, hoa_don_id, san_pham_id)
VALUES
  ('Ghi chú 1', 2, 1, 1),
  ('Ghi chú 2', 3, 2, 2),
  ('Ghi chú 3', 4, 3, 3),
  ('Ghi chú 4', 5, 4, 4),
  ('Ghi chú 5', 6, 5, 5);
INSERT INTO hoa_don_chi_tiet (ghi_chu, so_luong, hoa_don_id, san_pham_id)
VALUES
  ('Ghi chú 1', 2, 1, 1),
  ('Ghi chú 2', 3, 2, 2),
  ('Ghi chú 3', 4, 3, 3),
  ('Ghi chú 4', 5, 4, 4),
  ('Ghi chú 5', 6, 5, 5);
  INSERT INTO san_pham_danh_muc (san_pham_id, danh_muc_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);
INSERT INTO san_pham_thuong_hieu (san_pham_id, thuong_hieu_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);
INSERT INTO san_pham_anh (san_pham_id, anh)
VALUES
  (1, 'anh1.jpg'),
  (2, 'anh2.jpg'),
  (3, 'anh3.jpg'),
  (4, 'anh4.jpg'),
  (5, 'anh5.jpg');
INSERT INTO gio_hang_chi_tiet (gio_hang_id, san_pham_id, so_luong)
VALUES
  (1, 1, 2),
  (2, 2, 3),
  (3, 3, 4),
  (4, 4, 5),
  (5, 5, 6);
