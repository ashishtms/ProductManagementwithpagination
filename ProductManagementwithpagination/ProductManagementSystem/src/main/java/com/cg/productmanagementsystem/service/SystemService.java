package com.cg.productmanagementsystem.service;

import java.util.List;

import com.cg.productmanagementsystem.entities.Product;

public interface SystemService {
	
	public boolean saveOrUpdate(Product products);

	public List<Product> list(int result,int offset,String property,String order);

	public boolean delete(int productid);
	
	public int getSize();
	
	public boolean edit(Product product);
	
	public Product getProductById(int id);
}
