package com.poly.duanbangiay.service.serviceimpl;

import com.poly.duanbangiay.entity.GioHang;
import com.poly.duanbangiay.repository.GioHangRepository;
import com.poly.duanbangiay.service.GiohangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GioHangServiceImpl implements GiohangService {

    @Autowired
    private GioHangRepository giohangRepository;

    @Override
    public void add(GioHang giohang) {
        giohangRepository.save(giohang);
    }

    @Override
    public void delete(Long id) {
        giohangRepository.deleteById(id);
    }

    @Override
    public void update(GioHang gioHang) {
        GioHang giohang = giohangRepository.findById(gioHang.getId()).get();
        giohang.setTrangThai(gioHang.getTrangThai());
        giohang.setGhiChu(gioHang.getGhiChu());
        giohang.setNgayTao(gioHang.getNgayTao());
        gioHang.setTaiKhoanId(gioHang.getTaiKhoanId());
        this.giohangRepository.save(gioHang);

    }

    @Override
    public List<GioHang> getAll() {

        return giohangRepository.findAll();
    }

    @Override
    public GioHang getOne(Long id) {

        return giohangRepository.findById(id).get();
    }
}
