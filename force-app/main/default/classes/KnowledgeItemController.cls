public with sharing class KnowledgeItemController {

    @AuraEnabled(cacheable=true)
    public static List<PortalKnowledgeItem> getPublishedKnowledgeItems(){
        List<Portal_Knowledge_Item__c> portalItems = [
            SELECT Portal_Knowledge_Category__r.Name, label__c, URL__c
            FROM Portal_Knowledge_Item__c
            WHERE Is_Published__c = true
            ORDER BY Portal_Knowledge_Category__r.Sort_Order__c ASC, Sort_Order__c ASC
        ];

        List<PortalKnowledgeItem> items = new List<PortalKnowledgeItem>();
        for (Portal_Knowledge_Item__c portalItem : portalItems) {
            items.add(new PortalKnowledgeItem(portalItem.Portal_Knowledge_Category__r.Name, portalItem.label__c, portalItem.URL__c));
        }

        return items;
    }

    public class PortalKnowledgeItem {
        @AuraEnabled public String category;
        @AuraEnabled public String label;
        @AuraEnabled public String url;

        public PortalKnowledgeItem(String category, String label, String url) {
            this.category = category;
            this.label = label;
            this.url = url;
        }
    }        
}