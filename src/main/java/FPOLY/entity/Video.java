package FPOLY.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "video")
public class Video {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "title", nullable = false)
	private String title;
	
	@Column(name = "url", nullable = false)
	private String url;
	
	@Column(name = "poster", nullable = false)
	private String poster;
	
	@Column(name = "views", nullable = false)
	private Integer views;
	
	@Column(name = "shares", nullable = false)
	private Integer shares;
	
	@Column(name = "description", nullable = false)
	private String description;
	
	@Column(name = "isActive", nullable = false)
	private Boolean isActive;

	public Video() {
		super();
	}

	public Video(Integer id, String title, String url, String poster, Integer views, Integer shares,
			String description, Boolean isActive) {
		super();
		this.id = id;
		this.title = title;
		this.url = url;
		this.poster = poster;
		this.views = views;
		this.shares = shares;
		this.description = description;
		this.isActive = isActive;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Integer getShares() {
		return shares;
	}

	public void setShares(Integer shares) {
		this.shares = shares;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "Video [id=" + id + ", title=" + title + ", url=" + url + ", poster=" + poster + ", views=" + views
				+ ", shares=" + shares + ", description=" + description + ", isActive=" + isActive + "]";
	}

}
