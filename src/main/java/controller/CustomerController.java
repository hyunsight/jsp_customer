package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import DAO.CustomerDAO;
import DTO.Customer;
//import oracle.net.aso.b;

@WebServlet("/")
@MultipartConfig(maxFileSize=1024*1024*50, location="/Users/hyunmac/Desktop/Project/JSP/jsp_customer/src/main/webapp/Temp/img")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDAO dao;
	private ServletContext ctx; 
	

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new CustomerDAO();
		ctx = getServletContext();
	}
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		String site = null;
		
		switch (command) {
		case "/index": site = getList(request); break;
		case "/view": site = getView(request); break;
		case "/register": site = "register.jsp"; break;		
		case "/insert": site = insertCustomer(request); break;
		case "/edit": site = getViewForEdit(request); break;
		case "/update": site = updateCustomer(request); break;		
		case "/delete": site = deleteCustomer(request); break;
		}
		
		if(site.startsWith("redirect:/")) {
			String rview = site.substring("redirect:/".length());
			response.sendRedirect(rview);
		} else {
			ctx.getRequestDispatcher("/" + site).forward(request, response);
		}
	}

	
	//index 관련
	public String getList(HttpServletRequest request) {
		List<Customer> list;
		
		try {
			list = dao.getList();
			request.setAttribute("customerList", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "고객 리스트를 정상적으로 가져오지 못했습니다.");
		}
		
		return "index.jsp";
	}

	
	//view 관련
	public String getView(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
				
		try {
			Customer customer = dao.getView(id);
			request.setAttribute("customer", customer);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "고객 상세 정보를 정상적으로 가져오지 못했습니다.");
		}
		
		return "view.jsp";
	}
	
	
	//register 및 insert 관련
	public String insertCustomer(HttpServletRequest request) {
		Customer customer = new Customer();
		
		try {
			BeanUtils.populate(customer, request.getParameterMap());
			
			//파일 처리
			Part part = request.getPart("file");
			String fileName = getFileName(part);

			if(fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
				
				customer.setImg("/img/" + fileName);
			} else {
				customer.setImg(null);
			}
			
			dao.insertCustomer(customer);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
			//한글 깨짐 처리
			
			try {
				String encodeName = URLEncoder.encode("정상적으로 등록되지 않았습니다.", "UTF-8");
				return "redirect:/index?error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		
		return "redirect:/index";
	}
	
	
	//edit 관련
	public String getViewForEdit(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			Customer customer = dao.getView(id);
			request.setAttribute("customer", customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "edit.jsp";
	}

	
	public String updateCustomer(HttpServletRequest request) {
		Customer customer = new Customer();
		String origin_file = request.getParameter("origin_file");
		
		try {
			BeanUtils.populate(customer, request.getParameterMap());
			
			//파일 처리
			Part part = request.getPart("file");
			String fileName = getFileName(part);

			if(fileName != null && !fileName.isEmpty()) {
				part.write(fileName);
				
				customer.setImg("/img/" + fileName);
			} else {
				if (origin_file == null || origin_file.equals("")) {
					customer.setImg(null);
				} else {
					customer.setImg(origin_file);
				}
			}
			
			dao.updateCustomer(customer);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			//한글 깨짐 처리
			try {
				String encodeName = URLEncoder.encode("정상적으로 등록되지 않았습니다.", "UTF-8");
				return "redirect:/index?error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		
		return "redirect:/view?id=" + customer.getId();
	}
	
	
	//delete 관련	
	public String deleteCustomer(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			dao.deleteCustomer(id);
		} catch (Exception e) {
			e.printStackTrace();
			
			try {
				String encodeName = URLEncoder.encode("정상적으로 삭제되지 않았습니다.", "UTF-8");
				return "redirect:/index?error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
	
		return "redirect:/index";
	}
	
	
	//이미지 처리 관련
	public String getFileName(Part part) {
		String fileName = null;
		
		String header = part.getHeader("content-disposition");
		System.out.println("Header => " + header);
		
		int start = header.indexOf("filename=");
		fileName = header.substring(start + 10, header.length() - 1);
		
		return fileName;
	}
}
