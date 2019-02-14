/**
 * @description Tests for asb_GenericValidator
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestGenericValidator {

    /**
     * Map attachment URL extensions to content types
     */
    private static final Map<String, String> CONTENT_TYPE_MAP =
     new Map<String, String> {
      'pdf' => 'pdf',
      'jpg' => 'image/jpeg',
      'gif' => 'image/gif',
      'png' => 'image/png',
      'swf' => 'application/x-shockwave-flash',
      'zip' => 'application/x-zip-compressed'
    };

 	public static testMethod void testValidateFile() {
 		
 		Set<String> allowedExts = new Set<String> {'jpg'};
 		List<String> customErrors = null;

 		Blob b = getBlob(4 * asb_GenericValidator.ONE_KB_TO_BYTES);
 		String result = asb_GenericValidator.validateKbFile( b, 'logo_reportCollaboration.jpg', allowedExts, 4);
 		System.assertEquals(result,null);
 		
 		result = asb_GenericValidator.validateKbFile( b, 'logo_reportCollaboration.jpg', allowedExts, 4, customErrors);
 		System.assertEquals(result,null);

	 	result = asb_GenericValidator.validateKbFile( b, 'logo_reportCollaboration.jpg', allowedExts, 2);
 		System.assertEquals(result,Label.asb_ERROR_FileTooLarge.replace('{0}','2').replace('{1}','KB'));
 		
 		result = asb_GenericValidator.validateKbFile( null, 'logo_reportCollaboration.jpg', allowedExts, 2);
 		System.assertEquals(result,Label.asb_ERROR_uploadFile.replace('{0}','2').replace('{1}','KB'));
 		
 		b = getBlob(4 * asb_GenericValidator.ONE_MB_TO_KB);
		result = asb_GenericValidator.validateMbFile( b, 'logo_reportCollaboration.jpg', allowedExts, 4);
 		System.assertEquals(result,null);

		result = asb_GenericValidator.validateMbFile( b, 'logo_reportCollaboration.jpg', allowedExts, 4, customErrors);
 		System.assertEquals(result,null);

	 	result = asb_GenericValidator.validateMbFile( b, 'logo_reportCollaboration.jpg', allowedExts, 2);
 		System.assertEquals(result,Label.asb_ERROR_FileTooLarge.replace('{0}','2').replace('{1}','MB'));
 		
 		result = asb_GenericValidator.validateMbFile( null, 'logo_reportCollaboration.jpg', allowedExts, 2);
 		System.assertEquals(result,Label.asb_ERROR_uploadFile.replace('{0}','2').replace('{1}','MB'));

		result = asb_GenericValidator.validateFile( b, 'logo_reportCollaboration.jpg', allowedExts, 'Test file', 18, 4);
 		System.assertEquals(result,null);
 		
		result = asb_GenericValidator.validateFile( b, 'logo_reportCollaboration.jpg', allowedExts, '', 18, 4);
 		System.assertEquals(result,Label.asb_ERROR_EmptyTitle);

		result = asb_GenericValidator.validateFile( b, 'logo_reportCollaboration.jpg', allowedExts, 'Test file'.repeat(3), 18, 4);
 		System.assertEquals(result,Label.asb_ERROR_FieldTooLong.replace('{0}', Label.asb_Title ).replace('{1}','18'));

		result = asb_GenericValidator.validateFile( b, 'logo_reportCollaboration.txt', allowedExts, 'Test file', 18, 4);
 		System.assertEquals(result,Label.asb_ERROR_FileType.replace('{0}', String.join(new List<String>(allowedExts), ', ')));
 	}

    private static Blob getBlob(Integer size){
	      return Blob.valueOf('x'.repeat(size));
    }

}