package com.tz.online.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bsimage")
public class Image implements Serializable {

	private static final long serialVersionUID = -4920466902150021629L;

	private Long imgId;

	private String url;

	private Book book;

	private String info;

	public Image() {
		// TODO Auto-generated constructor stub
	}

	public Image(String url, Book book, String info) {
		super();
		this.url = url;
		this.book = book;
		this.info = info;
	}

	@Id
	@GeneratedValue
	public Long getImgId() {
		return imgId;
	}

	public void setImgId(Long imgId) {
		this.imgId = imgId;
	}

	@Column
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@ManyToOne
	@JoinColumn(name = "bookid")
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Column
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((imgId == null) ? 0 : imgId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Image other = (Image) obj;
		if (imgId == null) {
			if (other.imgId != null)
				return false;
		} else if (!imgId.equals(other.imgId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Image [imgId=");
		builder.append(imgId);
		builder.append(", url=");
		builder.append(url);
		builder.append(", info=");
		builder.append(info);
		builder.append("]");
		return builder.toString();
	}

}
