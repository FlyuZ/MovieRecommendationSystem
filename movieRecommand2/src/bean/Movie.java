package bean;

import java.util.ArrayList;
import java.util.Date;

public class Movie{
	private String movieId;
	private String movieName;
	private String director;//导演
	private ArrayList<String> actorList;//演员列表
	private Date onLineDate;//上线日期
	private String duration;//电影时长（以分钟为单位）
	private String briefIntro;//电影简介
	private ArrayList<String> movieLabelList;//电影标签列表
	private String imgSrc;//图片在图片系统中的位置
	private int scoreNumber;
	private float avgScore;
	private ArrayList<Movie> relatedMovieList;//相关电影列表（只存电影编号、电影名称、图片位置）
	
	
	
	@Override
	public String toString() {
		return "Movie [movieId=" + movieId + ", movieName=" + movieName + ", director=" + director + ", actorList="
				+ actorList + ", onLineDate=" + onLineDate + ", duration=" + duration + ", briefIntro=" + briefIntro
				+ ", movieLabelList=" + movieLabelList + ", imgSrc=" + imgSrc + ", scoreNumber=" + scoreNumber
				+ ", avgScore=" + avgScore + ", relatedMovieList=" + relatedMovieList + "]";
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public Date getOnLineDate() {
		return onLineDate;
	}
	public void setOnLineDate(Date onLineDate) {
		this.onLineDate = onLineDate;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public ArrayList<String> getActorList() {
		return actorList;
	}
	public void setActorList(ArrayList<String> actorList) {
		this.actorList = actorList;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getBriefIntro() {
		return briefIntro;
	}
	public void setBriefIntro(String briefIntro) {
		this.briefIntro = briefIntro;
	}
	public ArrayList<String> getMovieLabelList() {
		return movieLabelList;
	}
	public void setMovieLabelList(ArrayList<String> movieLabelList) {
		this.movieLabelList = movieLabelList;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public ArrayList<Movie> getRelatedMovieList() {
		return relatedMovieList;
	}
	public void setRelatedMovieList(ArrayList<Movie> relatedMovieList) {
		this.relatedMovieList = relatedMovieList;
	}
	public int getScoreNumber() {
		return scoreNumber;
	}
	public void setScoreNumber(int scoreNumber) {
		this.scoreNumber = scoreNumber;
	}
	public float getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(float avgScore) {
		this.avgScore = avgScore;
	}
	
}