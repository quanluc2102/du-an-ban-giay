package com.poly.duanbangiay.service;

import com.poly.duanbangiay.entity.SanPham;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface SanPhamService {
    void add(SanPham sp);
    void delete(Long id);
    void update(Long id,SanPham sp);
    List<SanPham> getAll();
    SanPham getOne(Long id);
    void chuyenSoLuong(SanPham sp);
    void importExcel(MultipartFile file);
}
