package com.cg.productmanagementsystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cg.productmanagementsystem.dao.SystemDao;
import com.cg.productmanagementsystem.entities.Product;

@Service
public class SystemServiceImpl implements SystemService{
	

    @Autowired
    SystemDao systemDao;

	public boolean saveOrUpdate(Product products) {
		// TODO Auto-generated method stub
		return systemDao.saveOrUpdate(products);
	}

	public List<Product> list(int result,int offset,String property,String order) {
		// TODO Auto-generated method stub
		return systemDao.list(result, offset, property, order);
	}

	public boolean delete(int productid) {
		// TODO Auto-generated method stub
		return systemDao.delete(productid);
	}

	public int getSize() {
		// TODO Auto-generated method stub
		return systemDao.getSize();
	}

	public boolean edit(Product product) {
		// TODO Auto-generated method stub
		return systemDao.edit(product);
	}

	public Product getProductById(int id) {
		// TODO Auto-generated method stub
		return systemDao.getProductById(id);
	}

}
