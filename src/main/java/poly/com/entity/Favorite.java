package poly.com.entity;

import java.util.Date;

public class Favorite {
	private long favoriteId;
	private String userId;
	private String videoId;
	private Date likeDate;

	public Favorite() {

	}

	public long getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(long favoriteId) {
		this.favoriteId = favoriteId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	@Override
	public String toString() {
		return "Favorite [favoriteId=" + favoriteId + ", userId=" + userId + ", videoId=" + videoId + ", likeDate="
				+ likeDate + "]";
	}

}
