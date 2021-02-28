@isTest
public class BatchImplementationTest {
    
    @isTest static void testBatchMethod(){
        Account acc = new Account(Name='Test Batch Account');
        Database.insert(acc);
        Test.startTest();
        BatchClassImplementation bci = new BatchClassImplementation();
        Database.executeBatch(bci,100);
        Test.stopTest();
        acc = [SELECT AccountSource FROM Account WHERE Id=:acc.Id];
        System.assertEquals('Partner',acc.AccountSource);
    }

}