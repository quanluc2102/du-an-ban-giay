package com.poly.duanbangiay.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "san_pham_anh")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SanPhamAnh {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private long id;

    @ManyToOne
    @JoinColumn(name = "san_pham_id", referencedColumnName = "id", nullable = true)
    private SanPham sanPham;

    private String anh;


}
