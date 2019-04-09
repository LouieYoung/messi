package entity;

//房屋信息类
public class HouseResource{
	
	private int ID;
	private int isRented;
	private double acreage;
	private double price;
	private String architecturalType;
	private String city;
	private String district;
	private String street;
	private String picture;
	private int ownerID;
    private int evaluation;
	private double recommendationIndex;
	
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getIsRented() {
		return isRented;
	}
	public void setIsRented(int isRented) {
		this.isRented = isRented;
	}
	public double getAcreage() {
		return acreage;
	}
	public void setAcreage(double acreage) {
		this.acreage = acreage;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getArchitecturalType() {
		return architecturalType;
	}
	public void setArchitecturalType(String architecturalType) {
		this.architecturalType = architecturalType;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getOwnerID() {
		return ownerID;
	}
	public void setOwnerID(int ownerID) {
		this.ownerID = ownerID;
	}
	public int getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(int evaluation) {
		this.evaluation = evaluation;
	}
	public double getRecommendationIndex() {
		return recommendationIndex;
	}
	public void setRecommendationIndex() {
		recommendationIndex=0.5*price+0.3*acreage+0.2*evaluation;
	}

}
