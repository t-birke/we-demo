@isTest
private class SmartVehicleDeviceRemoteController_Test {
    static testmethod void remoteControllerTest() {
        
        SmartVehicleDeviceRemoteController plugin = new SmartVehicleDeviceRemoteController();
        Map<String,Object> inputParams = new Map<String,Object>();
        
        string rebootURL = 'https://agent.electricimp.com/EM1DKK00xJl0/control?reboot=1';
        InputParams.put('DeviceURL', rebootURL);
        
        Process.PluginRequest request = new Process.PluginRequest(inputParams);           
        
        plugin.invoke(request);
    } 
}