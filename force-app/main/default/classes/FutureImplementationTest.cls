@isTest
public class FutureImplementationTest {
    
    @isTest static void testUpdateNumberOfEmployees(){
        Account acc = new Account(Name='Test Account for Update');
        Database.insert(acc);
        List<Id> accountIds = new List<Id>();
        accountIds.add(acc.Id);
        Test.startTest();
        FutureMethodImplementation.updateNumberOfEmployees(accountIds);
        Test.stopTest();
        acc = [SELECT NumberOfEmployees FROM Account WHERE Id=:acc.Id];
        System.assertEquals(10,acc.NumberOfEmployees);
    }
    
}