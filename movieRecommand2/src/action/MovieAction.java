package action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.struts2.ServletActionContext;

import bean.Comment;
import bean.Movie;
import bean.User;
import db.WebDBProcessing;

public class MovieAction{
    private Movie movie;
	private ArrayList<Movie> movieList;
	private ArrayList<Comment> commentList;
	private ArrayList<User> userList;
	private ArrayList<String> params;
	private User user;
	private String movieID;
	private String movieType;
	private String userID;
	private String passwd;
	private String comment;
	private String grade;
	private String key;
	private String userName;
	private String movieName;
	private int page_number = 0;
	private int page_end;
	private int type;
	private int mark;
	private int select_judge = 0;
	private static int flag = 0;

	WebDBProcessing DbUtils;
	public MovieAction() throws SQLException{
		DbUtils = new WebDBProcessing(ServletActionContext.getRequest());
	}

	public String All() throws SQLException{

		if(mark==1){
			if(page_number>0){
				page_number-=16;
			}
		}
		else if(mark==2){
			page_number+=16;
		}
		page_end = page_number+15;
		try {
			movieList = DbUtils.getAllMovie();
			Iterator<Movie> itr = movieList.iterator();
			while(itr.hasNext()){
				System.out.println(itr.next().getMovieName());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(userID!=null&&!"".equals(userID))
			user = DbUtils.getUser(userID);
		System.out.println("test");
		type = 0;
		return "main";
	}
	public String Type() throws SQLException{
		if(mark==1){
			if(page_number>0){
				page_number-=16;
			}
		}
		else if(mark==2){
			page_number+=16;
		}
		page_end = page_number+15;
		try {
			movieList = DbUtils.getMovieByLabel(movieType);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		type = 1;
		if(userID!=null&&!"".equals(userID))
			user = DbUtils.getUser(userID);
		return "main";
	}

	public String Unfreeze() throws SQLException{
		userList = DbUtils.getFreezeUerList();

		return "unfreeze";
	}

	public String DoUnfreeze() throws SQLException {
		DbUtils.UpdateUserStatus(0, userID);
		userList = DbUtils.getFreezeUerList();
		return "unfreeze";
	}

	public String Admin() throws SQLException{
		user = DbUtils.getUser(userID);
		return "admin";
	}

	public String Detail(){
		try {
			movie = DbUtils.getMovieById(movieID);
			commentList = DbUtils.getCommentsByMovieId(movieID);
			user = DbUtils.getUser(userID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "movie";
	}
	public String AddComment(){
		try {
			System.out.println("!!!!!:"+grade);
			DbUtils.addComment(userID,movieID,userName,movieName,comment,grade);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			movie = DbUtils.getMovieById(movieID);
			commentList = DbUtils.getCommentsByMovieId(movieID);
			user = DbUtils.getUser(userID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "movie";
	}


	public String Select() throws SQLException {
		if(mark==1){
			if(page_number>0){
				page_number-=16;
			}
		}
		else if(mark==2){
			page_number+=16;
		}
		page_end = page_number+15;
		movieList = DbUtils.getMovieListByKey(key);
		if(userID!=null&&!"".equals(userID))
			user = DbUtils.getUser(userID);
		System.out.println("搜索关键字:"+key);
		select_judge = 1;
		Iterator<Movie> it = movieList.iterator();
		while(it.hasNext()){
			System.out.println(it.next().getMovieName());
		}
		type=2;
		return "main";
	}

	public String Year(){
		return "year";
	}

	public String DeleteComment() throws SQLException {
		try {
			DbUtils.delComment(userID,movieID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			movie = DbUtils.getMovieById(movieID);
			commentList = DbUtils.getCommentsByMovieId(movieID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		user = DbUtils.getUser(userID);
		return "movie";
	}
	public String Dongjie(){
		try {
			DbUtils.UpdateUserStatus(2, userID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			movie = DbUtils.getMovieById(movieID);
			commentList = DbUtils.getCommentsByMovieId(movieID);
			user = DbUtils.getUser(userID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "movie";
	}

	public String Login(){
		return "login";
	}

	public String Register(){
		return "register";
	}

	public String DoRegister() throws SQLException {
		DbUtils.Register(userID, passwd, userName);

		return "login";
	}

	public String Islogin(){
		if(DbUtils.Login(userID,passwd)){
			ServletActionContext.getRequest().getSession().setAttribute("login_mark", "1");
			page_end = page_number+15;
			try {
				user = DbUtils.getUser(userID);
				movieList = DbUtils.getAllMovie();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "main";
		}
	    else return "login";
	}

	public String register(){
		return "register";
	}

//	public String movieRegister(){
//		try {
//			if(DbUtils.Register(userID,passwd))
//				return "login";
//			else return "register";
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return "";
//	}
	public String User(){

		try {
			user = DbUtils.getUser(userID);
			//DbUtils.saveRecommend();

			movieList = DbUtils.getUserRecmmanded(userID);
			commentList = DbUtils.getUserComments(userID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "personalMain";
	}
	public String movieUserUpdate(){
		try {
			DbUtils.Update(params,userID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			user = DbUtils.getUser(userID);
			movieList = DbUtils.getUserRecmmanded(userID);
			commentList = DbUtils.getUserComments(userID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "personalMain";
	}
	public String admin(){
		return "admin";
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public ArrayList<Movie> getMovieList() {
		return movieList;
	}

	public void setMovieList(ArrayList<Movie> movieList) {
		this.movieList = movieList;
	}

	public ArrayList<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(ArrayList<Comment> commentList) {
		this.commentList = commentList;
	}

	public ArrayList<String> getParams() {
		return params;
	}

	public void setParams(ArrayList<String> params) {
		this.params = params;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMovieID() {
		return movieID;
	}

	public void setMovieID(String movieID) {
		this.movieID = movieID;
	}

	public String getMovieType() {
		return movieType;
	}

	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getPage_number() {
		return page_number;
	}

	public void setPage_number(int page_number) {
		this.page_number = page_number;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getMark() {
		return mark;
	}

	public void setMark(int mark) {
		this.mark = mark;
	}

	public int getPage_end() {
		return page_end;
	}

	public void setPage_end(int page_end) {
		this.page_end = page_end;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getSelect_judge() {
		return select_judge;
	}

	public void setSelect_judge(int select_judge) {
		this.select_judge = select_judge;
	}

	public ArrayList<User> getUserList() {
		return userList;
	}

	public void setUserList(ArrayList<User> userList) {
		this.userList = userList;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
}
