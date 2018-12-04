package com.tz.online.entity;

import java.util.List;

public class PageBean<T> {
	private List<T> list;

	private Long pageNow;

	private Long pageSize;

	private Long pageCount;

	public PageBean() {
		// TODO Auto-generated constructor stub
	}

	public PageBean(List<T> bookList, Long pageNow, Long pageSize, Long pageCount) {
		super();
		this.list = bookList;
		this.pageNow = pageNow;
		this.pageSize = pageSize;
		this.pageCount = pageCount;
	}

	public PageBean(Long pageNow, Long pageSize, Long pageCount) {
		super();
		this.pageNow = pageNow;
		this.pageSize = pageSize;
		this.pageCount = pageCount;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> bookList) {
		this.list = bookList;
	}

	public Long getPageNow() {
		return pageNow;
	}

	public void setPageNow(Long pageNow) {
		this.pageNow = pageNow;
	}

	public Long getPageSize() {
		return pageSize;
	}

	public void setPageSize(Long pageSize) {
		this.pageSize = pageSize;
	}

	public Long getPageCount() {
		return pageCount;
	}

	public void setPageCount(Long pageCount) {
		this.pageCount = pageCount;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PageBean [list=");
		builder.append(list);
		builder.append(", pageNow=");
		builder.append(pageNow);
		builder.append(", pageSize=");
		builder.append(pageSize);
		builder.append(", pageCount=");
		builder.append(pageCount);
		builder.append("]");
		return builder.toString();
	}

}
