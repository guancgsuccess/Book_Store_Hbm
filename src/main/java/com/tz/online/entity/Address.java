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
@Table(name = "bsaddress")
public class Address implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 599088341063403917L;

	private Long addressId;

	private String area;

	private String detailAddress;

	private String emailCode;

	private String reciver;

	private String tel;

	private String isDefault;

	private User user;

	public Address() {
		// TODO Auto-generated constructor stub
	}

	public Address(String area, String detailAddress, String emailCode, String reciver, String tel, String isDefault,
			User user) {
		super();
		this.area = area;
		this.detailAddress = detailAddress;
		this.emailCode = emailCode;
		this.reciver = reciver;
		this.tel = tel;
		this.isDefault = isDefault;
		this.user = user;
	}

	@Id
	@GeneratedValue
	public Long getAddressId() {
		return addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	@Column
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Column
	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	@Column
	public String getEmailCode() {
		return emailCode;
	}

	public void setEmailCode(String emailCode) {
		this.emailCode = emailCode;
	}

	@Column
	public String getReciver() {
		return reciver;
	}

	public void setReciver(String reciver) {
		this.reciver = reciver;
	}

	@Column
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column
	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

	@ManyToOne
	@JoinColumn(name = "userid")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Address [addressId=");
		builder.append(addressId);
		builder.append(", area=");
		builder.append(area);
		builder.append(", detailAddress=");
		builder.append(detailAddress);
		builder.append(", emailCode=");
		builder.append(emailCode);
		builder.append(", reciver=");
		builder.append(reciver);
		builder.append(", tel=");
		builder.append(tel);
		builder.append(", isDefault=");
		builder.append(isDefault);
		builder.append(", user=");
		builder.append(user);
		builder.append("]");
		return builder.toString();
	}

}
