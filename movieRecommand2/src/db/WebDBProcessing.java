package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import java.util.*;
import javafx.util.*;

import bean.Comment;
import bean.Movie;
import bean.MyPair;
import bean.User;

public class WebDBProcessing {
	private Connection con;
	private Statement stat;

	public WebDBProcessing(HttpServletRequest request) throws SQLException{
		ServletContext ctx = request.getSession().getServletContext();
		con = (Connection)ctx.getAttribute("DBCon");
		stat = con.createStatement();
	}
	
	public WebDBProcessing(Connection con) throws SQLException {
		this.con = con;
		stat = con.createStatement();
	}

	/**
	 * 获取用户状态
	 * @param id
	 * userID
	 * @return
	 * @throws SQLException
	 * pass
	 * 
	 * 需要考虑捕获异常的问题
	 */
	public int getUserSate(String id) throws SQLException {
		ResultSet rs = getUserById(id);
        rs.next();
		return rs.getInt("userState");
	}
	public User getUser(String userID) throws SQLException{
		ResultSet rs = getUserById(userID);
		rs.next();
		return toUser(rs);
	}
	
	public ArrayList<User> getFreezeUerList() throws SQLException {
		ArrayList<User> user_list = new ArrayList<User>();
		String sql = "select * from user where userState=2";
		ResultSet rs = getRS(sql);
		while(rs.next()){
			user_list.add(toUser(rs));
		}
		
		return user_list;
	}

