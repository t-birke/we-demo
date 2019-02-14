global class SmartVehicleDeviceRemoteController implements Process.Plugin { 

   global Process.PluginResult invoke(Process.PluginRequest request) { 
       String deviceURL = (String) request.inputParameters.get('DeviceURL');
       
       SmartVehicleDeviceRemoteController.executeHttpRequest(deviceURL);

       Map<String,Object> result = new Map<String,Object>();
       result.put('result', 'Future was called!');
       return new Process.PluginResult(result);
   }

   global Process.PluginDescribeResult describe() { 
      Process.PluginDescribeResult result = new Process.PluginDescribeResult(); 
      result.Name = 'RemoteController - Execute URL';
      result.Tag = 'Smart Vehicle Device';
       
      result.inputParameters = new 
         List<Process.PluginDescribeResult.InputParameter>{ 
            new Process.PluginDescribeResult.InputParameter('DeviceURL', 
            Process.PluginDescribeResult.ParameterType.STRING, true) 
         }; 
             
      result.outputParameters = new 
         List<Process.PluginDescribeResult.OutputParameter>{              
            new Process.PluginDescribeResult.OutputParameter('result', 
            Process.PluginDescribeResult.ParameterType.STRING)
         }; 
                    
      return result; 
   }
    
    @future(callout=true)
    public static void executeHttpRequest(String url) {
        Http h = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        
        HttpResponse res = h.send(req);
        
        if(res.getStatusCode() != 200) {      
	        System.debug(res.getBody());
        } 
    }
}