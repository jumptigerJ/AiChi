package com.aichi.bean;

public class Order {
	private Integer orderId;
	private Integer productId;
	private String productName;
	private Integer num;
	private String remark;
	private String orderTime;
	private Integer pageTotalNum;
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public Integer getPageTotalNum() {
		return pageTotalNum;
	}
	public void setPageTotalNum(Integer pageTotalNum) {
		this.pageTotalNum = pageTotalNum;
	}
	
}
