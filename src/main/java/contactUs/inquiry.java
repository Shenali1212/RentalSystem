package contactUs;

//the inquiry object
public class inquiry {

	//inquiry properties
	int InquiryID;
	String UserName;
	String UserID;
	String Email;
	String InquirySubject;
	String InquiryDetails;
	String InquiryDate;
	
	//constructor to initialize an inquiry object
	public inquiry(int inquiryID, String userName, String userID, String email, String inquirySubject, String inquiryDetails,
			String inquiryDate) {
		
		InquiryID = inquiryID;
		UserName = userName;
		UserID = userID;
		Email = email;
		InquirySubject = inquirySubject;
		InquiryDetails = inquiryDetails;
		InquiryDate = inquiryDate;
		
	//inquiry detail getters	
	}
	public int getInquiryID() {
		return InquiryID;
	}
	public String getUserName() {
		return UserName;
	}
	public String getUserID() {
		return UserID;
	}
	public String getEmail() {
		return Email;
	}
	public String getInquirySubject() {
		return InquirySubject;
	}
	public String getInquiryDetails() {
		return InquiryDetails;
	}
	public String getInquiryDate() {
		return InquiryDate;
	}
	

	
}
