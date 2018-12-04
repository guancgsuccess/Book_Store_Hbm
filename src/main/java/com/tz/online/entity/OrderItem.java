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
@Table(name="bsorderitem")
public class OrderItem implements Serializable {

	private static final long serialVersionUID = -1045639670180395615L;

	private Long itemId;

	private String book_isbn;

	private String book_name;

	private String book_author;
	
	private Long count;

	private double allPrice;
	
	private double price;

	private Order order;

	public OrderItem() {
		// TODO Auto-generated constructor stub
	}





	public OrderItem(String book_isbn, String book_name, String book_author, Long count, double allPrice, double price) {
		super();
		this.book_isbn = book_isbn;
		this.book_name = book_name;
		this.book_author = book_author;
		this.count = count;
		this.allPrice = allPrice;
		this.price = price;
	}





	@Id
	@GeneratedValue
	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	@Column
	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	@Column
	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	@Column
	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	@Column
	public double getAllPrice() {
		return allPrice;
	}

	public void setAllPrice(double allPrice) {
		this.allPrice = allPrice;
	}

	@ManyToOne
	@JoinColumn(name="orderid")
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((book_isbn == null) ? 0 : book_isbn.hashCode());
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
		OrderItem other = (OrderItem) obj;
		if (book_isbn == null) {
			if (other.book_isbn != null)
				return false;
		} else if (!book_isbn.equals(other.book_isbn))
			return false;
		return true;
	}





	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderItem [itemId=");
		builder.append(itemId);
		builder.append(", book_isbn=");
		builder.append(book_isbn);
		builder.append(", book_name=");
		builder.append(book_name);
		builder.append(", book_author=");
		builder.append(book_author);
		builder.append(", allPrice=");
		builder.append(allPrice);
		builder.append(", order=");
		builder.append(order);
		builder.append("]");
		return builder.toString();
	}

	@Column
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Column
	public Long getCount() {
		return count;
	}



	public void setCount(Long count) {
		this.count = count;
	}

}
