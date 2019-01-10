package bean;

import java.util.Date;

public class Comment {
	@Override
	public String toString() {
		return "Comment [userId=" + userId + ", userName=" + userName + ", movieId=" + movieId + ", movieName="
				+ movieName + ", comment=" + comment + ", score=" + score + ", date=" + date + "]";
	}
	private String userId;
	private String userName;//用户名
	private String movieId;
	private String movieName;//电影名称
	private String comment;//评论
	private double score;//评分
	private Date date;//评论时间
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getuserName() {
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double d) {
		this.score = d;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
