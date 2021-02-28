public class SurveyResponse {
    
    @InvocableMethod
    public static void createRecord(){
        Account acc = new Account(Name='Account Survey');
        Database.insert(acc);
    }

}