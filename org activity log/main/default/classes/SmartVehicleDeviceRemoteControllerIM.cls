public with sharing class SmartVehicleDeviceRemoteControllerIM {
    private static string DEBUG_STR = 'DBG SVDRCIM: ';
    
    @InvocableMethod(label='Smart Vehicle Device RemoteController' description='Execute DeviceURL')
    public static List<String> ExecuteHttpRequest(List<FlowData> inputDataList) {
        String deviceURL;
        
        for (FlowData inputData : inputDataList) {
            deviceURL = inputData.deviceURL;
        }

        System.Debug(DEBUG_STR + 'Calling DeviceURL with future method: ' + deviceURL);
        futureExecuteHttpGetRequest(deviceURL);
        
        List<String> response = new List<String>();
        response.add('Service called');

        return response;
    }

    public class FlowData {
        @InvocableVariable(label = 'DeviceURL' required = true)
        public String deviceURL;
    }
    
    @future(callout=true)
    public static void futureExecuteHttpGetRequest(String deviceURL) {
        System.Debug(DEBUG_STR + 'Entering future for: ' + deviceURL);
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(deviceURL);
        req.setMethod('GET');

        try {
            System.Debug(DEBUG_STR + 'Executing HTTP GET: ' + deviceURL);
            HttpResponse res = h.send(req);
            string resBody = res.getBody();
	        System.Debug(DEBUG_STR + 'Response body: ' + resBody);        
        }
        catch (Exception e) {
            string exMsg = e.getMessage();
            System.Debug(DEBUG_STR + 'Exception: ' + exMsg);
        }
        
        System.Debug(DEBUG_STR + 'Leaving future for: ' + deviceURL);
    }
}