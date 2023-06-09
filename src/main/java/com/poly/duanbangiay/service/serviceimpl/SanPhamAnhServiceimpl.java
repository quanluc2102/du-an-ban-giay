package com.poly.duanbangiay.service.serviceimpl;

import com.poly.duanbangiay.entity.SanPhamAnh;
import com.poly.duanbangiay.repository.SanPhamAnhRespository;
import com.poly.duanbangiay.service.SanPhamAnhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SanPhamAnhServiceimpl implements SanPhamAnhService {
    @Autowired
    SanPhamAnhRespository respository;
    @Override
    public void save(SanPhamAnh spa) {
        respository.saveAndFlush(spa);
    }

    @Override
    public void delete(Long id) {
        respository.deleteById(id);
    }

    @Override
    public List<SanPhamAnh> getAll() {
        return respository.findAll();
    }

    @Override
    public SanPhamAnh getOne(Long id) {
        return respository.findById(id).get();
    }
}
