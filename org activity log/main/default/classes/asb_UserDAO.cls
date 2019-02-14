/**
 * Class for performing all queries for the User object.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author ivignolo@salesforce.com
 */
public class asb_UserDAO {
	
	public static asb_UserDO getUserDOById(Id id){
		User[] users = null;
		 
		if(id != null){
			users = [ Select Id, Profile.UserLicenseId
						From User where Id =: id limit 1];
		} 
		return (users == null || users.isEmpty()) ? null : new asb_UserDO(users[0]);
	}
	
}