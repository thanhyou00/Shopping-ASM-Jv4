package poly.com.entity;

import java.util.Date;

public class Share {
	private String shareId;
	private String userId;
	private String videoId;
	private String emails;
	private Date shareDate;

	public Share() {
	}

	public String getShareId() {
		return shareId;
	}

	public void setShareId(String shareId) {
		this.shareId = shareId;
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

	public String getEmails() {
		return emails;
	}

	public void setEmails(String emails) {
		this.emails = emails;
	}

	public Date getShareDate() {
		return shareDate;
	}

	public void setShareDate(Date shareDate) {
		this.shareDate = shareDate;
	}

	@Override
	public String toString() {
		return "Share [shareId=" + shareId + ", userId=" + userId + ", videoId=" + videoId + ", emails=" + emails
				+ ", shareDate=" + shareDate + "]";
	}

}
