package com.cg.productmanagementsystem.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cg.productmanagementsystem.entities.Product;
import com.cg.productmanagementsystem.service.SystemService;
import com.cg.productmanagementsystem.service.SystemServiceImpl;

@Controller
@RequestMapping("/")
public class MyController {

	@Autowired
    SystemServiceImpl systemServices;
	  
    @RequestMapping(value="/", method = RequestMethod.GET)
    public ModelAndView getPage(Model model){
            ModelAndView view =new ModelAndView("index");
            model.addAttribute("product", new Product());
           
            return view;
}
   
    @RequestMapping(value="/products", method=RequestMethod.GET)
    
    public String productsHome(HttpServletRequest request,HttpSession session, Model model){
    	//offset is page number 
    	String offset = (String)request.getParameter("offSet");
    	// result is number of record displayed on each page
    	String property=(String)request.getParameter("sortby");
    	
    	
    	String order=(String)request.getParameter("order");
    	
    	int result = 5;
    	// size is the total number of record present in DB
    	int size ;
    	List<Integer> pageList = new ArrayList<Integer>();
    	List<Product> products ;
    	/*in the beginning we set page number zero
    */	if(offset!=null){
    		int offsetreal = Integer.parseInt(offset);
    		offsetreal = offsetreal*5;
    		 products = systemServices.list(result,offsetreal,property,order);
    		 
    	}else if(offset==null && property!=null){
    		products = systemServices.list(result,0,property,order);
    		size = systemServices.getSize();
    		/*if total record are divisible by 10 then we set page list 
    		 * size one less than total size to avoid empty last page i.e if total record are 1220 then page list
    		 *  size will be 121 because here we are taking page list size from 0-121 which is 122 pages*/
    		if((size%result) == 0){
    		session.setAttribute("size", (size/5)-1);
    		}else{
    			session.setAttribute("size", size/5);
    		}
    	}else{
    		products = systemServices.list(result,0,"product_id","desc");
    		size = systemServices.getSize();
    		/*if total record are divisible by 10 then we set page list 
    		 * size one less than total size to avoid empty last page i.e if total record are 1220 then page list
    		 *  size will be 121 because here we are taking page list size from 0-121 which is 122 pages*/
    		if((size%result) == 0){
    		session.setAttribute("size", (size/5)-1);
    		}else{
    			session.setAttribute("size", size/5);
    		}
    	}
    	System.out.println(session.getAttribute("size").toString());
    	/*when user click on any page number then this part will be executed. 
    	 * else part will be executed on load i.e first time on page*/
    	if(offset!=null){
    		int listsize = Integer.parseInt(session.getAttribute("size").toString());
    		if(Integer.parseInt(offset) <6){
    			if(listsize>=10){
    				for(int i= 1; i<=9;i++){
    					pageList.add(i);
    				}
    			}else{
    				for(int i= 1; i<=listsize;i++){
    					pageList.add(i);
    				}
    			}
     
    		}else{
    			if(listsize >= 10 && Integer.parseInt(offset)-5 >0){
    				List<Integer> temp = new ArrayList<Integer>(); 
    				for(int i=Integer.parseInt(offset);i>Integer.parseInt(offset)-5;i--){
    					temp.add(i);
    				}
    				for(int i=temp.size()-1;i>=0;i--){
    					pageList.add(temp.get(i));
    				}
    			}
    			if(listsize >= 10 && Integer.parseInt(offset)+5<listsize){
    				for(int i=Integer.parseInt(offset)+1;i<Integer.parseInt(offset)+5;i++){
    					pageList.add(i);
    				}
    			}else if(listsize >= 10){
    				for(int i=Integer.parseInt(offset)+1;i<listsize;i++){
    					pageList.add(i);
    				}
    			}
    		}
    	}else{
    		int listsize = Integer.parseInt(session.getAttribute("size").toString());
    		if(listsize>=10){
    			for(int i= 1; i<=10;i++){
    				pageList.add(i);
    			}
    		}else{
    			for(int i= 1; i<=listsize;i++){
    				pageList.add(i);
    			}
    		}
    	}
    	session.setAttribute("pageList", pageList);
    	session.setAttribute("productList", products);
    	model.addAttribute("product", new Product());
    	
    	return "products";
    }
    
    @RequestMapping(value="/delete/{id}",method = RequestMethod.GET)   
    public String deleteTeam(@PathVariable Integer id) {
    	System.out.println("Id-> "+id);
        systemServices.delete(id);
        String redirectUrl = "http://localhost:8081/ProductManagementSystem/products";
        return "redirect:" + redirectUrl;
    }
    
    @RequestMapping(value="/add", method = RequestMethod.GET)
	public ModelAndView getPageadd(Model model){
        ModelAndView view =new ModelAndView("add");
        model.addAttribute("product", new Product());
 
        return view;
}
    @RequestMapping(value="/ProductManagementSystem/adds", method=RequestMethod.GET)
    public String getSaved(@ModelAttribute("product") Product products,  Model model){
        Map<String,Object> map = new HashMap<String,Object>();
        ModelAndView modelAndView = new ModelAndView("products");
        model.addAttribute("product", new Product());
        
        if(systemServices.saveOrUpdate(products)){
            map.put("status","200");
            map.put("message","Your record have been saved successfully");
        }
         
        return "index";
    }
    
    @RequestMapping(value="/editpage", method = RequestMethod.GET)
   	public String editPage(HttpServletRequest request, Model model){
    	int p_id=Integer.parseInt(request.getParameter("id"));
           Product p= systemServices.getProductById(p_id);
    	model.addAttribute("product", p);
    
           return "edit";
   }
    
    @RequestMapping(value="/ProductManagementSystem/edit",method = RequestMethod.GET)   
    public String edit(@ModelAttribute("product") Product product,HttpServletRequest request) {
    	int p_id=Integer.parseInt(request.getParameter("product_id"));
    	System.out.println("Product name->" + product.getProduct_name());
    	Product p = new Product(p_id,product.getProduct_name(),product.getProduct_desc(),product.getProduct_price(),product.getProduct_quantity(),product.getProduct_rating());
        systemServices.edit(p);
        String redirectUrl = "http://localhost:8081/ProductManagementSystem/products";
        return "redirect:" + redirectUrl;
    }
    
}

    
