package com.poly.duanbangiay.service;

import com.poly.duanbangiay.entity.HoaDonKhuyenMai;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface HoaDonKhuyenMaiService {
    List<HoaDonKhuyenMai>getAll();
    void add(HoaDonKhuyenMai hoaDonKhuyenMai);

    void delete(Long id);

    void update(HoaDonKhuyenMai hoaDonKhuyenMai);

    HoaDonKhuyenMai detail(Long id);
    Optional<HoaDonKhuyenMai>detaill(Long id);
    HoaDonKhuyenMai findOne(Long id);
}
