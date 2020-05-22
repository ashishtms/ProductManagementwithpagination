package com.cg.productmanagementsystem.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cg.productmanagementsystem.entities.Product;

@Repository
@Transactional
public class SystemDaoImpl implements SystemDao{
	
	@Autowired
    SessionFactory session;

	public boolean saveOrUpdate(Product products) {
		session.getCurrentSession().saveOrUpdate(products);
        return true;
	}

	@SuppressWarnings("unchecked")
	public List<Product> list(int result,int offset,String property,String order) {
		
		Criteria criteria = session.getCurrentSession().createCriteria(Product.class);
		if(order != null) {
		if(order.equals("ascending") ) {
				criteria.addOrder(Order.asc(property));
		}else if(order.equals("descending")){
				criteria.addOrder(Order.desc(property));
			}
		}
		criteria.setFirstResult(offset);
		criteria.setMaxResults(result);
		List<Product>  products = (List<Product>)criteria.list();
		return products;
	}

	public boolean delete(int productid) {
		 try{
	            
			 Product p = (Product)session.getCurrentSession().load(Product.class, productid);
			 
			 session.getCurrentSession().delete(p);
	        }catch(Exception ex){
	            return false;
	        }
	         
	        return true;
	}

	public int getSize() {
		return session.getCurrentSession().createCriteria(Product.class).list().size();
	}
	
	public boolean edit(Product product) {
		 try{
			 System.out.println(product.getProduct_id());
			 session.getCurrentSession().update(product);
	        }catch(Exception ex){
	            return false;
	        }
	         
	        return true;
	}
	
	public Product getProductById(int id) {
		System.out.println("Dao id->" + id);
		Product p = null;
		try{
		p = (Product)session.getCurrentSession().get(Product.class, id);
		}catch(Exception ex){
            return null;
        }
         
		return p;
	}


}
