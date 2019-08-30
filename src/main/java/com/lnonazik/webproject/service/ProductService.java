package com.lnonazik.webproject.service;

import com.lnonazik.webproject.dto.ProductDto;
import com.lnonazik.webproject.model.Product;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface ProductService {

    Optional<Product> findOne(Long id);

    Optional<Product> findOne(String productName);

    List<Product> findAll();

    List<Product> findAll(Pageable pageable);

    void saveNewProduct(ProductDto productDto);

    void delete(Long id);

    void delete(String productName);
}
