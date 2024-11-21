public with sharing class KnowledgeItemController {

    @AuraEnabled(cacheable=true)
    public static List<Card> getCards() {
        // Replace this with your actual logic to fetch data.
        return new List<Card>{
            new Card('Category A', 'Item 1', 'https://example.com/1'),
            new Card('Category A', 'Item 2', 'https://example.com/2'),
            new Card('Category B', 'Item 3', 'https://example.com/3'),
            new Card('Category B', 'Item 4', 'https://example.com/4'),
            new Card('Category A', 'Item 1', 'https://example.com/1'),
            new Card('Category A', 'Item 2', 'https://example.com/2'),
            new Card('Category B', 'Item 3', 'https://example.com/3'),
            new Card('Category B', 'Item 4', 'https://example.com/4'),
            new Card('Category C', 'Item 1', 'https://example.com/1'),
            new Card('Category C', 'Item 2', 'https://example.com/2'),
            new Card('Category C', 'Item 3', 'https://example.com/3'),
            new Card('Category E', 'Item 4', 'https://example.com/4'),
            new Card('Category D', 'Item 1', 'https://example.com/1'),
            new Card('Category F', 'Item 2', 'https://example.com/2'),
            new Card('Category F', 'Item 3', 'https://example.com/3'),
            new Card('Category G', 'Item 4', 'https://example.com/4')
            // new Card(null, 'Item 5', 'https://example.com/5')
        };
    }

    public class Card {
        @AuraEnabled public String category;
        @AuraEnabled public String label;
        @AuraEnabled public String url;

        public Card(String category, String label, String url) {
            this.category = category;
            this.label = label;
            this.url = url;
        }
    }
}