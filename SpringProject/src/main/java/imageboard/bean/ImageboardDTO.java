package imageboard.bean;

import java.util.Date;

public class ImageboardDTO {
	private String seq
				  ,imageId
				  ,imageName
				  ,imageContent
				  ,image1
				  ;
	
	private int imagePrice
				,imageQty;
	
	private Date logtime;

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getImageId() {
		return imageId;
	}
	
	public String getImageContent() {
		return imageContent;
	}

	public void setImageId(String imageId) {
		this.imageId = imageId;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	
	

	public void setImageContent(String imageContent) {
		this.imageContent = imageContent;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public Date getLogtime() {
		return logtime;
	}

	public void setLogtime(Date logtime) {
		this.logtime = logtime;
	}

	public int getImagePrice() {
		return imagePrice;
	}

	public void setImagePrice(int imagePrice) {
		this.imagePrice = imagePrice;
	}

	public int getImageQty() {
		return imageQty;
	}

	public void setImageQty(int imageQty) {
		this.imageQty = imageQty;
	}

	
}
