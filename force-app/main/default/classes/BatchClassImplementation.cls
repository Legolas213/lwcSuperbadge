global class BatchClassImplementation implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator('SELECT ID,AccountSource FROM Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> accounts){
        // process each batch of records
        for(Account acc : accounts){
            acc.AccountSource = 'Partner';
        }
        Database.update(accounts);
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
       
    } 

}