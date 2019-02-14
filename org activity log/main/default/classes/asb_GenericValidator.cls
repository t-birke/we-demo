/**
 *
 * Generic class for generic and common validation methods.
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_GenericValidator {
	public static final Integer ONE_MB_TO_KB = 1024 * 1024;
	public static final Integer ONE_KB_TO_BYTES = 1024;
	public static final String MB_TXT = 'MB'; 
	public static final String KB_TXT = 'KB';	
	public static final String DOT = '.';
	
	/**
     * Validate an uploaded file and return the corresponding error
     * or null if there are no errors - basic checks plus title checks.
     */
	 public static String validateFile( Blob fblob, String fname, Set<String> extensions,
   									  String ftitle, Integer maxTitleLength, Integer fileMBLimit){
   		
     	if(String.isEmpty(ftitle)){
	       return Label.asb_ERROR_EmptyTitle;
     	}
     	
     	if(ftitle.length() > maxTitleLength){
          	return Label.asb_ERROR_FieldTooLong.replace('{0}', Label.asb_Title )
          													 .replace('{1}',String.valueOf(maxTitleLength)); 
       	} 
       	 
       	
     	return validateMBFile(fblob, fname, extensions, fileMBLimit);
   }
   
   /**
     * Validate an uploaded file and return the corresponding error
     * or null if there are no errors - for filetype and extension only.
     * size specified is in MB
     */
	public static String validateMBFile( Blob fblob, String fname, Set<String> extensions, Integer fileMBLimit){
	   return validateFile(fblob,fname,extensions,fileMBLimit,ONE_MB_TO_KB,MB_TXT,null);
	}
	
	/**
     * Validate an uploaded file and return the corresponding error
     * or null if there are no errors - for filetype and extension only.
     * size specified is in KB
     */
	public static String validateKBFile( Blob fblob, String fname, Set<String> extensions, Integer fileMBLimit){
	   return validateFile(fblob,fname,extensions,fileMBLimit,ONE_KB_TO_BYTES,KB_TXT,null);
	}
   
	/**
     * Validate an uploaded file and return the corresponding error
     * or null if there are no errors - for filetype and extension only.
     * size specified is in MB
     * The errors are taken from an error list passed as argument, if it's null default error messages are returned
     */
	public static String validateMBFile( Blob fblob, String fname, Set<String> extensions, Integer fileMBLimit, List<String> errors){
	   return validateFile(fblob,fname,extensions,fileMBLimit,ONE_MB_TO_KB,MB_TXT,errors);
	}
	
	/**
     * Validate an uploaded file and return the corresponding error
     * or null if there are no errors - for filetype and extension only.
     * size specified is in KB
     * The errors are taken from an error list passed as argument, if it's null default error messages are returned
     */
	public static String validateKBFile( Blob fblob, String fname, Set<String> extensions, Integer fileMBLimit, List<String> errors){
	   return validateFile(fblob,fname,extensions,fileMBLimit,ONE_KB_TO_BYTES,KB_TXT,errors);
	}
	
	/**
     * Validate an uploaded file and return the corresponding error
     * or null if there are no errors - for filetype and extension only.
     * The errors are taken from an error list if specified, otherwise it returns defualt error messages
     */
	private static String validateFile( Blob fblob, String fname, Set<String> extensions, Integer fileSizeLimit,Integer toBytesFactor,String sizeMetric, List<String> errors){
	   
	   //If no error list specified return default error messages
		Boolean useDefaultsErrors = (errors == null || errors.isEmpty());
	   
		if(fblob == null){
			return useDefaultsErrors ? Label.asb_ERROR_uploadFile.replace('{0}',String.valueOf(fileSizeLimit)).replace('{1}',sizeMetric) : errors.get(0); 
		}
		
   		String ext = null;
     	if(fname != null){
        	ext = fname.substring(fname.lastIndexOf('.')+1);
        	String retValue = validateExtension(extensions, ext);
        	if (retValue != null) 
        		return useDefaultsErrors ? retValue : errors.get(1);
     	}
     	
     	if(fblob.size() > (fileSizeLimit * toBytesFactor)){
	     	return (useDefaultsErrors || errors.size() < 3) ? Label.asb_ERROR_FileTooLarge.replace('{0}',String.valueOf(fileSizeLimit)).replace('{1}',sizeMetric) : errors.get(2); 
     	}

		return null;
	}
	
	public static String validateExtension(Set<String> validExtensions, String fileExtension) {
		if (validExtensions == null) return null;

		if (!String.isEmpty(fileExtension)) {
	 		for (String e : validExtensions) {
				if (e.equalsIgnoreCase(fileExtension)) {
					return null;
				}	     			
	 		}
		}
		// not valid, create error message
 		String allowedExts = String.join((new List<String>(validExtensions)), ', ');
        return (validExtensions.size() == 1 ? Label.asb_ERROR_FileType.replace('{0}', allowedExts) : Label.asb_ERROR_FileType.replace('{0}', allowedExts));
	}
	
}