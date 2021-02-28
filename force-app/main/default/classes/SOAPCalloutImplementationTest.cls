@isTest
private class SOAPCalloutImplementationTest {
    
    @isTest static void testCallout() { 
        Test.startTest();
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new SOAPCalloutMock());
        // Call the method that invokes a callout
        Double x = 1.0;
        Double y = 2.0;
        Double result = SOAPCalloutImplementation.add(x, y);
        Test.stopTest();
        // Verify that a fake result is returned
        System.assertEquals(3.0, result); 
    }
    
}