package com.lnonazik.webproject.serviceImplement;

import com.lnonazik.webproject.dto.ProductDto;
import com.lnonazik.webproject.model.Product;
import com.lnonazik.webproject.repository.ProductRepository;
import com.lnonazik.webproject.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImplement implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public Optional<Product> findOne(Long id) {
        return productRepository.findById(id);
    }

    @Override
    public Optional<Product> findOne(String productName) {
        return productRepository.findProductByProductName(productName);
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> findAll(Pageable pageable) {
        return productRepository.findAll(pageable).getContent();
    }

    @Override
    public void saveNewProduct(ProductDto productDto) {
        Product product = new Product();
        product.setProductName(productDto.getProductName());
        product.setPrice(productDto.getProductName());
        product.setAmount(productDto.getAmount());
        product.setDescription(productDto.getDescription());
        product.setManufacturer(productDto.getManufacturer());
        productRepository.save(product);
    }

    @Override
    public void delete(Long id) {
        productRepository.deleteById(id);
    }

    @Override
    public void delete(String productName) {
        productRepository.deleteProductByProductName(productName);
    }
}
