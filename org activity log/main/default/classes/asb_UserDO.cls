/**
 * Data class for the User object.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author ivignolo@salesforce.com
 */
public class asb_UserDO extends asb_BaseData{
	
	private User user;
	
	public asb_UserDO(){
		init(new User());
	}

	public asb_UserDO(User usr){
		init(usr);
	}
	
	private void init (User usr){
        user = usr;
        setCustomObject (usr);
    }
    
    public override Boolean remove() {
		return false;
	}
	
	private void clear() {
		user = null;
	}
    
    public override ID getCreatedById() {
		return user.CreatedById;
	}
	
	public override ID getLastModifiedById() {
		return user.LastModifiedById;
	}
	
	public override DateTime getCreatedDate() {
		return user.CreatedDate;
	}
	
	public override DateTime getLastModifiedDate() {
		return user.LastModifiedDate;
	}
	
	public ID getProfileId(){
		return user.ProfileId;
	}	

	public ID getUserLicenseId(){
		return user.Profile.UserLicenseId;
	}

}