public class RHRoleServiceController {
    
    @AuraEnabled
    public static RHRole getCurrentRoleHierarchy(){
        RHRole roleHierarchy = new RHRole();
        roleHierarchy.subRoles = new List<RHRole>();
        Map<Id,UserRole> currentRolesMap = new Map<ID,UserRole>([SELECT Id,Name,DeveloperName,ParentRoleId FROM UserRole]);
        Map<String,List<Id>> parentRoleToSubRoleIdsMap = new Map<String,List<Id>>();
        for(UserRole rl : currentRolesMap.values()){
            if(rl.ParentRoleId == null){
                parentRoleToSubRoleIdsMap.put('TOP_ROLE',new List<Id>{rl.Id});
            }else{
                List<Id> tempRoles = new List<Id>();
                if(parentRoleToSubRoleIdsMap.containsKey(rl.Id)){
                    
                }
            }
        }
        return roleHierarchy;
    }
    
    /*Id topRoleId;
        List<Id> topRoleIds = new List<Id>();
        Map<Id,UserRole> currentRolesMap = new Map<ID,UserRole>([SELECT Id,Name,DeveloperName,ParentRoleId FROM UserRole]);
        //System.debug('Size:- '+currentRolesMap.size());
        Map<Id,List<RHRole>> roleIdToSubRolesMap = new Map<Id,List<RHRole>>();
        for(UserRole rl : currentRolesMap.values()){
            RHRole role = new RHRole();
            role.mapModel(rl);
            if(rl.ParentRoleId == null){
                topRoleId = rl.Id;
                //topRoleIds.add(rl.Id);
            }else{
                List<RHRole> tempRoles = new List<RHRole>();
                if(roleIdToSubRolesMap.containsKey(rl.Id)){
                    tempRoles = roleIdToSubRolesMap.get(rl.Id);
                }  
                tempRoles.add(role);
                roleIdToSubRolesMap.put(rl.ParentRoleId,tempRoles);
                System.debug('Map:- '+roleIdToSubRolesMap);
            }
        }
        //System.debug('RoleIds:- '+topRoleIds);
        for(Id roleId : topRoleIds){
            RHRole tempRole = new RHRole();
            tempRole.mapModel(currentRolesMap.get(roleId));
            //System.debug('MapValue:- '+roleIdToSubRolesMap.get(roleId));
            tempRole.subRoles = roleIdToSubRolesMap.get(roleId);
            roleHierarchy.subRoles.add(tempRole);
        }*/
    
}