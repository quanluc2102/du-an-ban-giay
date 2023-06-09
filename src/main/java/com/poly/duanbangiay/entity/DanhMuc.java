package com.poly.duanbangiay.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "danh_muc")
public class DanhMuc {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "ten")
    private String ten;
    @Column(name = "trang_thai")
    private Integer trangThai;

    public DanhMuc(String ten, Integer trangThai) {
        this.ten = ten;
        this.trangThai = trangThai;
    }

    public String layTrangThai(){
        if(trangThai == 1){
            return "Active";
        }else{
            return "Inactive";
        }
    }
}
