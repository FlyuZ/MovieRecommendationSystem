package bean;

import java.util.ArrayList;

public class User {
	private String userId;
	private String pwd;//用户密码
	private String userName;


	private String profilePictureSrc;//用户头像在图片系统中的位置
	private String signature;//用户的个性签名
	private ArrayList<Comment> userCommentList;//用户评论
	private ArrayList<Movie> recommandMovieList;//给用户推荐的电影
	private int status;//用户状态(0:普通用户,1:管理员用户,2:冻结用户)；
	private ArrayList<String> userLabelList;//用户标签
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getProfilePictureSrc() {
		return profilePictureSrc;
	}
	public void setProfilePictureSrc(String profilePictureSrc) {
		this.profilePictureSrc = profilePictureSrc;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public ArrayList<Comment> getUserCommentList() {
		return userCommentList;
	}
	public void setUserCommentList(ArrayList<Comment> userCommentList) {
		this.userCommentList = userCommentList;
	}
	public ArrayList<Movie> getRecommandMovieList() {
		return recommandMovieList;
	}
	public void setRecommandMovieList(ArrayList<Movie> recommandMovieList) {
		this.recommandMovieList = recommandMovieList;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public ArrayList<String> getUserLabelList() {
		return userLabelList;
	}
	public void setUserLabelList(ArrayList<String> userLabelList) {
		this.userLabelList = userLabelList;
	}
	
	
	
	
	
}