	/**
	 * 登录
	 * @param id
	 * @param passwd
	 * userID password
	 * @return
	 * @throws SQLException
	 * 
	 * 
	 * 需要考虑捕获异常的问题
	 */
    public boolean Login(String id,String passwd){	
    	try {
    		ResultSet rs = getUserById(id);
			rs.next();
			if(passwd.equals(rs.getString("password")))
	    		return true;
	    	else return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
    	
    }

    /**
     * 注册
     * @param id
     * @param passwd
     * userID password
     * @return
     * @throws SQLException
     * 
     * 数据库主键存在问题  不能够只填写用户id和密码 
     */
    public boolean Register(String id,String passwd,String name) throws SQLException{
    	ResultSet rs = getUserById(id);
    	if(rs.next())
    		return false;
    	String sql_insert = "insert into user (userID,password,username,headPicUrl,userState) value(?,?,?,'poster1.jpg',0)";
    	ArrayList<String> params = new ArrayList<String>();
    	params.add(id);
    	params.add(passwd);
    	params.add(name);
    	System.out.println("test!!!");
        exePrepare(sql_insert, params);
        System.out.println("test222!!!");
        return true;
    }

    /**
     * 更新数据库表
     * @param params
     * <username,headPicUrl,signature,userState,label1,label2,label3>   userID;
     * @return
     * @throws SQLException
     * 
     * pass  数据库中userState由int改为String类型
     */
    public boolean Update(ArrayList<String> params,String userID) throws SQLException{
    	ResultSet rs = getUserById(userID);
    	if(!rs.next())
    		return false;
    	params.add(userID);
    	String sql = "update user set username=?,headPicUrl=?,signature=?,label1=?,label2=?,label3=? where userID=?";
    	exePrepare(sql, params);
    	return true;
    	
    }

    /**
       * 更据用户id获取用户评论信息
     * @param id
     * userID
     * @return
     * @throws SQLException
     * pass 数据库中缺少时间和用户名 电影名
     */
    public ArrayList<Comment> getUserComments(String id) throws SQLException {
		String sql = "select * from comment where userId='"+id+"'";
		ResultSet rs = getRS(sql);
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		while (rs.next()) {
			commentList.add(toComment(rs));
		}
		Iterator<Comment> it = commentList.iterator();
		int count = 0;
		while(it.hasNext()){
			it.next();
			count++;
		}
		System.out.println("count:"+count);
		return commentList;
	}
    
    public ArrayList<Movie> getMovieListByKey(String key) throws SQLException {
    	String sql = "select *from movie where area='"+key+"' or movieName='"+key+"'"+" or director='"+key+"'"+" or actor1='"+key+"'"+" or actor2='"+key+"'"+" or actor3='"+key+"' or actor4='"+key+"'";
    	ResultSet rs = getRS(sql);
    	ArrayList<Movie> movieList = new ArrayList<Movie>();
    	
    	while(rs.next()){
    		movieList.add(getMovieById(rs.getString("movieID")));
    		System.out.println("select");
    	}
    	return movieList;
    }

	/**
	 * 获取
	 * @param id
	 * userID
	 * @return
	 * @throws SQLException
	 * pass
	 */
    public ArrayList<Movie> getUserRecmmanded(String id) throws SQLException {
		String sql = "select * from recommend where userID='"+id+"'";
		ResultSet rs = getRS(sql);
		rs.next();
		ArrayList<Movie> movieList = new ArrayList<Movie>();
		
		for (int i = 1; i <= 6; i++) {
			String movieId = "movieID" + i;
			movieList.add(getMovieById(rs.getString(movieId)));
		}
		movieList.sort(Comparator.comparingDouble(Movie::getAvgScore).reversed());
		return movieList;
	}

	/**
	 * 
	 * @param type
	 * Sting
	 * @return
	 * @throws SQLException
	 */
    public ArrayList<Movie> getMovieByLabel(String type) throws SQLException {
		String sql = "select * from movie where label1=? or label2=?";
		ArrayList<String> params = new ArrayList<String>();
		params.add(type);
		params.add(type);
		ResultSet rs = exeGetRS(sql, params);
		ArrayList<Movie> movieList = new ArrayList<Movie>();
		int count = 0;
		while (rs.next()) {
			count++;
			movieList.add(toMovie(rs));
			
		}
		System.out.println(count);
		movieList.sort(Comparator.comparingDouble(Movie::getAvgScore).reversed());
		return movieList;
	}

    public ArrayList<Movie> getAllMovie() throws SQLException{
    	String sql = "select * from movie";
    	ResultSet rs = getRS(sql);
    	ArrayList<Movie> movieList = new ArrayList<Movie>();
    	while (rs.next()) {
			movieList.add(toMovie(rs));
		}
		movieList.sort(Comparator.comparingDouble(Movie::getAvgScore).reversed());
		return movieList;
    	
    }
	/**
	 * 
	 * @param id
	 * movieID
	 * @return
	 * @throws SQLException
	 * pass
	 */
    public Movie getMovieById(String id) throws SQLException {
		String sql = "select * from movie where movieID='"+id+"'";
		ResultSet rs = getRS(sql);
		rs.next();
		return toMovie(rs);
	}
    
    public void UpdateUserStatus(int status, String id) throws SQLException {
    	String sql = "update user set userState="+status+" where userID='"+id+"'";
    	stat.executeUpdate(sql);
    }
    
	/**
	 *
	 * @param id
	 * movieID
	 * @return
	 * @throws SQLException
	 * pass
	 */
    public ArrayList<Comment> getCommentsByMovieId(String id) throws SQLException {
		Movie movie = getMovieById(id);
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		ArrayList<String> labelString = movie.getMovieLabelList();
		String label = labelString.get(0);
		String sql = "select * from comment where movieID=?";
		ArrayList<String> params = new ArrayList<String>();
		params.add(id);
		ResultSet rs = exeGetRS(sql, params);
		while(rs.next()){
			commentList.add(toComment(rs));
		}
		return commentList;
	}
	/**
	 * 
	 * @param comment
	 * userID,userName,movieID,movieName,comment,grade
	 * @return
	 * @throws SQLException 
	 * pass
	 */
    public boolean addComment(String userID,String movieID,String userName,String movieName,String comment,String grade) throws SQLException{
		Movie movie = getMovieById(movieID);
//		ArrayList<String> params = new ArrayList<String>();
//		params.add(userID);
//		//params.add(userName);
//		params.add(movieID);
//		//params.add(movieName);
//		params.add(comment);
//		params.add(grade);
//		String sql = "insert into comment (userID,movieID,comment,grade) values (?,?,?,?)";
//		exePrepare(sql, params);
		double D_grade = Double.parseDouble(grade);
		
		String sql = "insert into comment (userId,movieID,username,movieName,comment,grade) values ('"+userID+"','"+movieID+"',"+"'"+userName+"','"+movieName+"','"+comment+"',"+D_grade+")";
		stat.execute(sql);
		
		float sum_score = movie.getAvgScore() * movie.getScoreNumber();
		sum_score += Float.parseFloat(grade);
		float avg_score = sum_score/(movie.getScoreNumber() + 1);
		DecimalFormat   fnum  =   new  DecimalFormat("##0.0");    
		String  dd = fnum.format(avg_score); 
		avg_score = Float.parseFloat(dd);
		String updateScore = "update movie set scoreNumber=?,avgScore=? where movieID=";
		updateScore += movie.getMovieId();
		PreparedStatement pstat = con.prepareStatement(updateScore);
		pstat.setInt(1, movie.getScoreNumber() + 1);
		pstat.setFloat(2, avg_score);
		pstat.execute();
		return true;
	}
	/**
	 * 
	 * @param userId
	 * @param movieId
	 * userID movieID
	 * @return
	 * @throws SQLException
	 * pass
	 */
    public void delComment(String userId,String movieId) throws SQLException{
		String pr_sql = "delete from comment where userID=? and movieId=?";
		ArrayList<String> params = new ArrayList<String>();
		params.add(userId);
		params.add(movieId);
		exePrepare(pr_sql, params);
	}
	/**
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
   private User toUser(ResultSet rs) throws SQLException {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUserId(rs.getString("userID"));
		user.setUserName(rs.getString("userName"));
		user.setProfilePictureSrc(rs.getString("headPicUrl"));
		user.setSignature(rs.getString("signature"));
		user.setStatus(rs.getInt("userState"));
		ArrayList<String> label = new ArrayList<String>();
		label.add(rs.getString("label1"));
		label.add(rs.getString("label2"));
		label.add(rs.getString("label3"));
		user.setUserLabelList(label);
		return user;
	}

    /**
     * 
     */
   private ResultSet getUserById(String id) {
	    String sql = "select * from user where userID='"+id+"'";
		ResultSet rs = null;
		try {
			rs = getRS(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
   }
	/**
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
    private Comment toComment(ResultSet rs) throws SQLException {
		// TODO Auto-generated method stub
		Comment comment = new Comment();
		comment.setUserId(rs.getString("userId"));
		comment.setuserName(rs.getString("userName"));
		comment.setComment(rs.getString("comment"));
		comment.setDate(rs.getDate("commentDate"));
		comment.setMovieId(rs.getString("movieID"));
		comment.setMovieName(rs.getString("movieName"));
		comment.setScore(rs.getDouble("grade"));
		return comment;
	}

	/**
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
    private Movie toMovie(ResultSet rs) throws SQLException {
		Movie movie = new Movie();
		movie.setMovieId(rs.getString("movieID"));
		movie.setMovieName(rs.getString("movieName"));
		movie.setDirector(rs.getString("director"));
		movie.setDuration(rs.getString("time"));
		movie.setScoreNumber(rs.getInt("scoreNumber"));
		movie.setAvgScore(rs.getFloat("avgScore"));
		movie.setImgSrc(rs.getString("picUrl"));
		ArrayList<String> actors = new ArrayList<String>();
		ArrayList<String> label = new ArrayList<String>();
		ArrayList<Movie> relatemovie = new ArrayList<Movie>();
		for (int i = 1; i <= 6; i++) {
			if (i <= 4) {
				String aname = "actor" + i;
				actors.add(rs.getString(aname));
			}
			if(i <= 2){
				String lname = "label" + i;
				label.add(rs.getString(lname));
			}
			
			String rname = "relateMovie" + i;
			relatemovie.add(getRelateMovieById(rs.getString(rname)));
		}
		movie.setActorList(actors);
		movie.setMovieLabelList(label);
		movie.setRelatedMovieList(relatemovie);
		return movie;

	}

	/**
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
    private Movie toRelateMovie(ResultSet rs) throws SQLException {
		Movie relateMovie = new Movie();
		if(rs.next()){
			relateMovie.setMovieId(rs.getString("movieID"));
			relateMovie.setMovieName(rs.getString("movieName"));
			relateMovie.setImgSrc(rs.getString("picUrl"));
		}
		return relateMovie;
	}

	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
    private Movie getRelateMovieById(String id) throws SQLException {
    	if(id==null||"".equals(id)){
    		Movie movie = new Movie();
    		return movie;
    	}
		String sql = "select * from movie where movieID='"+id+"'";
//		sql += id;
		ResultSet rs = getRS(sql);
//		rs.next();
		return toRelateMovie(rs);
	}

	/**
	 *
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
    private void exePrepare(String sql,ArrayList<String> params) throws SQLException{
		PreparedStatement pstat = con.prepareStatement(sql);
		int i = 1;
		for(String param:params){
			pstat.setString(i++, param);
		}
		boolean state = pstat.execute();
		System.out.println("test:"+state);
		pstat.close();
	}

	/**
	 * 
	 * @param sql
	 * @return
	 * @throws SQLException
	 */
     private ResultSet getRS(String sql) throws SQLException {
		stat = con.createStatement();
		ResultSet res = stat.executeQuery(sql);
		return res;
	}

	/**
	 * 
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
   private ResultSet exeGetRS(String sql,ArrayList<String> params) throws SQLException{
		PreparedStatement pstat = con.prepareStatement(sql);
		int i = 1;
		for(String param:params){
			pstat.setString(i++, param);
		}
		ResultSet res = pstat.executeQuery();
		return res;
	}
   
   
   /**** 推荐有关 
 * @throws SQLException ***/
   public ArrayList<String> getUserList() throws SQLException{
	   String sql = "select userID from user";
	   stat = con.createStatement();
	   ResultSet rs = stat.executeQuery(sql);
	   ArrayList<String> nameList = new ArrayList<String>();
	   while(rs.next()){
			nameList.add(rs.getString(1));
	   }
	   rs.close();
	   return nameList;
   }
   
   public void saveRecommend() throws SQLException{
		ArrayList<String> nameList = getUserList();
		Iterator<String> itr = nameList.iterator();
		while(itr.hasNext()){
			String user_name = itr.next();
			stat = con.createStatement();
			
			ArrayList<MyPair> movieList = new ArrayList<MyPair>();
			String sql = "select * from sparkresult where uid='"+user_name+"'";
			ResultSet rs = stat.executeQuery(sql);
			while(rs.next()){
				MyPair p = new MyPair(rs.getString(2),rs.getDouble(3));
				movieList.add(p);
			}
			ArrayList<Comment> comments_list = getUserComments(user_name);
			movieList.sort(Comparator.comparingDouble(MyPair::getScore).reversed());
			Iterator<MyPair> it = movieList.iterator();
			int count = 0;
			String insql = "insert into recommend (userID) values ('"+user_name+"')";
			stat = con.createStatement();
			stat.execute(insql);
			while(it.hasNext()){
				String mid = it.next().getMid();
				boolean flag = true;
				Iterator<Comment> cit = comments_list.iterator();
				while(cit.hasNext()){
					if(cit.next().getMovieId().equals(mid)){
						flag = false;
					}
				}
				if(flag==false){
					continue;
				}
				count++;
				if(count>6){
					break;
				}
				String usql = "update recommend set movieID"+count+"='"+mid+"' where userID='"+user_name+"'";
				stat = con.createStatement();
				stat.executeUpdate(usql);
			}
//			stat = con.createStatement();
//			String sql2 = "select label1 from user where userID='"+user_name+"'";
//			ResultSet rs2 = stat.executeQuery(sql2);
//			String label = "";
//			if(rs2.next()){
//				label = rs2.getString(1);
//			}
//			while(count<6){
//				
//				
//			}
		}
   }
}


