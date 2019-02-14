@isTest(SeeAllData=True)
public with sharing class FSLVisionTest
{
  static testMethod void testVis()
  {
  WorkOrder newWO= new WorkOrder();
  insert newWO;
  FeedItem f = new FeedItem();
  f.parentId = newWO.id;
  //Blob b;
  //String b64;
  //String strUrlUTF8;
  //String sampleString='fsf234f';  
  //strUrlUTF8 = EncodingUtil.urlEncode(sampleString, 'UTF-8');
  //b = Blob.valueOf(strUrlUTF8);
  f.Body = 'test';
 //f.ContentData = b;
 // f.ContentFileName = 'test.jpg';
  //f.Type = 'ContentPost';
  insert f;
  Test.startTest();
  Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
  //FSLVisionController.getCallVisionContent(f.parentId,f.RelatedRecordId);
  FSLVisionController c = new FSLVisionController();
  List<Vision.Prediction> lst = new List<Vision.Prediction> ();
  lst = c.getCallVisionUrl();
  String str = FSLVisionController.getAccessToken();
  Test.stopTest();
  
  }
 
}