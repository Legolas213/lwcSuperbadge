public abstract class RHBaseModel {
    
    public abstract String getSObjectName();
    public abstract Map<String,Object> getSObjectFieldMap();    
    public abstract void mapModel(SObject sobj);
    
    public virtual SObject mapSObject() {
        SObject sObj = Schema.getGlobalDescribe().get(getSObjectName()).newSObject();
        Map<String, Object> objectMap = getSObjectFieldMap();
        for (String sObjectField : objectMap.keySet()) {
            sObj.put(sObjectField, objectMap.get(sObjectField));
        }
        return sObj;
    }

}