package listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import db.WebDBProcessing;

public class DBListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		ServletContext ctx = arg0.getServletContext();
		Object con = ctx.getAttribute("DBCon");
		if(con!=null){
			Connection new_con = (Connection)con;
			try {
				if(!new_con.isClosed()){
					new_con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_command?characterEncoding=UTF-8","root","");
			
			if(con==null){
				System.out.println("con is null!");
			}
//			WebDBProcessing db = new WebDBProcessing(con);
//			db.saveRecommend();
			ServletContext ctx = arg0.getServletContext();
			ctx.setAttribute("DBCon", con);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

}

