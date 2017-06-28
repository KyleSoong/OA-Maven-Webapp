package com.accp.utils;

import java.util.List;

public class Page {
	private List pagedata = null;
	private int offset;
	private int rowSum;
	private int pageSize;
	private int pageSum;

	private int currentPage;
	private boolean isFirstPage;
	private boolean isLastPage;
	
	public static int countOffset(final int pageSize, final int currentPage){
		return pageSize * (currentPage - 1);
	}
	public List getPagedata() {
		return pagedata;
	}
	public void setPagedata(List pagedata) {
		this.pagedata = pagedata;
	}	
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getRowSum() {
		return rowSum;
	}
	public void setRowSum(int rowSum) {
		this.rowSum = rowSum;
	}
	public int getPageSum() {
		pageSum = rowSum % pageSize == 0 ? rowSum / pageSize : rowSum / pageSize +1; 
		return pageSum;
	}
/*	public void setPageSum(int pageSum) {
		this.pageSum = pageSum;
	}*/
/*	public void setPageSum(final int pageSize,final int rowSum) {
		this.pageSum = rowSum % pageSize == 0 ? rowSum / pageSize : rowSum / pageSize +1; 
	}*/
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage == 0 ? 1 : currentPage;
	}
	public boolean isFirstPage() {
		return isFirstPage;
	}
	public void setFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}
	public boolean isLastPage() {
		return isLastPage;
	}
	public void setLastPage(boolean isLastPage) {
		this.isLastPage = isLastPage;
	}	
}
