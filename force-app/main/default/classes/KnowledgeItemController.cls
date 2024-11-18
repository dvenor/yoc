public with sharing class KnowledgeItemController {
    @AuraEnabled(cacheable=true)
    public static List<CardData> getCards() {
        return new List<CardData>{
            new CardData('Card 1', 'Description of card 1'),
            new CardData('Card 2', 'Description of card 2'),
            new CardData('Card 3', 'Description of card 3'),
            new CardData('Card 4', 'Description of card 4'),
            new CardData('Card 5', 'Description of card 5'),
            new CardData('Card 6', 'Description of card 6')
        };
    }

    public class CardData {
        @AuraEnabled public String title;
        @AuraEnabled public String description;

        public CardData(String title, String description) {
            this.title = title;
            this.description = description;
        }
    }
}