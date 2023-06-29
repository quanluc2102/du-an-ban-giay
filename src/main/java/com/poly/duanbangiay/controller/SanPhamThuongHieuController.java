package com.poly.duanbangiay.controller;

import com.poly.duanbangiay.entity.SanPhamDanhMuc;
import com.poly.duanbangiay.entity.SanPhamThuongHieu;
import com.poly.duanbangiay.service.serviceimpl.SanPhamServiceimpl;
import com.poly.duanbangiay.service.serviceimpl.SanPhamThuongHieuServiceimpl;
import com.poly.duanbangiay.service.serviceimpl.ThuongHieuServiceimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("san_pham_thuong_hieu")
public class SanPhamThuongHieuController {
    @Autowired
    SanPhamThuongHieuServiceimpl sanPhamThuongHieuServiceimpl;
    @Autowired
    SanPhamServiceimpl sanPhamServiceimpl;
    @Autowired
    ThuongHieuServiceimpl thuongHieuServiceimpl;

    @GetMapping("index")
    public String index(Model model){
        model.addAttribute("listSPTH",sanPhamThuongHieuServiceimpl.getAll());
        model.addAttribute("view", "/san_pham_thuong_hieu/index.jsp");
        return "admin/index";
    }

    @GetMapping("create")
    public String create(Model model){
        model.addAttribute("SanPhamThuongHieu",new SanPhamThuongHieu());
        model.addAttribute("listSP",sanPhamServiceimpl.getAll());
        model.addAttribute("listTH",thuongHieuServiceimpl.getAll());
        model.addAttribute("view", "/san_pham_thuong_hieu/addNew.jsp");
        return "admin/index";
    }

    @PostMapping("add")
    public String add(Model model,
                      @ModelAttribute("SanPhamThuongHieu") SanPhamThuongHieu sanPhamThuongHieu){
        sanPhamThuongHieuServiceimpl.add(sanPhamThuongHieu);
        return "redirect:/san_pham_thuong_hieu/index";
    }
}
