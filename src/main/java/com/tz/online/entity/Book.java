package com.tz.online.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "bsbook")
public class Book implements Serializable {

	private static final long serialVersionUID = -4998825584811761916L;

	private Long bookId;

	private String isbn;

	private String name;

	private String author;

	private String publisher;

	private Date publish_date;

	private double oldPrice;

	private double newPrice;

	private String author_loc;

	private Suit suit;

	private Category category;

	private String info;

	private List<Image> images;

	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(String isbn, String name, String author, String publisher, Date publish_date, double oldPrice,
			double newPrice, String author_loc, Suit suit, Category category, String info) {
		super();
		this.isbn = isbn;
		this.name = name;
		this.author = author;
		this.publisher = publisher;
		this.publish_date = publish_date;
		this.oldPrice = oldPrice;
		this.newPrice = newPrice;
		this.author_loc = author_loc;
		this.suit = suit;
		this.category = category;
		this.info = info;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "bookid")
	@SequenceGenerator(name = "bookid", sequenceName = "bs_bookid", initialValue = 9, allocationSize = 1)
	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	@Column
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	@Column
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column
	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column
	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Column
	@Temporal(TemporalType.DATE)
	public Date getPublish_date() {
		return publish_date;
	}

	public void setPublish_date(Date publish_date) {
		this.publish_date = publish_date;
	}

	@Column
	public double getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(double oldPrice) {
		this.oldPrice = oldPrice;
	}

	@Column
	public double getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(double newPrice) {
		this.newPrice = newPrice;
	}

	@Column
	public String getAuthor_loc() {
		return author_loc;
	}

	public void setAuthor_loc(String author_loc) {
		this.author_loc = author_loc;
	}

	@Column
	@Enumerated(EnumType.STRING)
	public Suit getSuit() {
		return suit;
	}

	public void setSuit(Suit suit) {
		this.suit = suit;
	}

	@Column
	@Enumerated(EnumType.STRING)
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
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
		result = prime * result + ((bookId == null) ? 0 : bookId.hashCode());
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
		Book other = (Book) obj;
		if (bookId == null) {
			if (other.bookId != null)
				return false;
		} else if (!bookId.equals(other.bookId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Book [bookId=");
		builder.append(bookId);
		builder.append(", isbn=");
		builder.append(isbn);
		builder.append(", name=");
		builder.append(name);
		builder.append(", author=");
		builder.append(author);
		builder.append(", publisher=");
		builder.append(publisher);
		builder.append(", publish_date=");
		builder.append(publish_date);
		builder.append(", oldPrice=");
		builder.append(oldPrice);
		builder.append(", newPrice=");
		builder.append(newPrice);
		builder.append(", author_loc=");
		builder.append(author_loc);
		builder.append(", suit=");
		builder.append(suit);
		builder.append(", category=");
		builder.append(category);
		builder.append(", info=");
		builder.append(info);
		builder.append("]");
		return builder.toString();
	}

	@OneToMany(mappedBy = "book",fetch=FetchType.EAGER)
	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

}
