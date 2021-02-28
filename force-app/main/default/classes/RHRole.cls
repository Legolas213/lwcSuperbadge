public class RHRole extends RHBaseModel{
    
    @AuraEnabled
    public String roleId{get;set;}
    
    @AuraEnabled
    public String developerName{get;set;}
    
    @AuraEnabled
    public String parentRoleId{get;set;}
    
    @AuraEnabled
    public String roleName{get;set;}
    
    @AuraEnabled
    public List<RHRole> subRoles{get;set;}
    
    public override String getSObjectName(){
        return 'UserRole';
    }
    
    public override Map<String,Object> getSObjectFieldMap(){
        return new Map<String,Object>{
            'Id'=>this.roleId,
                'ParentRoleId'=>this.parentRoleId,
                'DeveloperName'=>this.developerName,
                'Name'=>this.roleName
        };
    }
    
    public override void mapModel(SObject sobj){
        if(sobj instanceof UserRole){
            UserRole role = (UserRole)sobj;
            Map<String,Object> fieldMap = role.getPopulatedFieldsAsMap();
            this.roleId = (String)fieldMap.get('Id');
            this.roleName = (String)fieldMap.get('Name');
            this.developerName = (String)fieldMap.get('DeveloperName');
            this.parentRoleId = (String)fieldMap.get('ParentRoleId');
        }
    }

}